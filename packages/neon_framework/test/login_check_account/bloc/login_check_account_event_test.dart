// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_check_account/login_check_account.dart';

void main() {
  group('LoginCheckAccountEvent', () {
    group('LoginCheckAccount', () {
      test('supports value equality', () {
        expect(
          LoginCheckAccount(),
          equals(LoginCheckAccount()),
        );
      });

      test('props are correct', () {
        expect(
          LoginCheckAccount().props,
          equals(<Object?>[]),
        );
      });
    });
  });
}
