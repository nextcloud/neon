import 'package:dynamite_runtime/http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpRequest extends Mock implements HttpClientRequest {
  MockHttpRequest(this.response);

  final MockHttpResponse response;

  @override
  final cookies = <Cookie>[];

  @override
  final headers = MockHttpHeaders();

  @override
  Future<HttpClientResponse> close() async => response;
}

class MockHttpHeaders extends Mock implements HttpHeaders {}

class MockHttpResponse extends Mock implements HttpClientResponse {
  MockHttpResponse(this.cookies);

  @override
  final List<Cookie> cookies;
}

void main() {
  final uri = Uri.parse('http://example.com');
  late CookieJar cookieJar;
  late HttpClient httpClient;
  late DynamiteClient client;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    cookieJar = CookieJar();
    httpClient = MockHttpClient();
    client = DynamiteClient(
      uri,
      httpClient: httpClient,
      cookieJar: cookieJar,
    );
  });

  test('Cookies', () async {
    await cookieJar.saveFromResponse(uri, [Cookie('a', 'b')]);
    // ignore: close_sinks
    final mockRequest = MockHttpRequest(MockHttpResponse([Cookie('c', 'd')]));
    when(() => httpClient.openUrl(any(), any())).thenAnswer((_) => Future.value(mockRequest));

    await client.executeRequest('GET', '', {}, null, null);
    expect(mockRequest.cookies, hasLength(1));
    expect(mockRequest.cookies[0].name, 'a');
    expect(mockRequest.cookies[0].value, 'b');

    final cookies = await cookieJar.loadForRequest(uri);
    expect(cookies, hasLength(2));
    expect(cookies[0].name, 'a');
    expect(cookies[0].value, 'b');
    expect(cookies[1].name, 'c');
    expect(cookies[1].value, 'd');
  });
}
