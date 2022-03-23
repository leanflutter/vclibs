
import 'dart:async';

import 'package:flutter/services.dart';

class Vclibs {
  static const MethodChannel _channel = MethodChannel('vclibs');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
