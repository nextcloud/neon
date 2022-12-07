part of '../neon.dart';

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
    _errorsStreamController.add(e);
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
        await RequestManager.timeout(call);
      }

      await (refresh ?? this.refresh)();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      addError(e);
    }
  }
}
