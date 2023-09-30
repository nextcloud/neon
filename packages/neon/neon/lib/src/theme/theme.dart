import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/theme/colors.dart';
import 'package:neon/src/theme/neon.dart';
import 'package:neon/src/utils/hex_color.dart';
import 'package:nextcloud/core.dart' as core;

/// Custom theme used for the Neon app.
@internal
@immutable
class AppTheme {
  /// Creates a new Neon app theme.
  const AppTheme(
    this.nextcloudTheme, {
    required this.neonTheme,
    final bool keepOriginalAccentColor = false,
    this.oledAsDark = false,
    this.appThemes,
  }) : keepOriginalAccentColor = nextcloudTheme == null || keepOriginalAccentColor;

  /// The theme provided by Nextcloud.
  final core.ThemingPublicCapabilities_Theming? nextcloudTheme;

  /// Whether to force the use of the Nextcloud accent color.
  final bool keepOriginalAccentColor;

  /// Whether to use [Colors.black] in the dark theme.
  final bool oledAsDark;

  /// The theme extensions provided by the `AppImplementation`s.
  final Iterable<ThemeExtension>? appThemes;

  /// The base theme for the Neon app.
  final NeonTheme neonTheme;

  ColorScheme _buildColorScheme(final Brightness brightness) {
    final primary = nextcloudTheme?.color != null ? HexColor(nextcloudTheme!.color) : neonTheme.colorScheme.primary;
    final keepOriginalAccentColorOverride = keepOriginalAccentColor ? primary : null;
    final oledBackgroundOverride = oledAsDark && brightness == Brightness.dark ? NcColors.oledBackground : null;

    return ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
    ).copyWith(
      background: oledBackgroundOverride,
      primary: keepOriginalAccentColorOverride,
      secondary: keepOriginalAccentColorOverride,
    );
  }

  ThemeData _getTheme(final Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.background, // For LicensePage
      snackBarTheme: _snackBarTheme,
      dividerTheme: _dividerTheme,
      scrollbarTheme: _scrollbarTheme,
      inputDecorationTheme: _inputDecorationTheme,
      extensions: [
        neonTheme,
        ...?appThemes,
      ],
    );
  }

  /// Returns a new theme for [Brightness.light].
  ///
  /// Used in [MaterialApp.theme].
  ThemeData get lightTheme => _getTheme(Brightness.light);

  /// Returns a new theme for [Brightness.dark].
  ///
  /// Used in [MaterialApp.darkTheme].
  ThemeData get darkTheme => _getTheme(Brightness.dark);

  static const _snackBarTheme = SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  );

  static const _dividerTheme = DividerThemeData(
    thickness: 1.5,
    space: 30,
  );

  static const _scrollbarTheme = ScrollbarThemeData(
    interactive: true,
  );

  static const _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}
