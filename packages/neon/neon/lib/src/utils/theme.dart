part of '../../neon.dart';

final themeNotifier = ValueNotifier<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming?>(null);

const themePrimaryColor = Color(0xFFF37736);

ThemeData getThemeFromNextcloudTheme(
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming? nextcloudTheme,
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

  final fillColor = MaterialStateProperty.resolveWith((final states) {
    if (states.contains(MaterialState.disabled)) {
      return brightness == Brightness.dark ? Colors.white38 : Colors.black38;
    }

    return colorScheme.primary;
  });

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface, // For Drawer
    cardColor: colorScheme.background, // For LicensePage
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: fillColor,
      checkColor: MaterialStateProperty.resolveWith((final states) => colorScheme.onPrimary),
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1.5,
      space: 30,
    ),
    popupMenuTheme: PopupMenuThemeData(
      // TODO: Only needed until M3 popup menus are implemented
      color: brightness == Brightness.dark
          ? oledAsDark
              ? const Color(0xFF202020)
              : const Color(0xFF404040)
          : const Color(0xFFEAEAEA),
    ),
    radioTheme: RadioThemeData(
      fillColor: fillColor,
    ),
  );
}
