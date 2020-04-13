import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/my_http_client.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/auth/data/dtos/auth_response.dart';
import 'package:my_dinner/features/auth/data/dtos/user_dto.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';

abstract class AuthApi {
  Future<AuthResponse> login(UserDto user);

  Future<AuthResponse> register(UserDto user);

  Future<bool> passwordForgotten(String email);
}

@RegisterAs(AuthApi, env: Env.dev)
@singleton
class AuthApiHttp extends AuthApi {
  final MyHttpClient client;

  AuthApiHttp(this.client);

  @override
  Future<AuthResponse> login(UserDto user) async {
    return client.post(
      path: '/login',
      body: json.encode(user.toJson()),
      out: (value) => AuthResponse(),
    );
  }

  @override
  Future<AuthResponse> register(UserDto user) async {
    return client.post(
      path: '/register',
      body: json.encode(user.toJson()),
      out: (value) => AuthResponse(),
    );
  }

  @override
  Future<bool> passwordForgotten(String email) {
    throw UnimplementedError();
  }
}

@RegisterAs(AuthApi, env: Env.demo)
@singleton
class AuthApiDemo extends AuthApi {
  @override
  Future<AuthResponse> login(UserDto user) async {
    await DemoUtils.mediumDelay;
    return AuthResponse(
      token: 'token',

    );
  }

  @override
  Future<AuthResponse> register(UserDto user) async {
    await DemoUtils.mediumDelay;
    return AuthResponse(
      token: 'token',
    );
  }

  @override
  Future<bool> passwordForgotten(String email) async {
    await DemoUtils.mediumDelay;
    return true;
  }
}
