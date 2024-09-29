part of 'account_repository.dart';

/// {@template account_repository_storage}
/// Storage for the [AccountRepository].
/// {@endtemplate}
class AccountStorage with Table {
  /// {@macro account_repository_storage}
  AccountStorage();

  @override
  String get name => 'account_credentials';

  @override
  int get version => 1;

  /// Column for the [Credentials.serverURL].
  @protected
  static const String serverURL = 'server_urlL';

  /// Column for the [Credentials.username].
  @protected
  static const String loginName = 'login_name';

  /// Column for the [Credentials.appPassword].
  @protected
  static const String appPassword = 'app_password';

  /// Column to store the active account.
  @protected
  static const String active = 'active';

  @override
  void onCreate(Batch db, int version) {
    db.execute('''
CREATE TABLE "$name" (
  "$serverURL"      TEXT NOT NULL,
  "$loginName"      TEXT NOT NULL,
  "$appPassword"    TEXT,
  "$active"         BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY("$serverURL", "$loginName")
);
''');
  }

  static final Logger _log = Logger('AccountStorage');

  Database get _database => controller.database;

  /// Gets a list of logged in credentials from storage.
  ///
  /// It is not checked whether the stored information is still valid.
  Future<BuiltList<Credentials>> readCredentials() async {
    try {
      final results = await _database.query(
        name,
        columns: [
          serverURL,
          loginName,
          appPassword,
        ],
      );

      final credentials = ListBuilder<Credentials>();

      for (final result in results) {
        credentials.add(
          Credentials((b) {
            b
              ..serverURL = Uri.parse(result[serverURL]! as String)
              ..username = result[loginName]! as String
              ..appPassword = result[appPassword] as String?;
          }),
        );
      }

      return credentials.build();
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error loading cookies.',
        error,
        stackTrace,
      );
    }

    return BuiltList();
  }

  /// Persists the given [credentials] on disk.
  Future<void> addCredentials(Credentials credentials) async {
    try {
      // UPSERT is only available since SQLite 3.24.0 (June 4, 2018).
      // Using a manual solution from https://stackoverflow.com/a/38463024
      final batch = _database.batch()
        ..update(
          name,
          {
            serverURL: credentials.serverURL.toString(),
            loginName: credentials.username,
            appPassword: credentials.appPassword,
          },
          where: '$serverURL = ? AND $loginName = ?',
          whereArgs: [
            credentials.serverURL.toString(),
            credentials.username,
          ],
        )
        ..rawInsert(
          '''
INSERT INTO $name ($serverURL, $loginName, $appPassword)
SELECT ?, ?, ?
WHERE (SELECT changes() = 0)
''',
          [
            credentials.serverURL.toString(),
            credentials.username,
            credentials.appPassword,
          ],
        );
      await batch.commit(noResult: true);
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error loading cookies.',
        error,
        stackTrace,
      );
    }
  }

  /// Removes the given [credentials] from storage.
  Future<void> removeCredentials(Credentials credentials) async {
    try {
      await _database.delete(
        name,
        where: '$serverURL = ? AND $loginName = ?',
        whereArgs: [
          credentials.serverURL.toString(),
          credentials.username,
        ],
      );
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error loading cookies.',
        error,
        stackTrace,
      );
    }
  }

  /// Retrieves the id of the last used account.
  Future<String?> readLastAccount() async {
    try {
      final results = await _database.query(
        name,
        where: '$active = 1',
        columns: [
          serverURL,
          loginName,
        ],
      );

      if (results.isNotEmpty) {
        final result = results.single;
        return Credentials((b) {
          b
            ..serverURL = Uri.parse(result[serverURL]! as String)
            ..username = result[loginName]! as String;
        }).id;
      }
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error loading cookies.',
        error,
        stackTrace,
      );
    }

    return null;
  }

  /// Sets the last used account to the given [credentials].
  Future<void> saveLastAccount(Credentials credentials) async {
    try {
      final batch = _database.batch()
        ..update(
          name,
          {active: 0},
          where: '$active = 1',
        )
        ..update(
          name,
          {active: 1},
          where: '$serverURL = ? AND $loginName = ?',
          whereArgs: [
            credentials.serverURL.toString(),
            credentials.username,
          ],
        );
      await batch.commit(noResult: true);
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error loading cookies.',
        error,
        stackTrace,
      );
    }
  }
}
