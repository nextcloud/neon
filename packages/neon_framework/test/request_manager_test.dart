import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_value/serializer.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:nextcloud/utils.dart';
import 'package:nextcloud/webdav.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

String base64String(String value) => base64.encode(utf8.encode(value));

void main() {
  final account = MockAccount();
  when(() => account.id).thenReturn('clientID');
  late MockNeonStorage storage;

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    storage = MockNeonStorage();
    when(() => storage.requestCache).thenReturn(null);
  });

  tearDown(() {
    RequestManager.instance = null;
  });

  group('RequestManager', () {
    test('singleton', () {
      expect(identical(RequestManager.instance, RequestManager.instance), isTrue);
    });

    test('timeout', () async {
      final callback = MockCallbackFunction<Future<bool>>();
      when(callback.call).thenAnswer((_) async => Future.delayed(const Duration(milliseconds: 100), () => true));

      expect(
        () => RequestManager.instance.timeout<bool>(
          () async => callback.call(),
          timeLimit: const Duration(milliseconds: 50),
        ),
        throwsA(isA<TimeoutException>()),
      );
      verify(callback.call).called(1);

      var result = await RequestManager.instance.timeout<bool>(
        () async => callback.call(),
        disableTimeout: true,
        timeLimit: const Duration(milliseconds: 50),
      );
      expect(result, isTrue);
      verify(callback.call).called(1);

      result = await RequestManager.instance.timeout<bool>(
        () async => callback.call(),
        timeLimit: const Duration(milliseconds: 150),
      );
      expect(result, isTrue);
      verify(callback.call).called(1);
    });

    group('throwing DynamiteException should retry', () {
      for (final entry in [
        ('server side', 500, <String, String>{}, kMaxTries),
        ('client side', 401, <String, String>{}, 1),
        ('webdav authorization', 401, <String, String>{'content-type': 'application/xml; charset=utf-8'}, kMaxTries),
        ('webdav not found', 404, <String, String>{'content-type': 'application/xml; charset=utf-8'}, 1),
      ]) {
        group(entry.$1, () {
          test('wrap', () async {
            final subject = BehaviorSubject<Result<String>>();
            final callback = MockCallbackFunction<Future<Uint8List>>();
            when(callback.call).thenAnswer(
              (_) async => throw DynamiteStatusCodeException(http.Response('', entry.$2, headers: entry.$3)),
            );

            await RequestManager.instance.wrap<String, Uint8List>(
              account: account,
              cacheKey: 'key',
              subject: subject,
              request: () async => callback.call(),
              unwrap: (deserialized) => base64.encode(deserialized),
              serialize: (deserialized) => deserialized,
              deserialize: (serialized) => serialized,
            );

            verify(callback.call).called(entry.$4);

            await subject.close();
          });

          test('wrapBinary', () async {
            final subject = BehaviorSubject<Result<Uint8List>>();
            final callback = MockCallbackFunction<http.BaseRequest>();
            when(callback.call).thenAnswer(
              (_) => throw DynamiteStatusCodeException(http.Response('', entry.$2, headers: entry.$3)),
            );

            when(() => account.client).thenReturn(
              NextcloudClient(
                Uri(),
                loginName: '',
                password: '',
              ),
            );

            await RequestManager.instance.wrapBinary(
              account: account,
              cacheKey: 'key',
              subject: subject,
              getRequest: callback.call,
              getCacheParameters: () async => const CacheParameters(
                etag: null,
                expires: null,
              ),
              unwrap: (data) => data,
            );

            verify(callback.call).called(entry.$4);

            await subject.close();
          });

          test('wrapWebDav', () async {
            final subject = BehaviorSubject<Result<WebDavMultistatus>>();
            final callback = MockCallbackFunction<http.BaseRequest>();
            when(callback.call).thenAnswer(
              (_) => throw DynamiteStatusCodeException(http.Response('', entry.$2, headers: entry.$3)),
            );

            when(() => account.client).thenReturn(
              NextcloudClient(
                Uri(),
                loginName: '',
                password: '',
              ),
            );

            await RequestManager.instance.wrapWebDav(
              account: account,
              cacheKey: 'key',
              subject: subject,
              getRequest: callback.call,
              unwrap: (data) => data,
            );

            verify(callback.call).called(entry.$4);

            await subject.close();
          });

          test('wrapNextcloud', () async {
            final subject = BehaviorSubject<Result<provisioning_api.UserDetails>>();
            final callback = MockCallbackFunction<http.BaseRequest>();
            when(callback.call).thenAnswer(
              (_) => throw DynamiteStatusCodeException(http.Response('', entry.$2, headers: entry.$3)),
            );

            when(() => account.client).thenReturn(
              NextcloudClient(
                Uri(),
                loginName: '',
                password: '',
              ),
            );

            await RequestManager.instance.wrapNextcloud(
              account: account,
              cacheKey: 'key',
              subject: subject,
              getRequest: callback.call,
              unwrap: (data) => data.body.ocs.data,
              serializer: account.client.provisioningApi.users.$getCurrentUser_Serializer(),
            );

            verify(callback.call).called(entry.$4);

            await subject.close();
          });
        });
      }
    });

    group('wrap without cache', () {
      test('successful request', () async {
        var subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () async => utf8.encode('Test value'),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();

        subject = BehaviorSubject.seeded(Result.success('Seed value'));

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result.success('Seed value')),
            equals(Result.success('Seed value').asLoading()),
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () async => utf8.encode('Test value'),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();
      });

      test('timeout request', () async {
        var subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result<String>.error('TimeoutException after 0:00:00.050000: Future not completed')),
            emitsDone,
          ]),
        );

        expect(
          subject.stream,
          neverEmits([
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.delayed(const Duration(milliseconds: 100), () => utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
          timeLimit: const Duration(milliseconds: 50),
        );

        await subject.close();

        subject = BehaviorSubject<Result<String>>.seeded(Result.success('Seed value'));

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result.success('Seed value')),
            equals(Result.success('Seed value').asLoading()),
            equals(
              Result(
                'Seed value',
                'TimeoutException after 0:00:00.050000: Future not completed',
                isLoading: false,
                isCached: false,
              ),
            ),
            emitsDone,
          ]),
        );

        expect(
          subject.stream,
          neverEmits([
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.delayed(const Duration(milliseconds: 100), () => utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
          timeLimit: const Duration(milliseconds: 50),
        );

        await subject.close();
      });

      test('throwing request', () async {
        var subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result<String>.error('ClientException: ')),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () async => throw ClientException(''),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();

        subject = BehaviorSubject<Result<String>>.seeded(Result.success('Seed value'));

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result.success('Seed value')),
            equals(Result.success('Seed value').asLoading()),
            equals(Result('Seed value', 'ClientException: ', isLoading: false, isCached: false)),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () async => throw ClientException(''),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();
      });
    });

    group('wrap with cache', () {
      late MockRequestCache cache;

      setUpAll(() {
        registerFallbackValue(account);
      });

      setUp(() async {
        cache = MockRequestCache();

        when(() => cache.get(any(), any())).thenAnswer(
          (_) => Future.value((value: utf8.encode('Cached value'), parameters: null)),
        );

        when(() => cache.set(any(), any(), any(), any())).thenAnswer(
          (_) => Future.value(),
        );

        when(() => cache.updateParameters(any(), any(), any())).thenAnswer(
          (_) => Future.value(),
        );

        when(() => storage.requestCache).thenReturn(cache);
      });

      test('successful request', () async {
        var subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.value(utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verify(() => cache.set(account, 'key', utf8.encode('Test value'), null)).called(1);

        subject = BehaviorSubject<Result<String>>.seeded(Result.success('Seed value'));

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result.success('Seed value')),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.value(utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verify(() => cache.set(account, 'key', utf8.encode('Test value'), null)).called(1);
      });

      test('timeout request', () async {
        var subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(
              Result(
                base64String('Cached value'),
                'TimeoutException after 0:00:00.050000: Future not completed',
                isLoading: false,
                isCached: true,
              ),
            ),
            emitsDone,
          ]),
        );

        expect(
          subject.stream,
          neverEmits([
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.delayed(const Duration(milliseconds: 100), () => utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
          timeLimit: const Duration(milliseconds: 50),
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verifyNever(() => cache.set(any(), any(), any(), any()));

        subject = BehaviorSubject<Result<String>>.seeded(Result.success('Seed value'));

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result.success('Seed value')),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(
              Result(
                base64String('Cached value'),
                'TimeoutException after 0:00:00.050000: Future not completed',
                isLoading: false,
                isCached: true,
              ),
            ),
            emitsDone,
          ]),
        );

        expect(
          subject.stream,
          neverEmits([
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.delayed(const Duration(milliseconds: 100), () => utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
          timeLimit: const Duration(milliseconds: 50),
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verifyNever(() => cache.set(any(), any(), any(), any()));
      });

      test('throwing request', () async {
        var subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(Result(base64String('Cached value'), 'ClientException: ', isLoading: false, isCached: true)),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () async => throw ClientException(''),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verifyNever(() => cache.set(any(), any(), any(), any()));

        subject = BehaviorSubject<Result<String>>.seeded(Result.success('Seed value'));

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result.success('Seed value')),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(Result(base64String('Cached value'), 'ClientException: ', isLoading: false, isCached: true)),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () async => throw ClientException(''),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verifyNever(() => cache.set(any(), any(), any(), any()));
      });

      test('cached Expires', () async {
        when(() => cache.get(any(), any())).thenAnswer(
          (_) => Future.value(
            (
              value: utf8.encode('Cached value'),
              parameters: CacheParameters(
                etag: null,
                expires: tz.TZDateTime.now(tz.UTC).add(const Duration(hours: 1)),
              )
            ),
          ),
        );

        var subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result(base64String('Cached value'), null, isLoading: false, isCached: true)),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.value(utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verifyNever(() => cache.set(any(), any(), any(), any()));

        when(() => cache.get(any(), any())).thenAnswer(
          (_) => Future.value(
            (
              value: utf8.encode('Cached value'),
              parameters: CacheParameters(
                etag: null,
                expires: tz.TZDateTime.now(tz.UTC).subtract(const Duration(hours: 1)),
              )
            ),
          ),
        );

        subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.value(utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verify(() => cache.set(any(), any(), any(), any())).called(1);
      });

      test('cached ETag', () async {
        final callback = MockCallbackFunction<Future<CacheParameters>>();
        final newExpires = tz.TZDateTime.from(
          DateTime.timestamp().copyWith(millisecond: 0, microsecond: 0).add(const Duration(hours: 1)),
          tz.UTC,
        );

        when(() => cache.get(any(), any())).thenAnswer(
          (_) => Future.value(
            (
              value: utf8.encode('Cached value'),
              parameters: const CacheParameters(
                etag: 'a',
                expires: null,
              ),
            ),
          ),
        );
        when(callback.call).thenAnswer(
          (_) async => CacheParameters(
            etag: 'a',
            expires: newExpires,
          ),
        );

        var subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(Result(base64String('Cached value'), null, isLoading: false, isCached: true)),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.value(utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
          getCacheParameters: () async => callback(),
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verify(callback.call).called(1);
        verify(() => cache.updateParameters(account, 'key', CacheParameters(etag: 'a', expires: newExpires))).called(1);
        verifyNever(() => cache.set(any(), any(), any(), any()));

        when(() => cache.get(any(), any())).thenAnswer(
          (_) => Future.value(
            (
              value: utf8.encode('Cached value'),
              parameters: const CacheParameters(
                etag: 'a',
                expires: null,
              ),
            ),
          ),
        );
        when(callback.call).thenAnswer(
          (_) async => CacheParameters(
            etag: 'b',
            expires: newExpires,
          ),
        );

        subject = BehaviorSubject<Result<String>>();

        expect(
          subject.stream,
          emitsInOrder([
            equals(Result<String>.loading()),
            equals(Result(base64String('Cached value'), null, isLoading: true, isCached: true)),
            equals(Result.success(base64String('Test value'))),
            emitsDone,
          ]),
        );

        await RequestManager.instance.wrap<String, Uint8List>(
          account: account,
          cacheKey: 'key',
          subject: subject,
          request: () => Future.value(utf8.encode('Test value')),
          unwrap: (deserialized) => base64.encode(deserialized),
          serialize: (deserialized) => deserialized,
          deserialize: (serialized) => serialized,
          getCacheParameters: () async => callback(),
        );

        await subject.close();
        verify(() => cache.get(account, 'key')).called(1);
        verify(callback.call).called(1);
        verify(() => cache.set(account, 'key', utf8.encode('Test value'), null));
        verifyNever(() => cache.updateParameters(any(), any(), any()));
      });

      test('cache ETag and Expires', () async {
        for (final (hours, isSet) in [(1, true), (-1, false)]) {
          final newExpires = tz.TZDateTime.from(
            DateTime.timestamp().copyWith(millisecond: 0, microsecond: 0).add(Duration(hours: hours)),
            tz.UTC,
          );

          final subject = BehaviorSubject<Result<String>>();

          expect(
            subject.stream,
            emitsInOrder([
              equals(Result<String>.loading()),
              equals(Result('Cached value', null, isLoading: true, isCached: true)),
              equals(Result.success('Test value')),
              emitsDone,
            ]),
          );

          await RequestManager.instance.wrap<String, DynamiteResponse<String, Map<String, String>>>(
            account: account,
            cacheKey: 'key',
            subject: subject,
            request: () async => DynamiteRawResponse<String, Map<String, String>>(
              statusCode: 200,
              body: 'Test value',
              headers: const {},
              rawHeaders: {
                'etag': 'a',
                'expires': formatHttpDate(newExpires),
              },
            ),
            unwrap: (rawResponse) => rawResponse.body,
            serialize: (rawResponse) => utf8.encode(rawResponse.body),
            deserialize: (data) {
              final json = {
                'statusCode': 200,
                'body': utf8.decode(data),
                'headers': <String, String>{},
              };

              final serializer = DynamiteSerializer<String, Map<String, String>>(
                bodyType: const FullType(String),
                headersType: const FullType(Map, [FullType(String), FullType(String)]),
                serializers: Serializers(),
              );

              return RawResponseDecoder<String, Map<String, String>>(serializer).convert(json);
            },
          );

          await subject.close();
          verify(() => cache.get(account, 'key')).called(1);
          verify(
            () => cache.set(
              account,
              'key',
              utf8.encode('Test value'),
              CacheParameters(etag: 'a', expires: isSet ? newExpires : null),
            ),
          ).called(1);
        }
      });
    });
  });
}
