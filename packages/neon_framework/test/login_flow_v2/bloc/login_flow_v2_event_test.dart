// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_flow_v2/login_flow_v2.dart';

void main() {
  group('LoginFlowV2Event', () {
    group('LoginFlowV2Init', () {
      test('supports value equality', () {
        expect(
          LoginFlowV2Init(),
          equals(LoginFlowV2Init()),
        );
      });

      test('props are correct', () {
        expect(
          LoginFlowV2Init().props,
          equals(<Object?>[]),
        );
      });
    });

    group('LoginFlowV2OpenPage', () {
      test('supports value equality', () {
        expect(
          LoginFlowV2OpenPage(),
          equals(LoginFlowV2OpenPage()),
        );
      });

      test('props are correct', () {
        expect(
          LoginFlowV2OpenPage().props,
          equals(<Object?>[]),
        );
      });
    });
  });
}
