part of '../neon.dart';

class MissingPermissionException implements Exception {
  MissingPermissionException(this.permission);

  final Permission permission;
}
