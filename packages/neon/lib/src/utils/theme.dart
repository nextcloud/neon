part of '../neon.dart';

const themePrimaryColor = Color(0xFFF37736);
const themeOnPrimaryColor = Color(0xFFFFFFFF);

ThemeData getThemeFromNextcloudTheme(
  final NextcloudTheme? nextcloudTheme,
  final ThemeMode themeMode,
  final Brightness platformBrightness, {
  required final bool oledAsDark,
}) {
  var primaryColor = themePrimaryColor;
  var onPrimaryColor = themeOnPrimaryColor;
  if (nextcloudTheme != null) {
    primaryColor = HexColor(nextcloudTheme.color!);
    onPrimaryColor = HexColor(nextcloudTheme.colorText!);
  }

  late final Brightness selectBrightness;
  switch (themeMode) {
    case ThemeMode.system:
      selectBrightness = platformBrightness;
      break;
    case ThemeMode.light:
      selectBrightness = Brightness.light;
      break;
    case ThemeMode.dark:
      selectBrightness = Brightness.dark;
      break;
  }

  final backgroundColor = selectBrightness == Brightness.dark
      ? oledAsDark
          ? Colors.black
          : const Color(0xFF303030)
      : Colors.white;

  final onBackgroundColor = selectBrightness == Brightness.dark ? Colors.white : const Color(0xFF303030);

  final canvasColor = selectBrightness == Brightness.dark
      ? oledAsDark
          ? const Color(0xFF202020)
          : const Color(0xFF404040)
      : const Color(0xFFEAEAEA);

  final disabledColor = selectBrightness == Brightness.dark
      ? oledAsDark
          ? Colors.grey[700]
          : Colors.grey[600]
      : Colors.grey[500];

  final colorScheme =
      (selectBrightness == Brightness.dark ? const ColorScheme.dark() : const ColorScheme.light()).copyWith(
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: primaryColor,
    onSecondary: onPrimaryColor,
    background: backgroundColor,
    onBackground: onBackgroundColor,
  );

  return ThemeData(
    useMaterial3: true,
    disabledColor: disabledColor,
    brightness: selectBrightness,
    scaffoldBackgroundColor: backgroundColor,
    canvasColor: canvasColor,
    cardColor: backgroundColor,
    colorScheme: colorScheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: primaryColor,
      selectionHandleColor: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: onPrimaryColor,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      actionTextColor: primaryColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: backgroundColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((final states) {
        if (states.contains(MaterialState.disabled)) {
          return selectBrightness == Brightness.dark ? Colors.white38 : Colors.black38;
        }

        return primaryColor;
      }),
      checkColor: MaterialStateProperty.resolveWith((final states) => onPrimaryColor),
    ),
    dividerTheme: DividerThemeData(
      color: primaryColor,
      thickness: 1.5,
      space: 40,
      indent: 10,
      endIndent: 10,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.resolveWith(
        (final states) => primaryColor
            .withOpacity(states.contains(MaterialState.hovered) || states.contains(MaterialState.dragged) ? 1 : 0.5),
      ),
      mainAxisMargin: 10,
      crossAxisMargin: 5,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (final states) => states.contains(MaterialState.disabled) ? disabledColor : primaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: onPrimaryColor,
        primary: primaryColor,
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: canvasColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
  );
}
