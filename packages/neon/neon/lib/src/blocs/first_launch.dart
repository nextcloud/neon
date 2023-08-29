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
  }) {
    const storage = SingleValueStorage('first-launch');

    if (!disabled && !storage.hasValue()) {
      onFirstLaunch.add(null);
      unawaited(storage.setBool(false));
    }
  }

  @override
  void dispose() {
    unawaited(onFirstLaunch.close());
  }

  @override
  final BehaviorSubject onFirstLaunch = BehaviorSubject();
}
