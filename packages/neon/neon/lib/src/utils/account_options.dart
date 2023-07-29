import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/settings/models/option.dart';
import 'package:neon/src/settings/models/select_option.dart';
import 'package:neon/src/settings/models/storage.dart';

@internal
@immutable
class AccountSpecificOptions {
  AccountSpecificOptions(
    this._storage,
    this._appsBloc,
  ) {
    _appsBloc.appImplementations.listen((final result) {
      if (!result.hasData) {
        return;
      }

      initialApp.values = {
        null: (final context) => AppLocalizations.of(context).accountOptionsAutomatic,
        for (final app in result.requireData) ...{
          app.id: app.name,
        },
      };
    });
  }

  final AppStorage _storage;
  final AppsBloc _appsBloc;

  late final List<Option> options = [
    initialApp,
  ];

  void reset() {
    for (final option in options) {
      option.reset();
    }
  }

  void dispose() {
    for (final option in options) {
      option.dispose();
    }
  }

  late final initialApp = SelectOption<String?>(
    storage: _storage,
    key: 'initial-app',
    label: (final context) => AppLocalizations.of(context).accountOptionsInitialApp,
    defaultValue: null,
    values: {},
  );
}
