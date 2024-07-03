import 'package:dynamite_runtime/src/client/authentication.dart';
import 'package:dynamite_runtime/src/client/exception.dart';
import 'package:dynamite_runtime/src/client/response.dart';
import 'package:dynamite_runtime/src/utils/uri.dart';
import 'package:http/http.dart' as http;

/// A client for making network requests.
///
/// See:
///   * [DynamiteResponse] as the response returned by an operation.
///   * [DynamiteApiException] as the exception that can be thrown in operations
///   * [DynamiteAuthentication] for providing authentication methods.
abstract class DynamiteClient {
  /// Creates a new dynamite network client.
  ///
  /// If [httpClient] is not provided a default one will be created.
  /// The [baseURL] will be normalized, removing any trailing `/`.
  /// It is an error if the [baseURL] contains any query parameters.
  DynamiteClient(
    Uri baseURL, {
    http.Client? httpClient,
    this.authentications,
  })  : httpClient = httpClient ?? http.Client(),
        baseURL = baseURL.normalizeEmptyPath() {
    if (baseURL.queryParametersAll.isNotEmpty) {
      throw ArgumentError.value(baseURL, 'baseURL', 'MUST NOT contain query parameters.');
    }
  }

  /// The base server url used to build the request uri.
  ///
  /// See `https://swagger.io/docs/specification/api-host-and-base-path` for
  /// further information.
  final Uri baseURL;

  /// The base http client.
  final http.Client httpClient;

  /// The available authentications for this client.
  ///
  /// The first one matching the required authentication type will be used.
  final List<DynamiteAuthentication>? authentications;
}
