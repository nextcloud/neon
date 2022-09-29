part of '../neon.dart';

class AccountSpecificOptions {
  AccountSpecificOptions(
    this._storage,
    this._appsBloc,
  ) {
    _appsBloc.appImplementations.listen((final result) {
      if (result.data != null) {
        _appIDsSubject.add({
          null: (final context) => AppLocalizations.of(context).accountOptionsAutomatic,
          for (final app in result.data!) ...{
            app.id: app.name,
          },
        });
      }
    });
  }

  final Storage _storage;
  final AppsBloc _appsBloc;
  final _appIDsSubject = BehaviorSubject<Map<String?, LabelBuilder>>();

  late final List<Option> options = [
    initialApp,
  ];

  Future reset() async {
    for (final option in options) {
      await option.reset();
    }
  }

  void dispose() {
    unawaited(_appIDsSubject.close());
    for (final option in options) {
      option.dispose();
    }
  }

  late final initialApp = SelectOption<String?>(
    storage: _storage,
    key: 'initial-app',
    label: (final context) => AppLocalizations.of(context).accountOptionsInitialApp,
    defaultValue: BehaviorSubject.seeded(null),
    values: _appIDsSubject,
  );
}
