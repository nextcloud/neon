import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';

/// Returns whether the current platform of the current theme is a Cupertino one.
///
/// This is true for both `TargetPlatform.iOS` and `TargetPlatform.macOS`.
/// Use [isCupertinoPlatform] to check against the platform on which the
/// framework is currently executing.
bool isCupertino(BuildContext context) {
  final theme = Theme.of(context);

  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return false;
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return true;
  }
}

/// Returns whether the current platform on which the framework is currently
/// executing is a Cupertino one.
///
/// This is true for both `TargetPlatform.iOS` and `TargetPlatform.macOS`.
/// Use [isCupertino] to check against the platform of the current theme.
bool isCupertinoPlatform() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return false;
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return true;
  }
}
