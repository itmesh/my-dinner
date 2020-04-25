import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/context.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, SessionContext>> login(User user);

  Future<Either<Failure, String>> register(User user);

  Future<Either<Failure, bool>> passwordForgotten(String email);
}
