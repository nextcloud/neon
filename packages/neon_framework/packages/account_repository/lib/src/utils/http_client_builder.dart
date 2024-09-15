import 'package:account_repository/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:neon_framework/storage.dart';
import 'package:neon_http_client/neon_http_client.dart';
import 'package:nextcloud/nextcloud.dart';

/// Builds a [NextcloudClient] authenticated with the given [credentials].
NextcloudClient buildClient({
  required http.Client httpClient,
  required String userAgent,
  required Credentials credentials,
}) {
  final cookieStore = NeonStorage().cookieStore(
    accountID: credentials.id,
    serverURL: credentials.serverURL,
  );

  final neonHttpClient = NeonHttpClient(
    cookieStore: cookieStore,
    userAgent: userAgent,
    client: httpClient,
    timeLimit: kDefaultTimeout,
    baseURL: credentials.serverURL,
  );

  return NextcloudClient(
    credentials.serverURL,
    loginName: credentials.username,
    password: credentials.appPassword,
    appPassword: credentials.appPassword,
    httpClient: neonHttpClient,
  );
}

/// Builds an unauthenticated [NextcloudClient] for the given [serverURL].
NextcloudClient buildUnauthenticatedClient({
  required http.Client httpClient,
  required String userAgent,
  required Uri serverURL,
}) {
  final neonHttpClient = NeonHttpClient(
    userAgent: userAgent,
    client: httpClient,
    timeLimit: kDefaultTimeout,
    baseURL: serverURL,
  );

  return NextcloudClient(
    serverURL,
    httpClient: neonHttpClient,
  );
}
