import 'package:flutter/material.dart';
import 'package:neon/src/theme/branding.dart';
import 'package:neon/src/theme/color_scheme.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/widgets/dialog.dart';

/// Defines the configuration of the overall visual [Theme] for the app
/// or a widget subtree within the app.
///
/// It is typically only needed to provide a [branding].
@immutable
class NeonTheme extends ThemeExtension<NeonTheme> {
  /// Create a [NeonTheme] that's used to configure a [Theme].
  const NeonTheme({
    required this.branding,
    this.colorScheme = const NeonColorScheme(),
    this.dialogTheme = const NeonDialogTheme(),
  });

  /// A theme for customizing the Branding of the app.
  ///
  /// This is the value returned from [Branding.of].
  final Branding branding;

  /// A color scheme for customizing the default appearance of the app.
  ///
  /// This is the value returned from [NeonColorScheme.of].
  final NeonColorScheme colorScheme;

  /// A theme for customizing the visual properties of [NeonDialog]s.
  ///
  /// This is the value returned from [NeonDialogTheme.of].
  final NeonDialogTheme dialogTheme;

  @override
  NeonTheme copyWith({
    final Branding? branding,
    final NeonColorScheme? colorScheme,
    final NeonDialogTheme? dialogTheme,
  }) =>
      NeonTheme(
        branding: branding ?? this.branding,
        colorScheme: colorScheme ?? this.colorScheme,
        dialogTheme: dialogTheme ?? this.dialogTheme,
      );

  @override
  NeonTheme lerp(final NeonTheme? other, final double t) {
    if (other is! NeonTheme) {
      return this;
    }
    return NeonTheme(
      branding: branding,
      colorScheme: NeonColorScheme.lerp(colorScheme, other.colorScheme, t),
      dialogTheme: NeonDialogTheme.lerp(dialogTheme, other.dialogTheme, t),
    );
  }
}
