import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/utils/hex_color.dart';
import 'package:nextcloud/nextcloud.dart';

@internal
const themePrimaryColor = Color(0xFFF37736);

@internal
ThemeData getThemeFromNextcloudTheme(
  final CoreServerCapabilities_Ocs_Data_Capabilities_Theming? nextcloudTheme,
  final Brightness brightness, {
  required final bool keepOriginalAccentColor,
  final bool oledAsDark = false,
}) {
  if (oledAsDark) {
    assert(brightness == Brightness.dark, 'Brightness.dark is required for oledAsDark.');
  }

  final primaryColor = nextcloudTheme?.color != null ? HexColor(nextcloudTheme!.color!) : themePrimaryColor;

  final oledBackgroundOverride = oledAsDark ? Colors.black : null;
  final keepOriginalAccentColorOverride = keepOriginalAccentColor ? primaryColor : null;
  final colorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: brightness,
  ).copyWith(
    background: oledBackgroundOverride,
    primary: keepOriginalAccentColorOverride,
    secondary: keepOriginalAccentColorOverride,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.background,
    cardColor: colorScheme.background, // For LicensePage
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1.5,
      space: 30,
    ),
  );
}
