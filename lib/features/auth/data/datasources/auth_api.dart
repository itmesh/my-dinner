import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/utils/demo.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';

abstract class AuthApi {
  Future<String> login(User user);

  Future<User> register(User user);

  Future<bool> passwordForgotten(String email);
}

@RegisterAs(AuthApi)
@singleton
class AuthApiHttp extends AuthApi {
  @override
  Future<String> login(User user) async {
    throw UnimplementedError();
  }

  @override
  Future<User> register(User user) async {
    throw UnimplementedError();
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
  Future<String> login(User user) async {
    await DemoUtils.mediumDelay;
    return 'token';
  }

  @override
  Future<User> register(User user) async {
    await DemoUtils.mediumDelay;
    return user;
  }

  @override
  Future<bool> passwordForgotten(String email) async {
    await DemoUtils.mediumDelay;
    return true;
  }
}
