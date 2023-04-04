import 'dart:io';
import 'package:bloc_cubit_example/core/constants/odin.dart';
import 'package:bloc_cubit_example/core/util/string.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:huawei_hmsavailability/huawei_hmsavailability.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:safe_device/safe_device.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DeviceUtil {
  static String? id;
  static String? name;
  static String? model;
  static String? brand;
  static String? systemVersion;
  static String? appVersion;
  static String? buildNumber;
  static bool isHMSAvailable = false;
  static bool isGMSAvailable = true;
  static bool isRootAvailability = false;

  static Future<void> init() async {
    final gmsAvailability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();
    final packageInfo = await PackageInfo.fromPlatform();
    final prefs = await SharedPreferences.getInstance();

    appVersion = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    isRootAvailability = await SafeDevice.isJailBroken;
    id = prefs.getString(OdinConst.DEVICE_ID);

    if (StringUtil.isNullOrEmpty(id)) {
      id = const Uuid().v1();
      await prefs.setString(OdinConst.DEVICE_ID, id!);
    }

    final device = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final isAvailableHms = await HmsApiAvailability().isHMSAvailable();
      final android = await device.androidInfo;
      name = OdinConst.ANDROID;
      model = android.model;
      brand = android.brand;
      systemVersion = android.version.baseOS;
      isHMSAvailable = isAvailableHms == 0;
      isGMSAvailable = gmsAvailability.value == 0;
    }
    if (Platform.isIOS) {
      final ios = await device.iosInfo;
      name = OdinConst.IOS;
      model = ios.model;
      brand = ios.systemName;
      systemVersion = ios.systemVersion;
    }
  }
}
