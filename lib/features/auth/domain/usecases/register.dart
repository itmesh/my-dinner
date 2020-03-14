import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';
import 'package:my_dinner/features/auth/domain/repositories/auth_repository.dart';

@singleton
class Register extends UseCase<User, RegisterParams> {
  final AuthRepository authRepository;

  Register({this.authRepository});

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await authRepository.register(params.user);
  }
}

class RegisterParams {
  final User user;

  RegisterParams({this.user});
}
