import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/auth_service.dart';

@singleton
class Session {
  final AuthService authService;
  SessionContext _context;

  Session(this.authService);

  Future<void> initialize(SessionContext context) async {
    _context = context;
    String token = context.token;
    if (token != null && token.isNotEmpty) {
      await authService.saveToken(token);
    }
  }

  bool isLogged() => _context?.token != null;

  SessionContext get() => _context;

  Future<void> logout() async {
    await authService.removeToken();
    _context = null;
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
