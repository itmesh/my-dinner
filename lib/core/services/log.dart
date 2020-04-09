import 'package:logging/logging.dart';

class Log {
  static void config({bool enabled = true}) {
    Logger.root.clearListeners();
    Logger.root.level = enabled ? Level.ALL : Level.OFF;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.time}: ${_levelName(rec.level).padRight(5)}: ${rec.loggerName}: ${rec.message}');
    });
  }

  Logger _logger;

  Log._(this._logger);

  factory Log(String name) {
    return Log._(Logger(name));
  }

  void debug(String message) {
    _logger.fine(message);
  }

  void warn(String message,[Object error, StackTrace stackTrace]) {
    _logger.warning(message, error, stackTrace);
  }

  void error(String message,[Object error, StackTrace stackTrace]) {
    _logger.shout(message, error, stackTrace);
  }

  void info(String message) {
    _logger.info(message);
  }

  static String _levelName(Level level) {
    if (level > Level.WARNING) {
      return "ERROR";
    }
    if (level > Level.INFO) {
      return "WARN";
    }
    if (level > Level.FINE) {
      return "INFO";
    }
    return "DEBUG";
  }
}