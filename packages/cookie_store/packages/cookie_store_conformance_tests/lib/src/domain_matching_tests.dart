import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/src/utils.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

/// Tests that the store correctly implements the domain-matching algorithm as
/// defined by [RFC6265 section 5.1.3](https://httpwg.org/specs/rfc6265.html#cookie-domain).
@isTestGroup
void domainMatching(FutureOr<CookieStore> Function() cookieStoreFactory) {
  late CookieStore cookieStore;

  setUp(() async {
    cookieStore = await cookieStoreFactory();
  });

  group('domain matching,', () {
    test('do not store not matching domain', () async {
      final cookies = [
        TestCookie('null', 'value')..domain = null,
        TestCookie('example.com', 'value')..domain = 'example.com',
        TestCookie('.example.com', 'value')..domain = '.example.com',
        TestCookie('test.example.com', 'value')..domain = 'test.example.com',
        TestCookie('testexample.com', 'value')..domain = 'testexample.com',
        TestCookie('test.com', 'value')..domain = 'test.com',
      ];

      await cookieStore.saveFromResponse(Uri(host: 'test.example.com'), cookies);
      final stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'example.com=value',
          'null=value',
          'test.example.com=value',
        ]),
      );
    });

    test('do not load not matching domain', () async {
      var cookies = [
        TestCookie('null', 'value')..domain = null,
        TestCookie('example.com', 'value')..domain = 'example.com',
        TestCookie('test.example.com', 'value')..domain = 'test.example.com',
      ];
      await cookieStore.saveFromResponse(Uri(host: 'test.example.com'), cookies);

      cookies = [
        TestCookie('.example.com', 'value')..domain = '.example.com',
      ];
      await cookieStore.saveFromResponse(Uri(host: '.example.com'), cookies);

      cookies = [
        TestCookie('testexample.com', 'value')..domain = 'testexample.com',
      ];
      await cookieStore.saveFromResponse(Uri(host: 'testexample.com'), cookies);

      cookies = [
        TestCookie('test.com', 'value')..domain = 'test.com',
      ];
      await cookieStore.saveFromResponse(Uri(host: 'test.com'), cookies);

      var stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          '.example.com=value',
          'example.com=value',
          'null=value',
          'test.com=value',
          'test.example.com=value',
          'testexample.com=value',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri(host: 'example.com'));
      expect(
        toSortedStringList(stored),
        equals([
          'example.com=value',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri(host: 'test.example.com'));
      expect(
        toSortedStringList(stored),
        equals([
          'example.com=value',
          'null=value',
          'test.example.com=value',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri(host: 'testexample.com'));
      expect(
        toSortedStringList(stored),
        equals([
          'testexample.com=value',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri(host: 'test..example.com'));
      expect(
        toSortedStringList(stored),
        equals([
          '.example.com=value',
          'example.com=value',
        ]),
      );
    });

    group('ip address matching', () {
      test('storing', () async {
        final uri = Uri(host: '1');

        final cookies = [
          TestCookie('IPv4-address', 'value')..domain = '127.0.0.1',
          TestCookie('IPv6-address', 'value')..domain = '::1',
        ];

        await cookieStore.saveFromResponse(uri, cookies);
        final stored = await cookieStore.loadAll();
        expect(
          toSortedStringList(stored),
          equals([]),
        );
      });

      test('do not load from similar domain', () async {
        var cookies = [
          TestCookie('IPv4-address', 'value')..domain = '127.0.0.1',
        ];
        await cookieStore.saveFromResponse(Uri(host: '127.0.0.1'), cookies);

        cookies = [
          TestCookie('IPv6-address', 'value')..domain = '::1',
        ];
        await cookieStore.saveFromResponse(Uri(host: '::1'), cookies);

        var stored = await cookieStore.loadAll();
        expect(
          toSortedStringList(stored),
          equals([
            'IPv4-address=value',
            'IPv6-address=value',
          ]),
        );

        final uri = Uri(host: '1');
        stored = await cookieStore.loadForRequest(uri);
        expect(
          toSortedStringList(stored),
          equals([]),
        );
      });

      test('load when identical', () async {
        var uri = Uri(host: '127.0.0.1');
        var cookies = [
          TestCookie('IPv4-address', 'value')..domain = '127.0.0.1',
        ];
        await cookieStore.saveFromResponse(uri, cookies);
        var stored = await cookieStore.loadForRequest(uri);
        expect(
          toSortedStringList(stored),
          equals([
            'IPv4-address=value',
          ]),
        );

        uri = Uri(host: '::1');
        cookies = [
          TestCookie('IPv6-address', 'value')..domain = '::1',
        ];
        await cookieStore.saveFromResponse(uri, cookies);
        stored = await cookieStore.loadForRequest(uri);
        expect(
          toSortedStringList(stored),
          equals([
            'IPv6-address=value',
          ]),
        );
      });
    });
  });
}
