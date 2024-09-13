// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_check_server/login_check_server.dart';

void main() {
  group('LoginCheckServerEvent', () {
    group('LoginCheckServer', () {
      test('supports value equality', () {
        expect(
          LoginCheckServer(),
          equals(LoginCheckServer()),
        );
      });

      test('props are correct', () {
        expect(
          LoginCheckServer().props,
          equals(<Object?>[]),
        );
      });
    });
  });
}
