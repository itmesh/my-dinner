import 'package:injectable/injectable.dart';
import 'package:my_dinner/features/auth/domain/models/user.dart';

@singleton
class Context {
  SessionContext _context;

  void initialize(SessionContext context) {
    _context = context;
  }

  SessionContext get() => _context;
}

class SessionContext {
  final User user;

  SessionContext({this.user});
}
