import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/config/host_config.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/log.dart';

@Environment(Env.dev)
@singleton
class MyHttpClient {
  static const int _minClientId = 100000;
  static const int _maxClientId = 999999;

  final Log _log = Log('MyHttpClient');
  final Random _random = Random();
  final HostConfig hostConfig;
  final _Session session = _Session();
  final List<HttpErrorHandler> httpErrorHandlers = [];

  MyHttpClient(this.hostConfig);

  Future<T> post<T>({
    String path,
    Map<String, String> headers,
    String body,
    T out(dynamic json),
  }) async {
    _log.debug('POST $path');
    return _withHttpClient(
      (client) => client
          .postUrl(Uri.parse(hostConfig.baseUrl + path))
          .then((HttpClientRequest request) =>
              _prepareRequestWithBody(request, body, headers))
          .then((HttpClientResponse response) =>
              _onResponseHandler(response, out))
          .catchError((error) => _onErrorResponseHandler(error)),
    );
  }

  Future<T> get<T>({
    String path,
    Map<String, String> headers,
    T out(dynamic json),
  }) async {
    _log.debug('GET $path');
    return _withHttpClient(
      (client) => client
          .getUrl(Uri.parse(hostConfig.baseUrl + path))
          .then(
              (HttpClientRequest request) => _prepareRequest(request, headers))
          .then((HttpClientResponse response) =>
              _onResponseHandler(response, out))
          .catchError((error) => _onErrorResponseHandler(error)),
    );
  }

  Future<T> put<T>({
    String path,
    Map<String, String> headers,
    String body,
    T out(dynamic json),
  }) async {
    _log.debug('PUT $path');
    return _withHttpClient(
      (client) => client
          .putUrl(Uri.parse(hostConfig.baseUrl + path))
          .then((HttpClientRequest request) =>
              _prepareRequestWithBody(request, body, headers))
          .then((HttpClientResponse response) =>
              _onResponseHandler(response, out))
          .catchError((error) => _onErrorResponseHandler(error)),
    );
  }

  Future<T> patch<T>({
    String path,
    Map<String, String> headers,
    String body,
    T out(dynamic json),
  }) async {
    _log.debug('PATCH $path');
    return _withHttpClient(
      (client) => client
          .patchUrl(Uri.parse(hostConfig.baseUrl + path))
          .then((HttpClientRequest request) =>
              _prepareRequestWithBody(request, body, headers))
          .then((HttpClientResponse response) =>
              _onResponseHandler(response, out))
          .catchError((error) => _onErrorResponseHandler(error)),
    );
  }

  Future<T> delete<T>({
    String path,
    Map<String, String> headers,
    String body,
    T out(dynamic json),
  }) async {
    _log.debug('DELETE $path');
    return _withHttpClient((client) => client
        .deleteUrl(Uri.parse(hostConfig.baseUrl + path))
        .then((HttpClientRequest request) =>
            _prepareRequestWithBody(request, body, headers))
        .then(
            (HttpClientResponse response) => _onResponseHandler(response, out))
        .catchError((error) => _onErrorResponseHandler(error)));
  }

  Future<HttpClientResponse> _prepareRequestWithBody(
      HttpClientRequest request, String body, Map<String, String> headers) {
    _addHeaders(
      httpHeaders: request.headers,
      headersMap: headers,
      addContentType: true,
    );
    request.write(body);
    return request.close();
  }

  Future<HttpClientResponse> _prepareRequest(
      HttpClientRequest request, Map<String, String> headers) {
    _addHeaders(httpHeaders: request.headers, headersMap: headers);
    return request.close();
  }

  void _addHeaders({
    HttpHeaders httpHeaders,
    Map<String, String> headersMap,
    bool addContentType = true,
  }) {
    Map<String, String> allHeaders = {
      HttpHeaders.acceptHeader: 'application/json',
    };
    if (addContentType) {
      allHeaders.putIfAbsent(
        HttpHeaders.contentTypeHeader,
        () => 'application/json',
      );
    }
    if (headersMap != null) {
      allHeaders.addAll(headersMap);
    }

    if (session.cookies != null) {
      allHeaders[HttpHeaders.cookieHeader] = session.cookies;
      _log.debug('cookies: ${session.cookies}');
    }

    if (session.bearerToken != null) {
      allHeaders[_Session.authorization] = session.bearerToken;
    }

    allHeaders.forEach((key, value) => httpHeaders.add(key, value));
  }

