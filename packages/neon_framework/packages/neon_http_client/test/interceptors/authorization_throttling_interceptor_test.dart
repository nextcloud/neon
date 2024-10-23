import 'dart:convert';

import 'package:http/http.dart';
import 'package:neon_http_client/src/interceptors/authorization_throttling_interceptor.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

final jsonHeaders = <String, String>{
  'content-type': 'application/json; charset=utf-8',
};

final userNotLoggedInBody = JsonUtf8Encoder().convert(
  {
    'ocs': {
      'meta': {
        'statuscode': 997,
      },
    },
  },
);

void main() {
  final baseURL = Uri.parse('https://cloud.example.com:8443/nextcloud');

  group(AuthorizationThrottlingInterceptor, () {
    test('blocks after unauthorized response', () async {
      final interceptor = AuthorizationThrottlingInterceptor(baseURL: baseURL);

      final authorizedRequest = Request('GET', baseURL);
      authorizedRequest.headers['authorization'] = 'test';
      final authorizedResponse = StreamedResponse(
        Stream.value(userNotLoggedInBody),
        401,
        headers: jsonHeaders,
        request: authorizedRequest,
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );

      expect(
        interceptor.shouldInterceptResponse(authorizedResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: authorizedResponse, url: authorizedRequest.url),
        completion(isA<StreamedResponse>()),
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isTrue,
      );
      await expectLater(
        () async => interceptor.interceptRequest(request: authorizedRequest),
        throwsA(isA<DynamiteStatusCodeException>().having((e) => e.response.statusCode, 'response.statusCode', 401)),
      );
    });

    test('does not block after unauthorized non-JSON response', () async {
      final interceptor = AuthorizationThrottlingInterceptor(baseURL: baseURL);

      final authorizedRequest = Request('GET', baseURL);
      authorizedRequest.headers['authorization'] = 'test';
      final authorizedResponse = StreamedResponse(
        Stream.value(userNotLoggedInBody),
        401,
        headers: {
          'content-type': 'text/plain',
        },
        request: authorizedRequest,
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );

      expect(
        interceptor.shouldInterceptResponse(authorizedResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: authorizedResponse, url: authorizedRequest.url),
        completion(isA<StreamedResponse>()),
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );
    });

    test('does not block after unauthorized response with non OCS response', () async {
      final interceptor = AuthorizationThrottlingInterceptor(baseURL: baseURL);

      final authorizedRequest = Request('GET', baseURL);
      authorizedRequest.headers['authorization'] = 'test';
      final authorizedResponse = StreamedResponse(
        Stream.value(
          JsonUtf8Encoder().convert(
            {
              'abc': {
                'def': 123,
              },
            },
          ),
        ),
        401,
        headers: jsonHeaders,
        request: authorizedRequest,
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );

      expect(
        interceptor.shouldInterceptResponse(authorizedResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: authorizedResponse, url: authorizedRequest.url),
        completion(isA<StreamedResponse>()),
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );
    });

    test('does not block after unauthorized response with OCS response with different statuscode', () async {
      final interceptor = AuthorizationThrottlingInterceptor(baseURL: baseURL);

      final authorizedRequest = Request('GET', baseURL);
      authorizedRequest.headers['authorization'] = 'test';
      final authorizedResponse = StreamedResponse(
        Stream.value(
          JsonUtf8Encoder().convert(
            {
              'ocs': {
                'meta': {
                  'statuscode': 123,
                },
              },
            },
          ),
        ),
        401,
        headers: jsonHeaders,
        request: authorizedRequest,
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );

      expect(
        interceptor.shouldInterceptResponse(authorizedResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: authorizedResponse, url: authorizedRequest.url),
        completion(isA<StreamedResponse>()),
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );
    });

    test('unblocks after successful poll', () async {
      final interceptor = AuthorizationThrottlingInterceptor(baseURL: baseURL);

      final authorizedRequest = Request('GET', baseURL);
      authorizedRequest.headers['authorization'] = 'test';
      final authorizedResponse = StreamedResponse(
        Stream.value(userNotLoggedInBody),
        401,
        headers: jsonHeaders,
        request: authorizedRequest,
      );

      final pollRequest = Request(
        'POST',
        Uri.parse('$baseURL/index.php/login/v2/poll'),
      );
      final pollResponse = StreamedResponse(
        const Stream.empty(),
        200,
        request: pollRequest,
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );

      expect(
        interceptor.shouldInterceptResponse(authorizedResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: authorizedResponse, url: authorizedRequest.url),
        completion(isA<StreamedResponse>()),
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isTrue,
      );
      await expectLater(
        () async => interceptor.interceptRequest(request: authorizedRequest),
        throwsA(isA<DynamiteStatusCodeException>().having((e) => e.response.statusCode, 'response.statusCode', 401)),
      );

      expect(
        interceptor.shouldInterceptRequest(pollRequest),
        isFalse,
      );
      expect(
        interceptor.shouldInterceptResponse(pollResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: pollResponse, url: pollRequest.url),
        completion(isA<StreamedResponse>()),
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );
    });

    test('never blocks requests not matching baseURL', () async {
      final interceptor = AuthorizationThrottlingInterceptor(baseURL: baseURL);

      final otherServerRequest = Request('GET', Uri.parse('http://example.com'));
      otherServerRequest.headers['authorization'] = 'test';
      final otherServerResponse = StreamedResponse(
        Stream.value(userNotLoggedInBody),
        401,
        headers: jsonHeaders,
        request: otherServerRequest,
      );

      final correctServerRequest = Request('GET', baseURL);
      correctServerRequest.headers['authorization'] = 'test';
      final correctServerResponse = StreamedResponse(
        Stream.value(userNotLoggedInBody),
        401,
        headers: jsonHeaders,
        request: correctServerRequest,
      );

      expect(
        interceptor.shouldInterceptRequest(otherServerRequest),
        isFalse,
      );
      expect(
        interceptor.shouldInterceptResponse(otherServerResponse),
        isFalse,
      );

      expect(
        interceptor.shouldInterceptRequest(correctServerRequest),
        isFalse,
      );
      expect(
        interceptor.shouldInterceptResponse(correctServerResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: correctServerResponse, url: correctServerRequest.url),
        completion(isA<StreamedResponse>()),
      );
      expect(
        interceptor.shouldInterceptRequest(correctServerRequest),
        isTrue,
      );
      await expectLater(
        () async => interceptor.interceptRequest(request: correctServerRequest),
        throwsA(isA<DynamiteStatusCodeException>().having((e) => e.response.statusCode, 'response.statusCode', 401)),
      );

      expect(
        interceptor.shouldInterceptRequest(otherServerRequest),
        isFalse,
      );
      expect(
        interceptor.shouldInterceptResponse(otherServerResponse),
        isFalse,
      );
    });

    test('never blocks requests without authorization', () async {
      final interceptor = AuthorizationThrottlingInterceptor(baseURL: baseURL);

      final unauthorizedRequest = Request('GET', baseURL);
      final unauthorizedResponse = StreamedResponse(
        Stream.value(userNotLoggedInBody),
        401,
        headers: jsonHeaders,
        request: unauthorizedRequest,
      );

      final authorizedRequest = Request('GET', baseURL);
      authorizedRequest.headers['authorization'] = 'test';
      final authorizedResponse = StreamedResponse(
        Stream.value(userNotLoggedInBody),
        401,
        headers: jsonHeaders,
        request: authorizedRequest,
      );

      expect(
        interceptor.shouldInterceptRequest(unauthorizedRequest),
        isFalse,
      );
      expect(
        interceptor.shouldInterceptResponse(unauthorizedResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: unauthorizedResponse, url: unauthorizedRequest.url),
        completion(isA<StreamedResponse>()),
      );

      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isFalse,
      );
      expect(
        interceptor.shouldInterceptResponse(authorizedResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: authorizedResponse, url: authorizedRequest.url),
        completion(isA<StreamedResponse>()),
      );
      expect(
        interceptor.shouldInterceptRequest(authorizedRequest),
        isTrue,
      );
      await expectLater(
        () async => interceptor.interceptRequest(request: authorizedRequest),
        throwsA(isA<DynamiteStatusCodeException>().having((e) => e.response.statusCode, 'response.statusCode', 401)),
      );

      expect(
        interceptor.shouldInterceptRequest(unauthorizedRequest),
        isFalse,
      );
      expect(
        interceptor.shouldInterceptResponse(unauthorizedResponse),
        isTrue,
      );
      await expectLater(
        interceptor.interceptResponse(response: unauthorizedResponse, url: unauthorizedRequest.url),
        completion(isA<StreamedResponse>()),
      );
    });
  });
}
