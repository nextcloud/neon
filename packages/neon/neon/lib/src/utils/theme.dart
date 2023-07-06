import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/utils/hex_color.dart';
import 'package:nextcloud/nextcloud.dart';

@internal
const themePrimaryColor = Color(0xFFF37736);

@internal
@immutable
class AppTheme {
  AppTheme(
    this.nextcloudTheme, {
    final bool keepOriginalAccentColor = false,
    this.oledAsDark = false,
    this.appThemes,
  }) : keepOriginalAccentColor = nextcloudTheme == null || keepOriginalAccentColor;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Theming? nextcloudTheme;
  final bool keepOriginalAccentColor;
  final bool oledAsDark;
  final Iterable<ThemeExtension>? appThemes;

  late final _primaryColor = nextcloudTheme?.color != null ? HexColor(nextcloudTheme!.color!) : themePrimaryColor;
  late final _keepOriginalAccentColorOverride = keepOriginalAccentColor ? _primaryColor : null;

  ColorScheme _buildColorScheme(final Brightness brightness) {
    final oledBackgroundOverride = oledAsDark && brightness == Brightness.dark ? Colors.black : null;

    return ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: brightness,
    ).copyWith(
      background: oledBackgroundOverride,
      primary: _keepOriginalAccentColorOverride,
      secondary: _keepOriginalAccentColorOverride,
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
      extensions: [
        const NeonTheme(),
        ...?appThemes,
      ],
    );
  }

  ThemeData get lightTheme => _getTheme(Brightness.light);
  ThemeData get darkTheme => _getTheme(Brightness.dark);

  static const _snackBarTheme = SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  );

  static const _dividerTheme = DividerThemeData(
    thickness: 1.5,
    space: 30,
  );
}

@internal
@immutable
class NeonTheme extends ThemeExtension<NeonTheme> {
  const NeonTheme();

  @override
  NeonTheme copyWith() => const NeonTheme();

  @override
  NeonTheme lerp(final NeonTheme? other, final double t) {
    if (other is! NeonTheme) {
      return this;
    }
    return const NeonTheme();
  }
}
