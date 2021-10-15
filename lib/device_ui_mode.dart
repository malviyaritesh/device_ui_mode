import 'dart:async';

import 'package:flutter/services.dart';

class DeviceUiMode {
  static const MethodChannel _channel =
      const MethodChannel('com.owliverse/device_ui_mode');

  /// No work is done when instantiating the plugin. It's safe to call this
  /// repeatedly or in performance-sensitive blocks.
  DeviceUiMode();

  /// This information does not change from call to call. Cache it.
  int? _cachedModeType;

  Future<int?> get modeType async =>
      _cachedModeType ??= await _channel.invokeMethod('getDeviceUiMode');
}

/// Ui mode type values derived from `android.content.res.Configuration`
///
/// See: https://developer.android.com/reference/android/content/res/Configuration
class DeviceUiModeType {
  static const int undefined = 0;
  static const int normal = 1;
  static const int desk = 2;
  static const int car = 3;
  static const int television = 4;
  static const int appliance = 5;
  static const int watch = 6;
  static const int vrHeadset = 7;
  static const int mask = 15;
}
