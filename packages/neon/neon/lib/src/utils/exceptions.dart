import 'package:permission_handler/permission_handler.dart';

class MissingPermissionException implements Exception {
  MissingPermissionException(this.permission);

  final Permission permission;
}

class UnableToOpenFileException implements Exception {}

class InvalidQRcodeException implements Exception {}
