import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// The exception thrown by operations of a `DynamiteClient`.
///
///
/// See:
///   * [DynamiteStatusCodeException] as the exception thrown when the response
///     returns an invalid status code.
@immutable
sealed class DynamiteApiException extends http.ClientException {
  DynamiteApiException(super.message, super.uri);
}

/// An exception caused by an invalid status code in a response.
class DynamiteStatusCodeException extends DynamiteApiException {
  /// Creates a new Exception from the HTTP request and response.
  DynamiteStatusCodeException(this.response)
      : super(
          'Invalid status code ${response.statusCode}, headers: ${response.headers}, body: ${response.body}',
          response.request?.url,
        );

  /// The HTTP response that lead to this Exception being thrown.
  final http.Response response;

  /// The returned status code when the exception was thrown.
  int get statusCode => response.statusCode;
}
