import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/auth/data/datasources/auth_api.dart';
import 'package:my_dinner/features/auth/data/dtos/auth_response.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';
import 'package:my_dinner/features/auth/domain/repositories/auth_repository.dart';

@RegisterAs(AuthRepository)
@singleton
class AuthRepositoryImp extends AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImp(this.authApi);

  @override
  Future<Either<Failure, String>> login(User user) async {
    try {
      AuthResponse response = await authApi.login(user.toDto());
      return Right(response.token);
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, String>> register(User user) async {
    try {
      AuthResponse response = await authApi.login(user.toDto());
      return Right(response.token);
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> passwordForgotten(String email) async {
    try {
      return Right(await authApi.passwordForgotten(email));
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }
}
