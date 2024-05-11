import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/settings/models/option.dart';
import 'package:neon_framework/src/settings/models/options_collection.dart';
import 'package:neon_framework/storage.dart';

/// Account related options.
@internal
@immutable
class AccountOptions extends OptionsCollection {
  /// Creates a new account options collection.
  AccountOptions(super.storage);

  void updateAppImplementations(BuiltSet<AppImplementation> appImplementations) {
    initialApp.values = {
      null: (context) => NeonLocalizations.of(context).accountOptionsAutomatic,
    }..addEntries(appImplementations.map((app) => MapEntry(app.id, app.name)));
  }

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
    label: (context) => NeonLocalizations.of(context).accountOptionsInitialApp,
    defaultValue: null,
    values: {},
  );
}

/// Storage keys for the [AccountOptions].
@internal
enum AccountOptionKeys implements Storable {
  /// The storage key for [AccountOptions.initialApp]
  initialApp._('initial-app');

  const AccountOptionKeys._(this.value);

  @override
  final String value;
}
