/// Utility class for logging throughout the application
class Logger {
  static const String _prefix = '[MyJanji]';

  static void info(String message, [Object? error, StackTrace? stackTrace]) {
    print('$_prefix [INFO] $message');
    if (error != null) {
      print('Error: $error');
    }
    if (stackTrace != null) {
      print('StackTrace: $stackTrace');
    }
  }

  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    print('$_prefix [WARNING] $message');
    if (error != null) {
      print('Error: $error');
    }
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    print('$_prefix [ERROR] $message');
    if (error != null) {
      print('Error: $error');
    }
    if (stackTrace != null) {
      print('StackTrace: $stackTrace');
    }
  }

  static void debug(String message) {
    print('$_prefix [DEBUG] $message');
  }
}