import 'package:neon_framework/src/storage/storage.dart';

/// Unique storage keys.
///
/// Required by the users of the `NeonStorage` storage backend.
enum StorageKeys implements Storable {
  /// The key for the `AppImplementation`s.
  apps._('app'),

  /// The key for the `Account`s and their `AccountOptions`.
  accountOptions._('accounts'),

  /// The key for the list of logged in `Account`s.
  accounts._('accounts-accounts'),

  /// The key for the `GlobalOptions`.
  global._('global'),

  /// The key for the `AccountsBloc` last used account.
  lastUsedAccount._('last-used-account'),

  /// The key used by the `PushNotificationsBloc` to persist the last used endpoint.
  lastEndpoint._('last-endpoint'),

  /// The key for the `FirstLaunchBloc`.
  firstLaunch._('first-launch'),

  /// The key for the `PushUtils`.
  notifications._('notifications');

  const StorageKeys._(this.value);

  @override
  final String value;
}
