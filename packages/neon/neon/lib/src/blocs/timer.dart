import 'dart:async';
import 'dart:ui';

import 'package:meta/meta.dart';
import 'package:neon/src/utils/bloc.dart';

abstract class TimerBlocEvents {
  /// Register a [callback] that will be called periodically.
  /// The time between the executions is defined by the [duration].
  NeonTimer registerTimer(final Duration duration, final VoidCallback callback);

  /// Unregister a timer that has been previously registered with the bloc.
  /// You can also use [NeonTimer.cancel].
  void unregisterTimer(final NeonTimer timer);
}

abstract class TimerBlocStates {}

/// Execute callbacks at defined periodic intervals.
/// Components can register their callbacks and everything with the same periodicity will be executed at the same time.
///
/// The [TimerBloc] is a singleton.
/// Sub-second timers are not supported.
class TimerBloc extends Bloc implements TimerBlocEvents, TimerBlocStates {
  factory TimerBloc() => instance ??= TimerBloc._();

  @visibleForTesting
  factory TimerBloc.mocked(final TimerBloc mock) => instance ??= mock;

  TimerBloc._();

  @visibleForTesting
  static TimerBloc? instance;

  final Map<int, Timer> _timers = {};
  final Map<int, Set<VoidCallback>> _callbacks = {};

  @visibleForTesting
  Map<int, Timer> get timers => _timers;

  @visibleForTesting
  Map<int, Set<VoidCallback>> get callbacks => _callbacks;

  @override
  void dispose() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    _callbacks.clear();
    TimerBloc.instance = null;
  }

  @override
  NeonTimer registerTimer(final Duration duration, final VoidCallback callback) {
    if (_timers[duration.inSeconds] == null) {
      _timers[duration.inSeconds] = Timer.periodic(duration, (final _) {
        for (final callback in _callbacks[duration.inSeconds]!) {
          callback();
        }
      });
      _callbacks[duration.inSeconds] = {callback};
    } else {
      _callbacks[duration.inSeconds]!.add(callback);
    }
    return NeonTimer(duration, callback);
  }

  @override
  void unregisterTimer(final NeonTimer timer) {
    if (_timers[timer.duration.inSeconds] != null) {
      _callbacks[timer.duration.inSeconds]!.remove(timer.callback);
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
