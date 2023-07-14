import 'package:neon/src/models/account.dart';
import 'package:test/test.dart';

void main() {
  const qrCodePath = '/user:JohnDoe&password:super_secret&server:example.com';
  const qrCode = 'nc://login$qrCodePath';
  const invalidUrl = '::Not valid LoginQrcode::';
  const credentials = LoginQrcode(
    serverURL: 'example.com',
    username: 'JohnDoe',
    password: 'super_secret',
  );

  group('LoginQrcode', () {
    test('parse', () {
      expect(LoginQrcode.tryParse(qrCode), equals(credentials));
      expect(LoginQrcode.tryParse(qrCodePath), equals(credentials));
      expect(LoginQrcode.tryParse(invalidUrl), null);
    });

    test('equality', () {
      expect(credentials, equals(credentials));
    });
  });
}
