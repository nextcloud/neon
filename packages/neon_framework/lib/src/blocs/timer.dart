// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:ui';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';

sealed class TimerBloc extends Bloc {
  factory TimerBloc() => instance ??= _TimerBloc._();

  @visibleForTesting
  factory TimerBloc.mocked(final TimerBloc mock) => instance ??= mock;

  @visibleForTesting
  static TimerBloc? instance;

  @override
  void dispose() {
    TimerBloc.instance?.dispose();
    TimerBloc.instance = null;
  }

  /// Register a [callback] that will be called periodically.
  /// The time between the executions is defined by the [duration].
  NeonTimer registerTimer(final Duration duration, final VoidCallback callback);

  /// Unregister a timer that has been previously registered with the bloc.
  /// You can also use [NeonTimer.cancel].
  void unregisterTimer(final NeonTimer timer);

  @visibleForTesting
  Map<int, Timer> get timers;

  @visibleForTesting
  Map<int, Set<VoidCallback>> get callbacks;
}

/// Execute callbacks at defined periodic intervals.
/// Components can register their callbacks and everything with the same periodicity will be executed at the same time.
///
/// The [TimerBloc] is a singleton.
/// Sub-second timers are not supported.
class _TimerBloc implements TimerBloc {
  _TimerBloc._();

  @override
  final Map<int, Timer> timers = {};
  @override
  final Map<int, Set<VoidCallback>> callbacks = {};

  @override
  void dispose() {
    for (final timer in timers.values) {
      timer.cancel();
    }
    timers.clear();
    callbacks.clear();
  }

  @override
  NeonTimer registerTimer(final Duration duration, final VoidCallback callback) {
    if (timers[duration.inSeconds] == null) {
      timers[duration.inSeconds] = Timer.periodic(duration, (final _) {
        for (final callback in callbacks[duration.inSeconds]!) {
          callback();
        }
      });
      callbacks[duration.inSeconds] = {callback};
    } else {
      callbacks[duration.inSeconds]!.add(callback);
    }
    return NeonTimer(duration, callback);
  }

  @override
  void unregisterTimer(final NeonTimer timer) {
    if (timers[timer.duration.inSeconds] != null) {
      callbacks[timer.duration.inSeconds]!.remove(timer.callback);
    }
  }
}

class NeonTimer {
  NeonTimer(
    this.duration,
    this.callback,
  );

  final Duration duration;
  final VoidCallback callback;

  void cancel() {
    TimerBloc().unregisterTimer(this);
  }
}
