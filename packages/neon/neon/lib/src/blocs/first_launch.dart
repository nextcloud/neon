import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:rxdart/rxdart.dart';

abstract class FirstLaunchBlocEvents {}

abstract class FirstLaunchBlocStates {
  BehaviorSubject get onFirstLaunch;
}

@immutable
@internal
class FirstLaunchBloc extends Bloc implements FirstLaunchBlocEvents, FirstLaunchBlocStates {
  FirstLaunchBloc({
    final bool disabled = false,
  }) : _storage = AppStorage(_keyFirstLaunch) {
    if (!disabled && !_storage.containsKey(_keyFirstLaunch)) {
      onFirstLaunch.add(null);
      unawaited(_storage.setBool(_keyFirstLaunch, false));
    }
  }

  final AppStorage _storage;
  static const _keyFirstLaunch = 'first-launch';

  @override
  void dispose() {
    unawaited(onFirstLaunch.close());
  }

  @override
  final BehaviorSubject onFirstLaunch = BehaviorSubject();
}
