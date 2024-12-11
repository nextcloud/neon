import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/utils.dart';

void main() {
  group('HexColor', () {
    test('White', () {
      final color = HexColor('#ffffffff');

      expect(color.toString(), Colors.white.toString());
    });

    test('Without alpha', () {
      final color = HexColor('#ffffff');

      expect(color.toString(), Colors.white.toString());
    });

    test('Without #', () {
      final color = HexColor('ffffffff');

      expect(color.toString(), Colors.white.toString());
    });

    test('Uppercase', () {
      final color = HexColor('#FFFFFFFF');

      expect(color.toString(), Colors.white.toString());
    });
  });
}
