import 'package:flutter/material.dart';
import 'package:neon_framework/utils.dart';
import 'package:test/test.dart';

void main() {
  group('HexColor', () {
    test('White', () {
      final color = HexColor('#ffffffff');

      expect(color.value, equals(Colors.white.value));
    });

    test('Without alpha', () {
      final color = HexColor('#ffffff');

      expect(color.value, equals(Colors.white.value));
    });

    test('Without #', () {
      final color = HexColor('ffffffff');

      expect(color.value, equals(Colors.white.value));
    });

    test('Uppercase', () {
      final color = HexColor('#FFFFFFFF');

      expect(color.value, equals(Colors.white.value));
    });
  });
}
