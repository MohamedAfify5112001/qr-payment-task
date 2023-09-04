import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_demo/data/services/permission/permission.dart';

class PermissionHandlerPermissionService implements PermissionService {
  @override
  Future<bool> handleCameraPermission() async {
    PermissionStatus cameraPermissionStatus = await requestCameraPermission();
    if (cameraPermissionStatus != PermissionStatus.granted) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> handlePhotosPermission() async {
    PermissionStatus photoPermissionStatus = await requestPhotosPermission();
    if (photoPermissionStatus != PermissionStatus.granted) {
      return false;
    }
    return true;
  }

  Future<PermissionStatus> requestCameraPermission() async {
    if (Platform.isAndroid) {
      return await Permission.camera.status;
    }
    return await Permission.photos.status;
  }

  Future<PermissionStatus> requestPhotosPermission() async {
    if (Platform.isAndroid) {
      return await Permission.storage.status;
    }
    return await Permission.photos.status;
  }
}
