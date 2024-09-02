import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:interceptor_http_client/interceptor_http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockInterceptor extends Mock implements HttpInterceptor {}

class _FakeUri extends Fake implements Uri {}

void main() {
  final uri = Uri.parse('http://example.com');
  Request fakeRequest() {
    return Request('PUT', uri);
  }

  StreamedResponse fakeResponse() {
    return StreamedResponse(const Stream.empty(), 200);
  }

  final mockedClient = MockClient((request) async {
    return Response.fromStream(fakeResponse());
  });
  late InterceptorHttpClient client;

  setUpAll(() {
    registerFallbackValue(_FakeUri());
    registerFallbackValue(fakeResponse());
    registerFallbackValue(fakeRequest());
  });

  tearDown(() {
    client.close();
  });

  group(InterceptorHttpClient, () {
    group('interceptors', () {
      late HttpInterceptor interceptor;

      setUp(() {
        interceptor = _MockInterceptor();

        client = InterceptorHttpClient(
          baseClient: mockedClient,
          interceptors: BuiltList([interceptor]),
        );
      });

      test('does not intercept', () async {
        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(false);
        when(() => interceptor.shouldInterceptResponse(any())).thenReturn(false);

        final request = Request('GET', uri);
        await client.send(request);

        verifyNever(
          () => interceptor.interceptRequest(
            request: any(named: 'request'),
          ),
        );
        verifyNever(
          () => interceptor.interceptResponse(
            response: any(named: 'response'),
            url: any(named: 'url'),
          ),
        );
      });

      test('does intercept', () async {
        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(true);
        when(() => interceptor.shouldInterceptResponse(any())).thenReturn(true);
        when(
          () => interceptor.interceptRequest(request: any(named: 'request')),
        ).thenReturn(fakeRequest());
        when(
          () => interceptor.interceptResponse(response: any(named: 'response'), url: any(named: 'url')),
        ).thenReturn(fakeResponse());

        final request = Request('GET', uri);
        await client.send(request);

        verify(
          () => interceptor.interceptRequest(
            request: any(named: 'request', that: equals(request)),
          ),
        ).called(1);
        verify(
          () => interceptor.interceptResponse(
            response: any(named: 'response'),
            url: any(named: 'url', that: equals(uri)),
          ),
        ).called(1);
      });

      test('rethrows errors as InterceptionFailure', () async {
        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(true);
        when(
          () => interceptor.interceptRequest(request: any(named: 'request')),
        ).thenThrow(StateError('message'));

        expect(
          client.get(uri),
          throwsA(
            isA<InterceptionException>().having(
              (e) => e.uri,
              'uri',
              uri,
            ),
          ),
        );

        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(true);
        when(() => interceptor.interceptRequest(request: any(named: 'request'))).thenReturn(fakeRequest());
        when(() => interceptor.shouldInterceptResponse(any())).thenReturn(true);
        when(
          () => interceptor.interceptResponse(response: any(named: 'response'), url: any(named: 'url')),
        ).thenThrow(StateError('message'));

        expect(
          client.get(uri),
          throwsA(
            isA<InterceptionException>().having(
              (e) => e.uri,
              'uri',
              uri,
            ),
          ),
        );
      });
    });
  });
}
