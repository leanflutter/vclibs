import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'vclibs_platform_interface.dart';

/// An implementation of [VclibsPlatform] that uses method channels.
class MethodChannelVclibs extends VclibsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('vclibs');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
