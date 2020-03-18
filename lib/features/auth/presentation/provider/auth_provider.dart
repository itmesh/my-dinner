import 'package:either_option/either_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/context.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';
import 'package:my_dinner/features/auth/domain/usecases/login.dart';
import 'package:my_dinner/features/auth/domain/usecases/register.dart';

@injectable
class AuthProvider with ChangeNotifier {
  final Login login;
  final Register register;

  bool error = false;
  bool loading = false;
  bool registerSuccess = false;
  bool loginSuccess = false;

  AuthProvider(this.login, this.register);

  void loginUser(String email, String password) async {
    _setLoading(true);
    Either eitherLoginOrError = await login(
      LoginParams(
        user: User(
          email: email,
          password: password,
        ),
      ),
    );
    _eitherLoginOrError(eitherLoginOrError);
  }

  void _eitherLoginOrError(Either either) {
    either.fold((_) => error = true, (token) {
      locator.get<Session>().initialize(SessionContext(token));
      loginSuccess = true;
    });
    loading = false;
    notifyListeners();
  }

  void registerUser(String email, String password) async {
    _setLoading(true);
    Either eitherRegisterOrError = await register(
      RegisterParams(
        user: User(
          email: email,
          password: password,
        ),
      ),
    );
    _eitherRegisterOrError(eitherRegisterOrError);
  }

  void _eitherRegisterOrError(Either either) {
    either.fold(
      (_) => error = true,
      (user) => registerSuccess = true,
    );
    loading = false;
    notifyListeners();
  }

  void _setLoading(bool enable) {
    error = false;
    registerSuccess = false;
    loginSuccess = false;
    loading = enable;
    notifyListeners();
  }
}
