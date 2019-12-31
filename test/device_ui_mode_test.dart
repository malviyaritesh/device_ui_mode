import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_ui_mode/device_ui_mode.dart';

void main() {
  const MethodChannel channel = MethodChannel('device_ui_mode');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return DeviceUiModeType.television;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('modeType', () async {
    expect(await DeviceUiMode().modeType, DeviceUiModeType.television);
  });
}
