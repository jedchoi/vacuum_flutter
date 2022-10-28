import 'package:logger/logger.dart';

class LoggerWrapper {
  final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0,
        lineLength: 50,
        errorMethodCount: 3,
        colors: true,
        printEmojis: true,
        printTime: false,
        noBoxingByDefault: true),
  );

  void v(String message) {
    logger.i(
        LoggerStackTrace.from(StackTrace.current).toString() + " - " + message);
  }

  void d(String message) {
    logger.d(
        LoggerStackTrace.from(StackTrace.current).toString() + " - " + message);
  }

  void i(String message) {
    logger.v(
        LoggerStackTrace.from(StackTrace.current).toString() + " - " + message);
  }

  void w(String message) {
    logger.w(
        LoggerStackTrace.from(StackTrace.current).toString() + " - " + message);
  }

  void e(String message) {
    logger.e(
        LoggerStackTrace.from(StackTrace.current).toString() + " - " + message);
  }

  void wtf(String message) {
    logger.wtf(
        LoggerStackTrace.from(StackTrace.current).toString() + " - " + message);
  }

  void setLogLevel() {
    Logger.level = Level.debug;
  }

  void saveFile() {}
}

final logger = LoggerWrapper();

void logV(String message) {
  logger.v(message);
}

void logD(String message) {
  logger.d(message);
}

void logI(String message) {
  logger.i(message);
}

void logW(String message) {
  logger.w(message);
}

void logE(String message) {
  logger.e(message);
}

void logWTF(String message) {
  logger.wtf(message);
}

class LoggerStackTrace {
  final String fileName;

  const LoggerStackTrace._({required this.fileName});

  factory LoggerStackTrace.from(StackTrace trace) {
    final frames = trace.toString().split('\n');
    final fileName = _getFilePath(frames[2]);
    return LoggerStackTrace._(fileName: fileName);
  }

  static String _getFilePath(String trace) {
    final indexOfFileName = trace.indexOf(RegExp('^/|(/[a-zA-Z0-9_-]+)+'));
    final fileInfo = trace.substring(indexOfFileName);
    return fileInfo;
  }

  @override
  String toString() {
    return '[$fileName]';
  }
}
