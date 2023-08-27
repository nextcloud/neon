import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/utils/request_manager.dart';

abstract class Bloc {
  void dispose();
}

abstract class InteractiveBloc extends Bloc {
  @override
  void dispose() {
    unawaited(_errorsStreamController.close());
  }

  final _errorsStreamController = StreamController<Object>();
  late Stream<Object> errors = _errorsStreamController.stream.asBroadcastStream();

  Future refresh();

  void addError(final Object error) {
    _errorsStreamController.add(error);
  }

  // ignore: avoid_void_async
  void wrapAction(
    final Future Function() call, {
    final bool disableTimeout = false,
    final Future Function()? refresh,
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

extension DisposeableIterableBloc on Iterable<Bloc> {
  void disposeAll() {
    for (final bloc in this) {
      bloc.dispose();
    }
  }
}

extension DisposeableMapBloc on Map<dynamic, Bloc> {
  void disposeAll() {
    values.disposeAll();
  }
}
