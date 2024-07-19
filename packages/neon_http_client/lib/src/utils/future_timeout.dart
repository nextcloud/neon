import 'dart:async';

import 'package:meta/meta.dart';

/// Extension for timing out futures.
@internal
extension FutureTimeout<T> on Future<T> {
  /// Times out the request with [timeout] if [timeLimit] is a non null value.
  Future<T> maybeTimeout(Duration? timeLimit, {FutureOr<T> Function()? onTimeout}) {
    if (timeLimit == null) {
      return this;
    }

    return timeout(timeLimit, onTimeout: onTimeout);
  }
}
