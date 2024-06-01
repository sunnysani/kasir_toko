import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfo {
  static late TargetPlatform platform;
  static late String uniqueIdentifier;

  static Future<void> start() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    platform = defaultTargetPlatform;

    switch (platform) {
      case TargetPlatform.android:
        uniqueIdentifier = (await deviceInfo.androidInfo).serialNumber;
        break;
      case TargetPlatform.iOS:
        uniqueIdentifier =
            (await deviceInfo.iosInfo).identifierForVendor ?? 'unknown';
        break;
      case TargetPlatform.macOS:
        uniqueIdentifier = (await deviceInfo.macOsInfo).systemGUID ?? 'unknown';
        break;
      case TargetPlatform.windows:
        uniqueIdentifier = (await deviceInfo.windowsInfo).deviceId;
        break;
      case TargetPlatform.linux:
        uniqueIdentifier = (await deviceInfo.linuxInfo).machineId ?? 'unknown';
        break;
      default:
        uniqueIdentifier = 'unknown';
    }
  }
}
