import 'package:either_option/either_option.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/features/auth/domain/usecases/password_forgotten.dart';

@injectable
class PasswordForgottenProvider with ChangeNotifier {
  final PasswordForgotten passwordForgotten;

  bool error = false;
  bool loading = false;
  bool passwordForgottenSuccess = false;
  bool showEmailNotFound = false;

  PasswordForgottenProvider(this.passwordForgotten);

  void requestPasswordForgotten(String email) async {
    _setLoading(true);
    Either either = await passwordForgotten(PasswordForgottenParams(
      email: email,
    ));
    _eitherForgottenOrError(either);
  }

  void _eitherForgottenOrError(Either either) {
    error = false;
    showEmailNotFound = false;
    passwordForgottenSuccess = false;
    either.fold((_) {
      error = true;
    }, (emailFound) {
      if (emailFound) {
        passwordForgottenSuccess = true;
      } else {
        showEmailNotFound = true;
      }
    });
    loading = false;
    notifyListeners();
  }

  void _setLoading(bool enable) {
    loading = enable;
    notifyListeners();
  }
}
