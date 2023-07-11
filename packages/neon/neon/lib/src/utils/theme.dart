import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/utils/hex_color.dart';
import 'package:neon/src/widgets/dialog.dart';
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

/// Defines the configuration of the overall visual [Theme] for a NeonApp
/// or a widget subtree within the app.
@internal
@immutable
class NeonTheme extends ThemeExtension<NeonTheme> {
  /// Create a [NeonTheme] that's used to configure a [Theme].
  const NeonTheme({
    this.dialogTheme = const NeonDialogTheme(),
  });

  /// A theme for customizing the visual properties of [NeonDialog]s.
  ///
  /// This is the value returned from [NeonDialogTheme.of].
  final NeonDialogTheme dialogTheme;

  @override
  NeonTheme copyWith({
    final NeonDialogTheme? dialogTheme,
  }) =>
      NeonTheme(
        dialogTheme: dialogTheme ?? this.dialogTheme,
      );

  @override
  NeonTheme lerp(final NeonTheme? other, final double t) {
    if (other is! NeonTheme) {
      return this;
    }
    return NeonTheme(
      dialogTheme: NeonDialogTheme.lerp(dialogTheme, other.dialogTheme, t),
    );
  }
}

/// Defines a theme for [NeonDialog] widgets.
///
/// Descendant widgets obtain the current [NeonDialogTheme] object using
/// `NeonDialogTheme.of(context)`. Instances of [NeonDialogTheme] can be customized with
/// [NeonDialogTheme.copyWith].
@immutable
class NeonDialogTheme {
  /// Creates a dialog theme that can be used for [NeonTheme.dialogTheme].
  const NeonDialogTheme({
    this.constraints = const BoxConstraints(
      minWidth: 280,
      maxWidth: 560,
    ),
  });

  /// Used to configure the [BoxConstraints] for the [NeonDialog] widget.
  ///
  /// This value should also be used on [Dialog.fullscreen] and other similar pages.
  /// By default it follows the default [m3 dialog specification](https://m3.material.io/components/dialogs/specs).
  final BoxConstraints constraints;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  NeonDialogTheme copyWith({
    final BoxConstraints? constraints,
  }) =>
      NeonDialogTheme(
        constraints: constraints ?? this.constraints,
      );

  /// The data from the closest [NeonDialogTheme] instance given the build context.
  static NeonDialogTheme of(final BuildContext context) => Theme.of(context).extension<NeonTheme>()!.dialogTheme;

  /// Linearly interpolate between two neon dialog themes.
  ///
  /// {@macro dart.ui.shadow.lerp}
  // ignore: prefer_constructors_over_static_methods
  static NeonDialogTheme lerp(final NeonDialogTheme a, final NeonDialogTheme b, final double t) {
    if (identical(a, b)) {
      return a;
    }
    return NeonDialogTheme(
      constraints: BoxConstraints.lerp(a.constraints, b.constraints, t)!,
    );
  }

  @override
  int get hashCode => constraints.hashCode;

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is NeonDialogTheme && other.constraints == constraints;
  }
}
