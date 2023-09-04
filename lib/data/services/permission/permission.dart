import 'package:flutter/material.dart';

abstract class PermissionService {
  Future<bool> handlePhotosPermission();

  Future<bool> handleCameraPermission();
}
