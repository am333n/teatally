import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Returns a unique device ID
  Future<String?> getDeviceId() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      return androidInfo
          .id; // Android unique ID (not always stable across reset)
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // Unique ID for iOS device
    }
    return null;
  }

  /// Returns the device name (like "samsung", "apple")
  Future<String?> getDeviceName() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.brand; // e.g. "samsung"
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.name; // Device name set by user, e.g. "Ameen’s iPhone"
    }
    return null;
  }

  /// Returns the model name (like "SM-S918B" or "iPhone15,2")
  Future<String?> getDeviceModel() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.model; // e.g. "SM-S918B"
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.utsname.machine; // e.g. "iPhone15,2"
    }
    return null;
  }
}
