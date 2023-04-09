part of '../../neon.dart';

class HexColor extends Color {
  HexColor(final String hexColor)
      : super(
          int.parse(
            hexColor.toUpperCase().replaceAll('#', '').padLeft(8, 'F'),
            radix: 16,
          ),
        );
}
