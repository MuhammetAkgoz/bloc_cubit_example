import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neo_flutter_base/core/storage/enum/resource_key.dart';
import 'package:neo_flutter_base/core/storage/resource/resource_manager.dart';

class ImageUtil {
  static Future<String?> cropper(XFile photo, {bool onlySquareCrop = false}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: photo.path,
      aspectRatioPresets: onlySquareCrop
          ? [CropAspectRatioPreset.square]
          : [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: ResourceManager.instance?.getResource(ResourceKey.cropper_title),
            hideBottomControls: true,
            toolbarColor: Colors.lightGreen,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: ResourceManager.instance?.getResource(ResourceKey.cropper_title),
        ),
      ],
    );

    return croppedFile?.path;
  }
}
