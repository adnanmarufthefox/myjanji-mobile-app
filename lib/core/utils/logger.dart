import 'package:flutter/foundation.dart';

/// Utility class for logging throughout the application
class Logger {
  static const String _prefix = '[MyJanji]';

  static void info(String message, [Object? error, StackTrace? stackTrace]) {
    debugPrint('$_prefix [INFO] $message');
    if (error != null) {
      debugPrint('Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('StackTrace: $stackTrace');
    }
  }

  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    debugPrint('$_prefix [WARNING] $message');
    if (error != null) {
      debugPrint('Error: $error');
    }
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    debugPrint('$_prefix [ERROR] $message');
    if (error != null) {
      debugPrint('Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('StackTrace: $stackTrace');
    }
  }

  static void debug(String message) {
    debugPrint('$_prefix [DEBUG] $message');
  }
}