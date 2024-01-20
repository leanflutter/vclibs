import 'package:flutter_test/flutter_test.dart';
import 'package:vclibs/vclibs.dart';
import 'package:vclibs/vclibs_platform_interface.dart';
import 'package:vclibs/vclibs_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVclibsPlatform
    with MockPlatformInterfaceMixin
    implements VclibsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VclibsPlatform initialPlatform = VclibsPlatform.instance;

  test('$MethodChannelVclibs is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVclibs>());
  });

  test('getPlatformVersion', () async {
    Vclibs vclibsPlugin = Vclibs();
    MockVclibsPlatform fakePlatform = MockVclibsPlatform();
    VclibsPlatform.instance = fakePlatform;

    expect(await vclibsPlugin.getPlatformVersion(), '42');
  });
}
