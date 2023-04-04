import 'dart:io';

import 'package:bloc_cubit_example/core/constants/odin.dart';
import 'package:bloc_cubit_example/core/extension/string.dart';
import 'package:bloc_cubit_example/core/util/device.dart';
import 'package:bloc_cubit_example/core/util/uri.dart';
import 'package:flutter/cupertino.dart';

@immutable
class FlagUtil {
  const FlagUtil._();

  ///Decide feature has to be shown or not
  ///Ex Flag => "denizdentopraga://app?isEnable=false&platform=android&versionCode=2.1.1";
  /// condition: versionNumber must be set to include the given versionNumber and above
  static bool _hasFlagPermission(String flag) {
    if (UriUtil.getQueryParamFromUri(flag, OdinConst.IS_ENABLE) == OdinConst.FALSE) {
      return false;
    }

    if (UriUtil.getQueryParamFromUri(flag, OdinConst.PLATFORM) != OdinConst.All) {
      if (UriUtil.getQueryParamFromUri(flag, OdinConst.PLATFORM) == OdinConst.ANDROID.toLowerCase() && Platform.isIOS) {
        return false;
      } else if (UriUtil.getQueryParamFromUri(flag, OdinConst.PLATFORM) == OdinConst.IOS.toLowerCase() && Platform.isAndroid) {
        return false;
      }
    }

    try {
      final versionCode = UriUtil.getQueryParamFromUri(flag, OdinConst.VERSION_CODE);

      if (versionCode.isNotEmpty && (versionCode.parseInt > int.parse(DeviceUtil.buildNumber ?? '0'))) {
        return false;
      }
    } catch (ex) {
      return false;
    }
    return true;
  }
}
