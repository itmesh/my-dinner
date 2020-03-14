import 'package:injectable/injectable.dart';

@singleton
class Session {
  SessionContext _context;

  void initialize(SessionContext context) {
    _context = context;
  }

  bool isLogged() => _context.token != null;

  SessionContext get() => _context;
}

class SessionContext {
  final String _token;

  SessionContext(this._token);

  String get token => _token;
}
