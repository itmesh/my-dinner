import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/auth/domain/repositories/auth_repository.dart';

@singleton
class PasswordForgotten extends UseCase<bool, PasswordForgottenParams> {
  final AuthRepository authRepository;

  PasswordForgotten(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(PasswordForgottenParams params) async {
    return await authRepository.passwordForgotten(params.email);
  }
}

class PasswordForgottenParams {
  final String email;

  PasswordForgottenParams({this.email});
}
