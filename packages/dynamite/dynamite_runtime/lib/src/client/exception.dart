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
  /// Creates a new dynamite exception with the given information.
  DynamiteStatusCodeException(
    this.statusCode, [
    Uri? url,
  ]) : super('Invalid status code $statusCode.', url);

  /// Creates a new Exception from the given response data.
  DynamiteStatusCodeException.fromResponse({
    required this.statusCode,
    Map<String, Object?>? headers,
    Object? body,
    Uri? url,
  }) : super('Invalid status code $statusCode, headers: $headers, body: $body', url);

  /// The returned status code when the exception was thrown.
  final int statusCode;
}
