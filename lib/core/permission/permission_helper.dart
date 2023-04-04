part of 'IPermissionManager.dart';

class PermissionHelper {
  final IPermissionCallback _callback;

  PermissionHelper(this._callback);

  Future<bool> request(List<BasePermission> neoPermissions, bool isShowView) async {
    final deniedPermissions = <BasePermission>[];

    for (final neo in neoPermissions) {
      final status = await neo.permission.request();
      if (!status.isGranted && neo.isMandatory) {
        deniedPermissions.add(neo);
      }
    }

    if (deniedPermissions.isEmpty) {
      if (isShowView) {
        NavigationHandler.instance.pop(data: true);
      }
      _callback.onPermissionSuccess();
      return true;
    } else {
      if (isShowView) {
        NavigationHandler.instance.pop(data: false);
      }
      _callback.onPermissionDenied(deniedPermissions);
      return false;
    }
  }

  Future<List<BasePermission>> check(List<BasePermission> permissions) async {
    final deniedPermissions = <BasePermission>[];

    for (final neo in permissions) {
      await neo.permission.status.then((value) {
        if (value.isDenied || value.isPermanentlyDenied) {
          deniedPermissions.add(neo);
        }
      });
    }

    if (deniedPermissions.isEmpty) {
      _callback.onPermissionSuccess();
    }
    return deniedPermissions;
  }

  static Future<bool> checkPermissionState(BasePermission permission) async {
    return permission.permission.status.then((value) {
      if (value.isDenied || value.isPermanentlyDenied) {
        return false;
      }
      return true;
    });
  }
}
