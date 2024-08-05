import 'package:nextcloud/webdav.dart';
import 'package:test/test.dart';

void main() {
  test('WebDavDepth value', () {
    expect(WebDavDepth.zero.value, equals('0'));
    expect(WebDavDepth.one.value, equals('1'));
    expect(WebDavDepth.infinity.value, equals('infinity'));
  });
}
