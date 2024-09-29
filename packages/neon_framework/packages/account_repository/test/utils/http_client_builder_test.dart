import 'package:account_repository/src/models/models.dart';
import 'package:account_repository/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:neon_http_client/neon_http_client.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

class _FakeClient extends Fake implements http.Client {}

class _FakeUri extends Fake implements Uri {}

void main() {
  final httpClient = _FakeClient();
  const userAgent = 'neon';

  setUpAll(() {
    registerFallbackValue(_FakeUri());
  });

  group('buildClient', () {
    test('builds client without cookie store', () {
      final credentials = Credentials((b) {
        b
          ..username = 'username'
          ..appPassword = 'appPassword'
          ..serverURL = Uri.https('serverURL');
      });

      final client = buildClient(
        httpClient: httpClient,
        userAgent: userAgent,
        credentials: credentials,
        enableCookieStore: false,
      );

      expect(
        client,
        isA<NextcloudClient>()
            .having((c) => c.authentications, 'not empty authentications', isNotEmpty)
            .having((c) => c.baseURL, 'baseURL', equals(Uri.https('serverURL')))
            .having(
              (c) => c.httpClient,
              'httpClient',
              isA<NeonHttpClient>().having((c) => c.interceptors, 'interceptors', hasLength(3)),
            ),
      );
    });

    test('build client with cookie store', () {
      final credentials = Credentials((b) {
        b
          ..username = 'username'
          ..appPassword = 'appPassword'
          ..serverURL = Uri.https('serverURL');
      });

      final client = buildClient(
        httpClient: httpClient,
        userAgent: userAgent,
        credentials: credentials,
      );

      expect(
        client,
        isA<NextcloudClient>()
            .having((c) => c.authentications, 'not empty authentications', isNotEmpty)
            .having((c) => c.baseURL, 'baseURL', equals(Uri.https('serverURL')))
            .having(
              (c) => c.httpClient,
              'httpClient',
              isA<NeonHttpClient>().having((c) => c.interceptors, 'interceptors', hasLength(4)),
            ),
      );
    });
  });

  test('buildUnauthenticatedClient', () {
    final client = buildUnauthenticatedClient(
      httpClient: httpClient,
      userAgent: userAgent,
      serverURL: Uri.https('serverURL'),
    );

    expect(
      client,
      isA<NextcloudClient>()
          .having((c) => c.authentications, 'empty authentications', isEmpty)
          .having((c) => c.baseURL, 'baseURL', equals(Uri.https('serverURL')))
          .having(
            (c) => c.httpClient,
            'httpClient',
            isA<NeonHttpClient>().having((c) => c.interceptors, 'interceptors', hasLength(3)),
          ),
    );
  });
}
