import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/tables.dart' as tables;
import 'package:nextcloud_test/matchers.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:version/version.dart';

void main() {
  presets('tables', 'tables', (tester) {
    test('Is supported', () async {
      final response = await tester.client.core.ocs.getCapabilities();

      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      final result = tester.client.tables.getVersionCheck(response.body.ocs.data);
      expect(result.versions, isNotNull);
      expect(result.versions, isNotEmpty);
      expect(result.isSupported, isTrue);
    });

    group('v1', () {
      group('Tables', () {
        test('Create and destroy', () async {
          final createResponse = await tester.client.tables.api1.createTable(
            $body: tables.Api1CreateTableRequestApplicationJson(
              (b) => b
                ..title = 'title'
                ..emoji = '😀'
                ..template = '',
            ),
          );
          expect(createResponse.statusCode, 200);
          expect(() => createResponse.headers, isA<void>());

          expect(createResponse.body.id, isPositive);
          expect(createResponse.body.title, 'title');
          expect(createResponse.body.emoji, '😀');
          expect(createResponse.body.ownership, 'user1');
          expect(createResponse.body.ownerDisplayName, 'User One');
          expect(createResponse.body.createdBy, 'user1');
          expect(tz.TZDateTime.parse(tz.UTC, createResponse.body.createdAt).isBefore(DateTime.timestamp()), isTrue);
          expect(createResponse.body.lastEditBy, 'user1');
          expect(tz.TZDateTime.parse(tz.UTC, createResponse.body.lastEditAt).isBefore(DateTime.timestamp()), isTrue);
          expect(createResponse.body.archived, tester.version < Version(0, 7, 0) ? null : false);
          expect(createResponse.body.favorite, tester.version < Version(0, 7, 0) ? null : false);
          expect(createResponse.body.isShared, false);
          expect(createResponse.body.hasShares, false);
          expect(createResponse.body.rowsCount, 0);
          expect(createResponse.body.views, isEmpty);
          expect(createResponse.body.columnsCount, 0);

          final deleteResponse = await tester.client.tables.api1.deleteTable(
            tableId: createResponse.body.id,
          );
          expect(deleteResponse.statusCode, 200);
          expect(() => deleteResponse.headers, isA<void>());

          expect(deleteResponse.body.id, isPositive);
          expect(deleteResponse.body.title, 'title');
          expect(deleteResponse.body.emoji, '😀');
          expect(deleteResponse.body.ownership, 'user1');
          expect(deleteResponse.body.ownerDisplayName, tester.version < Version(0, 7, 0) ? null : '');
          expect(deleteResponse.body.createdBy, 'user1');
          expect(tz.TZDateTime.parse(tz.UTC, deleteResponse.body.createdAt).isBefore(DateTime.timestamp()), isTrue);
          expect(deleteResponse.body.lastEditBy, 'user1');
          expect(tz.TZDateTime.parse(tz.UTC, deleteResponse.body.lastEditAt).isBefore(DateTime.timestamp()), isTrue);
          expect(deleteResponse.body.archived, tester.version < Version(0, 7, 0) ? null : false);
          expect(deleteResponse.body.favorite, tester.version < Version(0, 7, 0) ? null : false);
          expect(deleteResponse.body.isShared, false);
          expect(deleteResponse.body.hasShares, false);
          expect(deleteResponse.body.rowsCount, 0);
          expect(deleteResponse.body.views, isEmpty);
          expect(deleteResponse.body.columnsCount, 0);
        });
      });

      group('index', () {
        test('retrieves a list of all tables', () async {
          final response = await tester.client.tables.api1.index();
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());
          expect(response.body, hasLength(1));

          expect(
            response.body.single,
            isA<tables.Table>()
                .having((t) => t.id, 'id', 1)
                .having((t) => t.title, 'title', 'Tutorial')
                .having((t) => t.emoji, 'emoji', '🚀')
                .having((t) => t.ownership, 'ownership', 'user1')
                .having((t) => t.ownerDisplayName, 'ownerDisplayName', 'User One')
                .having((t) => t.createdBy, 'createdBy', 'user1')
                .having(
                  (t) => t.createdAt,
                  'createdAt',
                  closeToDate(DateTime.timestamp(), const Duration(seconds: 30)),
                )
                .having((t) => t.lastEditBy, 'lastEditBy', 'user1')
                .having(
                  (t) => t.lastEditAt,
                  'lastEditAt',
                  closeToDate(DateTime.timestamp(), const Duration(seconds: 30)),
                )
                .having((t) => t.archived, 'archived', tester.version < Version(0, 7, 0) ? isNull : isFalse)
                .having((t) => t.favorite, 'favorite', tester.version < Version(0, 7, 0) ? isNull : isFalse)
                .having((t) => t.isShared, 'isShared', isFalse)
                .having((t) => t.hasShares, 'hasShares', isFalse)
                .having((t) => t.rowsCount, 'rowsCount', 5)
                .having((t) => t.columnsCount, 'columnsCount', 4),
          );
        });
      });

      group('indexTableRowsSimple', () {
        setUp(() async {
          await tester.client.tables.api1.index();
          resetFixture();
        });

        test('retrieves all rows of a table', () async {
          final response = await tester.client.tables.api1.indexTableRowsSimple(
            tableId: 1,
          );
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());
          expect(response.body, hasLength(6));
        });
      });

      group('indexTableRows', () {
        setUp(() async {
          await tester.client.tables.api1.index();
          resetFixture();
        });

        test('retrieves all rows of a table', () async {
          final response = await tester.client.tables.api1.indexTableRows(
            tableId: 1,
          );
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body, hasLength(5));
        });
      });
    });
  });
}
