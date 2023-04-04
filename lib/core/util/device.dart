import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:huawei_hmsavailability/huawei_hmsavailability.dart';
import 'package:neo_flutter_base/core/storage/memento.dart';
import 'package:neo_flutter_base/core/util/string.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:safe_device/safe_device.dart';
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

  static init() async {
    GooglePlayServicesAvailability gmsAvailability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    isRootAvailability = await SafeDevice.isJailBroken;
    id = await Memento.instance?.getDeviceID();
    if (StringUtil.isNullOrEmpty(id)) {
      id = const Uuid().v1();
      await Memento.instance?.setDeviceID(id);
    }

    DeviceInfoPlugin device = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      int isAvailableHms = await HmsApiAvailability().isHMSAvailable();
      AndroidDeviceInfo android = await device.androidInfo;
      name = "Android";
      model = android.model;
      brand = android.brand;
      systemVersion = android.version.baseOS;
      isHMSAvailable = isAvailableHms == 0;
      isGMSAvailable = gmsAvailability.value == 0;
    }
    if (Platform.isIOS) {
      IosDeviceInfo ios = await device.iosInfo;
      name = "iOS";
      model = ios.model;
      brand = ios.systemName;
      systemVersion = ios.systemVersion;
    }
  }
}
