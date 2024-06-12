import 'package:http/http.dart' as http;
import 'package:nextcloud/utils.dart';
import 'package:test/test.dart';

class _TestHttpInterceptor implements HttpInterceptor<http.BaseRequest, http.BaseResponse> {
  @override
  http.BaseRequest interceptRequest({required http.BaseRequest request}) => throw UnimplementedError();

  @override
  http.BaseResponse interceptResponse({required http.BaseResponse response}) => throw UnimplementedError();

  @override
  bool shouldInterceptRequest() => throw UnimplementedError();

  @override
  bool shouldInterceptResponse() => throw UnimplementedError();
}

void main() {
  group('HttpInterceptor', () {
    test('can be implemented', () {
      expect(_TestHttpInterceptor(), isNotNull);
    });
  });
}
