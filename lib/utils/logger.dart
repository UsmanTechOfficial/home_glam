import 'package:flutter/foundation.dart';

class Logger {
  static void e(
    dynamic message,
  ) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print('[ERROR] [${_getCallingMethodName(stackTrace)}]: $message');
    }
  }

  static void d(
    dynamic message,
  ) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print('[DEBUG] [${_getCallingMethodName(stackTrace)}]: $message');
    }
  }

  static void i(
    dynamic message,
  ) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print('[INFO] [${_getCallingMethodName(stackTrace)}]: $message');
    }
  }

  static void w(
    dynamic message,
  ) {
    if (kDebugMode) {
      var stackTrace = StackTrace.current;
      print('[WARNING] [${_getCallingMethodName(stackTrace)}]: $message');
    }
  }

  static String _getCallingMethodName(StackTrace stackTrace) {
    var stackTraceLines = stackTrace.toString().split('\n');
    if (stackTraceLines.length > 2) {
      // Extract the method name from the third line
      var methodName = stackTraceLines[2].trim();
      // // Remove the leading 'at ' from the method name
      // methodName = methodName.substring(3);
      // Extract only the method name without the class and parameters
      return methodName.split('(')[0];
    }
    return 'Unknown method';
  }
}
