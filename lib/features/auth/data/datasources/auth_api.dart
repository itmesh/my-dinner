import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/my_http_client.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/auth/data/dtos/login_response.dart';
import 'package:my_dinner/features/auth/data/dtos/register_response.dart';
import 'package:my_dinner/features/auth/data/dtos/user_dto.dart';

abstract class AuthApi {
  Future<LoginResponse> login(UserDto user);

  Future<RegisterResponse> register(UserDto user);

  Future<bool> passwordForgotten(String email);
}

@RegisterAs(AuthApi, env: Env.dev)
@singleton
class AuthApiHttp extends AuthApi {
  final MyHttpClient client;

  AuthApiHttp(this.client);

  @override
  Future<LoginResponse> login(UserDto user) async {
    return client.post(
      path: '/login',
      body: user.toJson(),
      out: (value) => LoginResponse.fromJson(value),
    );
  }

  @override
  Future<RegisterResponse> register(UserDto user) async {
    return client.post(
      path: '/register/client',
      body: user.toJson(),
      out: (value) => RegisterResponse.fromJson(value),
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
  Future<LoginResponse> login(UserDto user) async {
    await DemoUtils.mediumDelay;
    return LoginResponse(
      token: 'token',
    );
  }

  @override
  Future<RegisterResponse> register(UserDto user) async {
    await DemoUtils.mediumDelay;
    return RegisterResponse(
      token: 'token',
    );
  }

  @override
  Future<bool> passwordForgotten(String email) async {
    await DemoUtils.mediumDelay;
    return true;
  }
}
