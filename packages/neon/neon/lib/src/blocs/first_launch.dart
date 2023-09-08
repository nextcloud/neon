import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class FirstLaunchBlocEvents {}

@internal
abstract interface class FirstLaunchBlocStates {
  BehaviorSubject<void> get onFirstLaunch;
}

@immutable
@internal
class FirstLaunchBloc extends Bloc implements FirstLaunchBlocEvents, FirstLaunchBlocStates {
  FirstLaunchBloc({
    final bool disabled = false,
  }) {
    const storage = SingleValueStorage(StorageKeys.firstLaunch);

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
  final BehaviorSubject<void> onFirstLaunch = BehaviorSubject();
}
