part of 'account_repository.dart';

/// {@template account_repository_storage}
/// Storage for the [AccountRepository].
/// {@endtemplate}
@immutable
class AccountStorage {
  /// {@macro account_repository_storage}
  const AccountStorage({
    required this.accountsPersistence,
    required this.lastAccountPersistence,
  });

  /// The store for the account list.
  final SingleValueStore accountsPersistence;

  /// The store for the last used account.
  final SingleValueStore lastAccountPersistence;

  /// Gets a list of logged in credentials from storage.
  ///
  /// It is not checked whether the stored information is still valid.
  Future<BuiltList<Credentials>> readCredentials() async {
    if (accountsPersistence.hasValue()) {
      return accountsPersistence
          .getStringList()!
          .map((a) => Credentials.fromJson(json.decode(a) as Map<String, dynamic>))
          .toBuiltList();
    }

    return BuiltList();
  }

  /// Saves the given [credentials] to the storage.
  Future<void> saveCredentials(Iterable<Credentials> credentials) async {
    final values = credentials.map((a) => json.encode(a.toJson())).toBuiltList();

    await accountsPersistence.setStringList(values);
  }

  /// Retrieves the id of the last used account.
  Future<String?> readLastAccount() async {
    return lastAccountPersistence.getString();
  }

  /// Sets the last used account to the given [accountID].
  Future<void> saveLastAccount(String? accountID) async {
    if (accountID == null) {
      await lastAccountPersistence.remove();
    } else {
      await lastAccountPersistence.setString(accountID);
    }
  }
}
