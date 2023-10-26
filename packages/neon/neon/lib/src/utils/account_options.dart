import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/blocs/clients.dart';
import 'package:neon/src/settings/models/option.dart';
import 'package:neon/src/settings/models/options_collection.dart';
import 'package:neon/src/settings/models/storage.dart';

@internal
@immutable
class AccountSpecificOptions extends OptionsCollection {
  AccountSpecificOptions(
    super.storage,
    this._clientsBloc,
  ) {
    _clientsBloc.clientImplementations.listen((final result) {
      if (!result.hasData) {
        return;
      }

      initialClient.values = {
        null: (final context) => NeonLocalizations.of(context).accountOptionsAutomatic,
      }..addEntries(result.requireData.map((final client) => MapEntry(client.id, client.name)));
    });
  }

  final ClientsBloc _clientsBloc;

  @override
  late final List<Option<dynamic>> options = [
    initialClient,
  ];

  late final initialClient = SelectOption<String?>(
    storage: storage,
    key: AccountOptionKeys.initialClient,
    label: (final context) => NeonLocalizations.of(context).accountOptionsInitialApp,
    defaultValue: null,
    values: {},
  );
}

@internal
enum AccountOptionKeys implements Storable {
  initialClient._('initial-app');

  const AccountOptionKeys._(this.value);

  @override
  final String value;
}
