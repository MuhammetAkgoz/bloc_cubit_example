import 'package:permission_handler/permission_handler.dart';

abstract class BasePermission {
  Permission permission;
  String? permissionTitle;
  String? permissionMessage;
  String? icon;
  bool isMandatory;

  BasePermission({
    required this.permission,
    this.permissionTitle,
    this.permissionMessage,
    this.icon,
    this.isMandatory = true,
  });

  BasePermission.calendar({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.calendar,
        isMandatory = isMandatory ?? true;

  BasePermission.camera({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.camera,
        isMandatory = isMandatory ?? true;

  BasePermission.contacts({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.contacts,
        isMandatory = isMandatory ?? true;

  BasePermission.location({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.location,
        isMandatory = isMandatory ?? true;

  BasePermission.locationAlways({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.locationAlways,
        isMandatory = isMandatory ?? true;

  BasePermission.locationWhenInUse({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.locationWhenInUse,
        isMandatory = isMandatory ?? true;

  BasePermission.mediaLibrary({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.mediaLibrary,
        isMandatory = isMandatory ?? true;

  BasePermission.microphone({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.microphone,
        isMandatory = isMandatory ?? true;

  BasePermission.phone({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.phone,
        isMandatory = isMandatory ?? true;

  BasePermission.photos({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.photos,
        isMandatory = isMandatory ?? true;

  BasePermission.sensors({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.sensors,
        isMandatory = isMandatory ?? true;

  BasePermission.storage({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.storage,
        isMandatory = isMandatory ?? true;

  BasePermission.notification({
    required String this.permissionTitle,
    required String this.permissionMessage,
    bool? isMandatory,
  })  : permission = Permission.notification,
        isMandatory = isMandatory ?? true;

  @override
  bool operator ==(Object other) => other is BasePermission && permission == other.permission;

  @override
  int get hashCode => super.hashCode;
}
