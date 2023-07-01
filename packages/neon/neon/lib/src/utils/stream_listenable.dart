import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

/// Listenable Stream
///
/// A class that implements [Listenable] for a stream.
/// Objects need to be manually disposed.
class StreamListenable extends ChangeNotifier {
  /// Listenable Stream
  ///
  /// Implementation for all types of [Stream]s.
  /// For an implementation tailored towards [BehaviorSubject] have a look at [StreamListenable.behaviorSubject].
  StreamListenable(final Stream<dynamic> stream) {
    notifyListeners();

    _subscription = stream.asBroadcastStream().listen((final value) {
      notifyListeners();
    });
  }

  /// Listenable BehaviorSubject
  ///
  /// Implementation for a [BehaviorSubject]. It ensures to not unececcary notify listeners.
  /// For an implementation tailored towards otnher kinds of [Stream] have a look at [StreamListenable].
  StreamListenable.behaviorSubject(final BehaviorSubject<dynamic> subject) {
    _subscription = subject.listen((final value) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());

    super.dispose();
  }
}
