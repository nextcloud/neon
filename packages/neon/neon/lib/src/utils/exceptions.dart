import 'package:flutter/material.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/label_builder.dart';
import 'package:permission_handler/permission_handler.dart';

class NeonExceptionDetails {
  const NeonExceptionDetails({
    required this.getText,
    this.isUnauthorized = false,
  });

  final LabelBuilder getText;
  final bool isUnauthorized;
}

@immutable
abstract class NeonException implements Exception {
  const NeonException();

  NeonExceptionDetails get details;
}

class MissingPermissionException extends NeonException {
  const MissingPermissionException(this.permission);

  final Permission permission;

  @override
  NeonExceptionDetails get details => NeonExceptionDetails(
        getText: (final context) =>
            AppLocalizations.of(context).errorMissingPermission(permission.toString().split('.')[1]),
      );
}