  Future<T> _withHttpClient<T>(Future<T> Function(HttpClient) function) async {
    final int clientId =
        _minClientId + _random.nextInt(_maxClientId - _minClientId);

    HttpClient client = HttpClient();
    _log.debug('HttpClient with id $clientId has been created.');

    try {
      return Future.value(await function(client));
    } finally {
      client.close();
      _log.debug('HttpClient with id $clientId has been closed.');
    }
  }

  Future<T> _onResponseHandler<T>(
      HttpClientResponse response, T out(dynamic json)) async {
    try {
      await _checkStatusCode(response);
      await _checkContentType(response);

      return out(await _prepareResponse(response));
    } finally {
      session.updateBearerToken(response.headers);
    }
  }

  _prepareResponse(HttpClientResponse response) async {
    if (_isTextOrJsonResponse(response)) {
      String data = await _parseBody(response);
      _log.debug('response=$data');

      if (data == null || data.isEmpty) {
        return null;
      }

      if (_isJsonResponse(response)) {
        return json.decode(data);
      } else {
        return data;
      }
    } else {
      return await consolidateHttpClientResponseBytes(response);
    }
  }

  bool _isJsonResponse(HttpClientResponse response) => response.headers
      .value(HttpHeaders.contentTypeHeader)
      .contains('application/json');

  Future<String> _parseBody(HttpClientResponse response) async {
    return await response
        .map((t) => utf8.decode(t, allowMalformed: true))
        .join();
  }

  void _onErrorResponseHandler(dynamic error) {
    _log.error('$error');
    if (!(error is HttpInvalidResponseException)) {
      error = HttpClientException(error);
    }
    for (HttpErrorHandler handler in httpErrorHandlers) {
      handler(error);
    }
    throw error;
  }

  Future<void> _checkContentType(HttpClientResponse response) async {
    bool contentNotEmpty = response.contentLength > 0;

    if (!(_isTextOrJsonResponse(response)) && contentNotEmpty) {
      throw HttpInvalidContentTypeException(
        response.headers.value(HttpHeaders.contentTypeHeader),
        message: await _parseBody(response),
      );
    }
  }

  bool _isTextOrJsonResponse(HttpClientResponse response) {
    String contentTypeHeader =
        response.headers.value(HttpHeaders.contentTypeHeader);
    return contentTypeHeader.contains('application/json') ||
        contentTypeHeader.contains('text/plain');
  }

  Future<void> _checkStatusCode(HttpClientResponse response) async {
    if (!_acceptableResponseStatus.contains(response.statusCode)) {
      throw HttpStatusException(response.statusCode,
          message: await _parseBody(response));
    }
  }
}

class _Session {
  static const String authorization = 'Authorization';

  final Map<String, String> _cookies = {};

  String _bearerToken;

  String get bearerToken => _bearerToken;

  String get cookies {
    if (_cookies.isEmpty) return null;

    return _cookies.values?.reduce((cookie, v) => '$cookie;$v');
  }

  updateBearerToken(HttpHeaders headers) {
    var tokens = headers[authorization];

    if (tokens != null) {
      _bearerToken = tokens[0];
    }
  }
}

abstract class HttpInvalidResponseException {
  final String message;

  const HttpInvalidResponseException(this.message);
}

class HttpInvalidContentTypeException extends HttpInvalidResponseException {
  final String type;

  const HttpInvalidContentTypeException(this.type, {message}) : super(message);

  @override
  String toString() {
    return 'InvalidContentTypeException{type: $type, message: $message}';
  }
}

typedef HttpErrorHandler = void Function(dynamic error);

class HttpClientException {
  final dynamic error;

  const HttpClientException(this.error);
}

class HttpStatusException extends HttpInvalidResponseException {
  final String message;
  final int statusCode;

  const HttpStatusException(this.statusCode, {this.message = ''})
      : super(message);

  String toString() => 'HttpStatusException $statusCode: $message';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HttpStatusException &&
          runtimeType == other.runtimeType &&
          statusCode == other.statusCode;

  @override
  int get hashCode => statusCode.hashCode;
}

const List<int> _acceptableResponseStatus = [
  HttpStatus.accepted,
  HttpStatus.ok,
  HttpStatus.created
];

