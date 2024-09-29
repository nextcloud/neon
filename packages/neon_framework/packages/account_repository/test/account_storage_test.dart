import 'package:account_repository/account_repository.dart';
import 'package:account_repository/src/testing/testing.dart';
import 'package:neon_storage/neon_storage.dart';
import 'package:neon_storage/testing.dart';
import 'package:test/test.dart';

void main() {
  late TestTableDatabase database;
  late AccountStorage storage;

  setUp(() async {
    storage = AccountStorage();
    database = TestTableDatabase(storage);
    await database.init();
  });

  tearDown(() async {
    SQLiteCachedPersistence.globalCache.clear();
    await database.close();
  });

  final credentials = createCredentials();

  group('AccountStorage', () {
    group('readCredentials', () {
      test('returns empty list when no value is stored', () async {
        await expectLater(
          storage.readCredentials(),
          completion(isEmpty),
        );
      });

      test('returns list with deserialized credentials', () async {
        await storage.addCredentials(credentials);

        await expectLater(
          storage.readCredentials(),
          completion(equals([credentials])),
        );
      });
    });

    group('addCredentials', () {
      test('updates credentials when already present', () async {
        await storage.addCredentials(credentials);
        await storage.addCredentials(
          createCredentials(appPassword: 'new-appPassword'),
        );

        await expectLater(
          storage.readCredentials(),
          completion(
            equals([
              createCredentials(appPassword: 'new-appPassword'),
            ]),
          ),
        );
      });

      test('adds multiple accounts', () async {
        await storage.addCredentials(credentials);
        await storage.addCredentials(
          createCredentials(username: 'new-username'),
        );

        await expectLater(
          storage.readCredentials(),
          completion(
            equals([
              credentials,
              createCredentials(username: 'new-username'),
            ]),
          ),
        );
      });
    });

    group('removeCredentials', () {
      setUp(() async {
        await storage.addCredentials(credentials);
        await storage.addCredentials(
          createCredentials(username: 'new-username'),
        );
      });
      test('deletes credentials', () async {
        await storage.removeCredentials(
          createCredentials(username: 'new-username'),
        );

        await expectLater(
          storage.readCredentials(),
          completion(equals([credentials])),
        );
      });
    });

    group('readLastAccount', () {
      test('returns null when no value is stored', () async {
        await expectLater(
          storage.readLastAccount(),
          completion(isNull),
        );
      });

      test('returns account id for the stored value', () async {
        await storage.addCredentials(credentials);
        await storage.saveLastAccount(credentials);

        await expectLater(
          storage.readLastAccount(),
          completion(credentials.id),
        );
      });
    });

    group('saveLastAccount', () {
      test('updates active account', () async {
        await storage.addCredentials(credentials);
        await storage.saveLastAccount(credentials);

        final newCredentials = createCredentials(username: 'new-username');
        await storage.addCredentials(newCredentials);
        await storage.saveLastAccount(newCredentials);

        await expectLater(
          storage.readLastAccount(),
          completion(newCredentials.id),
        );
      });
    });
  });
}
