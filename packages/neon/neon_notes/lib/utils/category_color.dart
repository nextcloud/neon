part of '../neon_notes.dart';

class NotesCategoryColor {
  static final Map<String, Color> _colors = {};

  static Color compute(final String category) {
    if (_colors.containsKey(category)) {
      return _colors[category]!;
    }

    final color = HexColor(sha1.convert(utf8.encode(category)).toString().substring(0, 6));
    _colors[category] = color;
    return color;
  }
}
