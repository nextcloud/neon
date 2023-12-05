import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/blocs/apps.dart';
import 'package:neon_framework/src/settings/models/option.dart';
import 'package:neon_framework/src/settings/models/options_collection.dart';
import 'package:neon_framework/src/settings/models/storage.dart';

/// Account related options.
@internal
@immutable
class AccountSpecificOptions extends OptionsCollection {
  /// Creates a new account options collection.
  AccountSpecificOptions(
    super.storage,
    this._appsBloc,
  ) {
    _appsBloc.appImplementations.listen((final result) {
      if (!result.hasData) {
        return;
      }

      initialApp.values = {
        null: (final context) => NeonLocalizations.of(context).accountOptionsAutomatic,
      }..addEntries(result.requireData.map((final app) => MapEntry(app.id, app.name)));
    });
  }

  final AppsBloc _appsBloc;

  @override
  late final List<Option<dynamic>> options = [
    initialApp,
  ];

  /// The initial app to show on app start.
  ///
  /// Defaults to `null` letting the framework choose one.
  late final initialApp = SelectOption<String?>(
    storage: storage,
    key: AccountOptionKeys.initialApp,
    label: (final context) => NeonLocalizations.of(context).accountOptionsInitialApp,
    defaultValue: null,
    values: {},
  );
}

/// Storage keys for the [AccountSpecificOptions].
@internal
enum AccountOptionKeys implements Storable {
  /// The storage key for [AccountSpecificOptions.initialApp]
  initialApp._('initial-app');

  const AccountOptionKeys._(this.value);

  @override
  final String value;
}
