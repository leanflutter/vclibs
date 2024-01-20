import 'vclibs_platform_interface.dart';

class Vclibs {
  Future<String?> getPlatformVersion() {
    return VclibsPlatform.instance.getPlatformVersion();
  }
}
