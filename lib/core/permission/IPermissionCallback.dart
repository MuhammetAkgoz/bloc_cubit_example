import 'package:bloc_cubit_example/core/permission/base_permission.dart';

abstract class IPermissionCallback {
  void onPermissionSuccess();
  void onPermissionDenied(List<BasePermission> deniedPermissions);
}
