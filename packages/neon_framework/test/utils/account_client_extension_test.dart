import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/utils/account_client_extension.dart';
import 'package:neon_framework/testing.dart';

void main() {
  group('AccountClientExtension', () {
    group('URI', () {
      const testURL = 'apps/test?123=456#789';

      for (final (serverURL, path) in [
        ('http://localhost', ''),
        ('http://localhost:443', ''),
        ('http://localhost:443/nextcloud', '/nextcloud'),
      ]) {
        group(serverURL, () {
          final account = createAccount(
            credentials: createCredentials(
              serverURL: Uri.parse(serverURL),
              username: 'example',
              appPassword: null,
            ),
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
        });
      }
    });

    group('getAuthorizationHeaders', () {
      final account = createAccount(
        credentials: createCredentials(
          serverURL: Uri.parse('https://example.com:443/test'),
          username: 'example',
          appPassword: 'example',
        ),
      );

      for (final (url, shouldHaveHeaders) in [
        ('https://example.com:443/test/bla.png', true),
        // Different ports
        ('https://example.com/test/bla.png', true),
        ('https://example.com:80/test/bla.png', false),
        // Different paths
        ('https://example.com:443/bla.png', false),
        ('https://example.com:443/123/bla.png', false),
        // Different protocol
        ('http://example.com:443/test/bla.png', false),
        // Different domains
        ('https://test.example.com:443/test/bla.png', false),
        ('https://test.com:443/test/bla.png', false),
      ]) {
        test(url, () {
          expect(account.getAuthorizationHeaders(Uri.parse(url)), shouldHaveHeaders ? isNotNull : isNull);
        });
      }
    });
  });
}
