import 'package:flutter/foundation.dart';

mixin LoggerMixin {
  void log(String message) {
    debugPrint('[${DateTime.now()}] $message');
  }

  void warn(String message) {
    debugPrint('[${DateTime.now()}] $message');
  }
}
