// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/models/disposable.dart';
import 'package:neon_framework/src/settings/models/storage.dart';
import 'package:rxdart/rxdart.dart';

sealed class FirstLaunchBloc implements Disposable {
  @internal
  factory FirstLaunchBloc({
    final bool disabled = false,
  }) =>
      _FirstLaunchBloc(disabled: disabled);

  BehaviorSubject<void> get onFirstLaunch;
}

@immutable
class _FirstLaunchBloc extends Bloc implements FirstLaunchBloc {
  _FirstLaunchBloc({
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
