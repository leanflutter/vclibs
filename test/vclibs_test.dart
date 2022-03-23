import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vclibs/vclibs.dart';

void main() {
  const MethodChannel channel = MethodChannel('vclibs');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Vclibs.platformVersion, '42');
  });
}
