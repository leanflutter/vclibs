import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'vclibs_method_channel.dart';

abstract class VclibsPlatform extends PlatformInterface {
  /// Constructs a VclibsPlatform.
  VclibsPlatform() : super(token: _token);

  static final Object _token = Object();

  static VclibsPlatform _instance = MethodChannelVclibs();

  /// The default instance of [VclibsPlatform] to use.
  ///
  /// Defaults to [MethodChannelVclibs].
  static VclibsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VclibsPlatform] when
  /// they register themselves.
  static set instance(VclibsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
