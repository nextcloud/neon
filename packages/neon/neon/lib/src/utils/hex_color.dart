part of '../../neon.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_parse(hexColor));

  static int _parse(final String hexColor) {
    final formated = hexColor.toUpperCase().replaceAll('#', '').padLeft(8, 'F');

    return int.parse(formated, radix: 16);
  }
}
