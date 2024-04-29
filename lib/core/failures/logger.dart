import 'package:logger/logger.dart';

abstract interface class Log {
  static final Logger _logger = Logger();

  static void debug(String message) => _logger.d(message);
  static void info(String message) => _logger.i(message);
  static void warn(String message) => _logger.w(message);
  static void error(String message) => _logger.e(message);
  static void fatal(String message) => _logger.f(message);
}
