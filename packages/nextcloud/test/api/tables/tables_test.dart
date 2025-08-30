import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/tables.dart' as tables;
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

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
          expect(createResponse.body.archived, false);
          expect(createResponse.body.favorite, false);
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
          expect(deleteResponse.body.ownerDisplayName, '');
          expect(deleteResponse.body.createdBy, 'user1');
          expect(tz.TZDateTime.parse(tz.UTC, deleteResponse.body.createdAt).isBefore(DateTime.timestamp()), isTrue);
          expect(deleteResponse.body.lastEditBy, 'user1');
          expect(tz.TZDateTime.parse(tz.UTC, deleteResponse.body.lastEditAt).isBefore(DateTime.timestamp()), isTrue);
          expect(deleteResponse.body.archived, false);
          expect(deleteResponse.body.favorite, false);
          expect(deleteResponse.body.isShared, false);
          expect(deleteResponse.body.hasShares, false);
          expect(deleteResponse.body.rowsCount, 0);
          expect(deleteResponse.body.views, isEmpty);
          expect(deleteResponse.body.columnsCount, 0);
        });
      });
    });
  });
}
