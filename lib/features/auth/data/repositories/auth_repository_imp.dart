import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:my_dinner/features/auth/data/datasources/auth_api.dart';
import 'package:my_dinner/features/auth/data/dtos/login_response.dart';
import 'package:my_dinner/features/auth/data/dtos/register_response.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';
import 'package:my_dinner/features/auth/domain/repositories/auth_repository.dart';

@RegisterAs(AuthRepository)
@singleton
class AuthRepositoryImp extends AuthRepository {
  final _log = Log('AuthRepositoryImp');
  final AuthApi authApi;

  AuthRepositoryImp(this.authApi);

  @override
  Future<Either<Failure, String>> login(User user) async {
    try {
      LoginResponse response = await authApi.login(user.toDto());
      _checkToken(response.token);
      return Right(response.token);
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, String>> register(User user) async {
    try {
      RegisterResponse response = await authApi.register(user.toDto());
      _checkToken(response.token);
      return Right(response.token);
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }

  void _checkToken(String token) {
    if (token == null || token.isEmpty) {
      throw Exception('no token in response');
    }
  }

  @override
  Future<Either<Failure, bool>> passwordForgotten(String email) async {
    try {
      return Right(await authApi.passwordForgotten(email));
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }
}
