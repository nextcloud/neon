import 'package:http/http.dart' as http;
import 'package:neon_storage/src/storage/storage.dart';
import 'package:neon_storage/testing.dart';
import 'package:test/test.dart';

void main() {
  group('RequestCache', () {
    late TestTableDatabase database;
    const cache = SQLiteRequestCache();

    setUp(() async {
      database = TestTableDatabase(SQLiteRequestCache.table);
      await database.init();
    });

    tearDown(() async {
      await database.close();
    });

    test('throws when unutilized', () async {
      await database.close();

      expect(() async => cache.get('accountID', http.Request('GET', Uri())), throwsA(isA<StateError>()));
    });

    test('RequestCache', () async {
      final request = http.Request('GET', Uri(host: 'example.com'))
        ..headers.addAll({'a': 'b'})
        ..body = 'c';

      var result = await cache.get('accountID', request);
      expect(result, isNull);

      await cache.set('accountID', request, http.Response('value', 200, headers: {'key': 'value'}));
      result = await cache.get('accountID', request);
      expect(result?.statusCode, 200);
      expect(result?.body, 'value');
      expect(result?.headers, {'key': 'value'});

      for (final modifiedRequest in [
        http.Request('POST', Uri(host: 'example.com'))
          ..headers.addAll({'a': 'b'})
          ..body = 'c',
        http.Request('GET', Uri(host: 'example.org'))
          ..headers.addAll({'a': 'b'})
          ..body = 'c',
        http.Request('GET', Uri(host: 'example.com'))
          ..headers.addAll({'a': 'd'})
          ..body = 'c',
        http.Request('GET', Uri(host: 'example.com'))
          ..headers.addAll({'a': 'b'})
          ..body = 'e',
      ]) {
        result = await cache.get('accountID', modifiedRequest);
        expect(result, isNull);
      }

      await cache.set('accountID', request, http.Response('upsert', 201, headers: {'key': 'updated'}));
      result = await cache.get('accountID', request);
      expect(result?.statusCode, 201);
      expect(result?.body, 'upsert');
      expect(result?.headers, {'key': 'updated'});

      await cache.set('accountID', request, http.Response('value', 200, headers: {'key': 'value'}));
      result = await cache.get('accountID', request);
      expect(result?.statusCode, 200);
      expect(result?.body, 'value');
      expect(result?.headers, {'key': 'value'});

      await cache.updateHeaders('accountID', request, {'key': 'updated'});
      result = await cache.get('accountID', request);
      expect(result?.statusCode, 200);
      expect(result?.body, 'value');
      expect(result?.headers, {'key': 'updated'});
    });
  });
}
