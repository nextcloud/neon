// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_qr_code/login_qr_code.dart';

void main() {
  group('LoginQrCodeEvent', () {
    group('LoginQrCodeScanned', () {
      test('supports value equality', () {
        expect(
          LoginQrCodeScanned('code'),
          equals(LoginQrCodeScanned('code')),
        );
      });

      test('props are correct', () {
        expect(
          LoginQrCodeScanned('code').props,
          equals(<Object?>[
            'code', // code
          ]),
        );
      });
    });
  });
}
