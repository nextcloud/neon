import 'package:account_repository/src/utils/utils.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

void main() {
  group('AuthenticationClient', () {
    test('AuthenticationClientExtension', () {
      final client = NextcloudClient(Uri());

      expect(
        client.authentication,
        isA<AuthenticationClient>(),
      );
    });
  });
}
