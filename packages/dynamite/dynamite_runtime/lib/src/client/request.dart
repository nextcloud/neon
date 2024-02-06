import 'package:http/http.dart' as http;

/// An http request For dynamite operations.
class DynamiteRequest extends http.Request {
  /// Creates a new dynamite request.
  DynamiteRequest(super.method, super.url);

  /// The expected valid statuses of this request.
  ///
  /// It is up to the caller to validate the response.
  ///
  /// This set should only be set, not modified in place.
  Set<int>? get validStatuses => _validStatuses;
  Set<int>? _validStatuses;

  set validStatuses(Set<int>? value) {
    _checkFinalized();
    _validStatuses = value;
  }

  /// Throw an error if this request has been finalized.
  void _checkFinalized() {
    if (!finalized) {
      return;
    }
    throw StateError("Can't modify a finalized Request.");
  }
}
