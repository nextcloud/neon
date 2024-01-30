import 'package:meta/meta.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/ids.dart';

/// Interface of a storable element.
///
/// Usually used in enhanced enums to ensure uniqueness of the storage keys.
abstract interface class Storable {
  /// The key of this storage element.
  String get value;
}

/// Unique storage keys.
///
/// Required by the users of the [NeonStorage] storage backend.
@internal
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
  notifications._(AppIDs.notifications);

  const StorageKeys._(this.value);

  @override
  final String value;
}

/// A storage that saves a single value.
///
/// [NeonStorage.init] must be called and completed before accessing individual values.
///
/// See:
///   * [NeonStorage] to initialize the storage backend.
@immutable
@internal
final class SingleValueStorage implements KeyValueStorage {
  /// Creates a new storage for a single value.
  const SingleValueStorage(this.key);

  @override
  final StorageKeys key;

  @override
  bool hasValue() => NeonStorage().database.containsKey(key.value);

  @override
  Future<bool> remove() => NeonStorage().database.remove(key.value);

  @override
  String? getString() => NeonStorage().database.getString(key.value);

  @override
  Future<bool> setString(String value) => NeonStorage().database.setString(key.value, value);

  @override
  bool? getBool() => NeonStorage().database.getBool(key.value);

  @override
  Future<bool> setBool(bool value) => NeonStorage().database.setBool(key.value, value);

  @override
  List<String>? getStringList() => NeonStorage().database.getStringList(key.value);

  @override
  Future<bool> setStringList(List<String> value) => NeonStorage().database.setStringList(key.value, value);
}
