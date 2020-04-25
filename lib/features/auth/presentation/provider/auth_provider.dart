import 'package:either_option/either_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/context.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';
import 'package:my_dinner/features/auth/domain/usecases/login.dart';
import 'package:my_dinner/features/auth/domain/usecases/register.dart';

@injectable
class AuthProvider with ChangeNotifier {
  final _log = Log('AuthProvider');
  final Login login;
  final Register register;
  final Session session;

  bool loading = false;
  bool registerSuccess = false;
  bool loginSuccess = false;
  bool registerError = false;
  bool loginError = false;

  AuthProvider(this.login, this.register, this.session);

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
    either.fold(
      (_) => loginError = true,
      (sessionContext) {
        session.initialize(sessionContext);
        loginSuccess = true;
      },
    );
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
      (_) => registerError = true,
      (token) {
        session.initialize(SessionContext(token: token));
        registerSuccess = true;
      },
    );
    loading = false;
    notifyListeners();
  }

  void _setLoading(bool enable) {
    registerSuccess = false;
    loginSuccess = false;
    loginError = false;
    registerError = false;
    loading = enable;
    notifyListeners();
  }
}
