import 'dart:ui';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_parse(hexColor));

  static int _parse(final String hexColor) {
    final formatted = hexColor.toUpperCase().replaceAll('#', '').padLeft(8, 'F');

    return int.parse(formatted, radix: 16);
  }
}
