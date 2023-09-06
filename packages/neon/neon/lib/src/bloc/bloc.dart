import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/models/disposable.dart';
import 'package:neon/src/utils/request_manager.dart';

abstract class Bloc implements Disposable {
  @override
  @mustCallSuper
  void dispose();
}

abstract class InteractiveBloc extends Bloc {
  @override
  void dispose() {
    unawaited(_errorsStreamController.close());
  }

  final _errorsStreamController = StreamController<Object>();
  late Stream<Object> errors = _errorsStreamController.stream.asBroadcastStream();

  Future<void> refresh();

  void addError(final Object error) {
    _errorsStreamController.add(error);
  }

  // ignore: avoid_void_async
  void wrapAction(
    final AsyncCallback call, {
    final bool disableTimeout = false,
    final AsyncCallback? refresh,
  }) async {
    try {
      if (disableTimeout) {
        await call();
      } else {
        await RequestManager.instance.timeout(call);
      }

      await (refresh ?? this.refresh)();
    } catch (error, stacktrace) {
      debugPrint(error.toString());
      debugPrint(stacktrace.toString());
      addError(error);
    }
  }
}
