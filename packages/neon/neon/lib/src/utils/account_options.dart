import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/settings/models/option.dart';
import 'package:neon/src/settings/models/options_collection.dart';
import 'package:neon/src/settings/models/storage.dart';

@internal
@immutable
class AccountSpecificOptions extends OptionsCollection {
  AccountSpecificOptions(
    super.storage,
    this._appsBloc,
  ) {
    _appsBloc.appImplementations.listen((final result) {
      if (!result.hasData) {
        return;
      }

      initialApp.values = {
        null: (final context) => AppLocalizations.of(context).accountOptionsAutomatic,
      }..addEntries(result.requireData.map((final app) => MapEntry(app.id, app.name)));
    });
  }

  final AppsBloc _appsBloc;

  @override
  late final List<Option<dynamic>> options = [
    initialApp,
  ];

  late final initialApp = SelectOption<String?>(
    storage: storage,
    key: AccountOptionKeys.initialApp,
    label: (final context) => AppLocalizations.of(context).accountOptionsInitialApp,
    defaultValue: null,
    values: {},
  );
}

@internal
enum AccountOptionKeys implements Storable {
  initialApp._('initial-app');

  const AccountOptionKeys._(this.value);

  @override
  final String value;
}
