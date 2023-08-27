import 'package:neon/src/models/account.dart';
import 'package:test/test.dart';

void main() {
  group('LoginQrcode', () {
    const qrCodePath = '/user:JohnDoe&password:super_secret&server:example.com';
    const qrCode = 'nc://login$qrCodePath';
    const invalidUrl = '::Not valid LoginQrcode::';
    const credentials = LoginQrcode(
      serverURL: 'example.com',
      username: 'JohnDoe',
      password: 'super_secret',
    );

    test('parse', () {
      expect(LoginQrcode.tryParse(qrCode), equals(credentials));
      expect(LoginQrcode.tryParse(qrCodePath), equals(credentials));
      expect(LoginQrcode.tryParse(invalidUrl), null);
    });

    test('equality', () {
      expect(credentials, equals(credentials));
    });
  });

  group('URI', () {
    const testURL = 'apps/test?123=456#789';

    for (final (serverURL, path) in [
      ('http://localhost', ''),
      ('http://localhost:443', ''),
      ('http://localhost:443/nextcloud', '/nextcloud'),
    ]) {
      group(serverURL, () {
        final account = Account(
          serverURL: serverURL,
          username: 'example',
        );

        test('Complete absolute path', () {
          expect(
            account.completeUri(Uri.parse('$path/$testURL')),
            Uri.parse('$serverURL/$testURL'),
          );
        });

        test('Complete relative path', () {
          expect(
            account.completeUri(Uri.parse(testURL)),
            Uri.parse('$serverURL/$testURL'),
          );
        });

        test('Strip', () {
          expect(
            account.stripUri(Uri.parse('$serverURL/$testURL')),
            Uri.parse('/$testURL'),
          );
        });
      });
    }
  });
}
