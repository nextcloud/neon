import 'package:account_repository/src/models/models.dart';
import 'package:account_repository/src/utils/utils.dart';
import 'package:account_repository/testing.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http;
import 'package:meta/meta.dart';

final _mockClient = http.MockClient((request) async {
  throw UnsupportedError('The fake account client can not be used in tests.');
});

/// Creates a mocked [Account] object.
///
/// The default http client backing this account can not be used to make requests.
/// Provide a custom [http.MockClient] for testing network requests.
@visibleForTesting
Account createAccount({
  Credentials? credentials,
  http.Client? httpClient,
}) {
  credentials ??= createCredentials();

  return Account((b) {
    b
      ..credentials.replace(credentials!)
      ..client = buildClient(
        httpClient: httpClient ?? _mockClient,
        userAgent: 'neon',
        credentials: credentials,
      );
  });
}
