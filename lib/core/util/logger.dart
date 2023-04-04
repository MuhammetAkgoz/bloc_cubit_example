import 'package:flutter/foundation.dart';

@immutable
class NeoLogger {
  const NeoLogger._();
  static final String _tag = '$NeoLogger : ';

  static void d(String log) {
    _printDebug('$_tag, $log');
  }

  static void e(String log) {
    _printError('$_tag, $log');

    // todo log manager
    /// Send log to firebase
    //CoreLoggerManager.instance?.sendApplicationLog(log);
  }

  static void i(String log) {
    _printInfo('$_tag, $log');
  }

  static void w(String log) {
    _printWarning('$_tag, $log');
  }

  static void _printDebug(String text) {
    debugPrint('\x1B[33m$text\x1B[0m');
  }

  static void _printError(String text) {
    debugPrint('\x1B[31m$text\x1B[0m');
  }

  static void _printWarning(String text) {
    debugPrint('\x1B[36m$text\x1B[0m');
  }

  static void _printInfo(String text) {
    debugPrint('\x1B[34m$text\x1B[0m');
  }
}
