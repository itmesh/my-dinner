import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/context.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';
import 'package:my_dinner/features/auth/domain/repositories/auth_repository.dart';

@singleton
class Login extends UseCase<SessionContext, LoginParams> {
  final AuthRepository authRepository;

  Login(this.authRepository);

  @override
  Future<Either<Failure, SessionContext>> call(LoginParams params) async {
    return await authRepository.login(params.user);
  }
}

class LoginParams {
  final User user;

  LoginParams({this.user});
}
