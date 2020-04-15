import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/auth_service.dart';

@singleton
class Session {
  final AuthService _authService;
  SessionContext _context;

  Session(this._authService);

  Future<void> initialize(SessionContext context, {saveToken = true}) async {
    _context = context;
    String token = context.token;
    if (token != null && token.isNotEmpty) {
      await _authService.saveToken(token);
    }
  }

  bool isLogged() => _context?.token != null;

  SessionContext get() => _context;

  Future<void> logout() async {
    await _authService.removeToken();
    _context = null;
  }

  Future<bool> initFromPreferences() async {
    String token = await _authService.getToken();
    if (token != null) {
      await initialize(SessionContext(token: token), saveToken: false);
      return true;
    } else {
      return false;
    }
  }
}

class SessionContext {
  final String token;

  SessionContext({this.token});

  SessionContext copyWith({
    String token,
  }) {
    return SessionContext(
      token: token ?? this.token,
    );
  }
}
