import 'package:bloc_cubit_example/core/navigation/navigation_handler.dart';
import 'package:bloc_cubit_example/core/permission/IPermissionCallback.dart';
import 'package:bloc_cubit_example/core/permission/base_permission.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_helper.dart';

abstract class IPermissionManager {
  late PermissionHelper permissionHelper;

  Future<bool> check(BasePermission permissions);

  Future<void> checkAndRequest(String title, List<BasePermission> permissions,
      {bool isShowView = false, bool showMaybeLater = false});

  Future<void> request(String title, List<BasePermission> permissions, bool isShowView, bool showMaybeLater);

  Future<void> openAppSettings();
}
