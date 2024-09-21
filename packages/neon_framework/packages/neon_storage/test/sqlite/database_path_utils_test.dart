import 'package:neon_storage/neon_sqlite.dart';
import 'package:test/test.dart';

void main() {
  test('buildDatabasePath', () {
    expect(
      () => buildDatabasePath(null, 'database.db'),
      throwsArgumentError,
    );

    expect(
      () => buildDatabasePath(null, 'tmp/database.db'),
      throwsArgumentError,
    );

    expect(
      buildDatabasePath(null, 'database'),
      equals('database.db'),
    );

    expect(
      buildDatabasePath('/tmp', 'database'),
      equals('/tmp/database.db'),
    );
  });
}
