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
  bool registeredUser = false;

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
    error = false;
    either.fold((_) => error = true, (user) {
      locator.get<Context>().initialize(SessionContext(user: user));
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
    error = false;
    registeredUser = null;
    either.fold(
      (_) => error = true,
      (user) => registeredUser = user,
    );
    loading = false;
    notifyListeners();
  }


  void _setLoading(bool enable) {
    loading = enable;
    notifyListeners();
  }
}
