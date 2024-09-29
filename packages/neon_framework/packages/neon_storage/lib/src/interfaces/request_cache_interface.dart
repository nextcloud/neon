import 'package:http/http.dart' as http;

/// A storage used to cache HTTP requests.
abstract interface class RequestCache {
  /// Gets the cached status code, body and headers for the [request].
  Future<http.Response?> get(String accountID, http.Request request);

  /// Sets the cached [response] for the [request].
  ///
  /// If a request is already present it will be updated with the new one.
  Future<void> set(String accountID, http.Request request, http.Response response);

  /// Updates the cache [headers] for the [request] without modifying anything else.
  Future<void> updateHeaders(String accountID, http.Request request, Map<String, String> headers);
}
