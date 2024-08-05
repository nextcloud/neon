import 'package:nextcloud/src/api/webdav/webdav.dart';
import 'package:test/test.dart';

void main() {
  group('constructUri', () {
    for (final values in [
      ('http://cloud.example.com', 'http://cloud.example.com'),
      ('http://cloud.example.com/', 'http://cloud.example.com'),
      ('http://cloud.example.com/subdir', 'http://cloud.example.com/subdir'),
      ('http://cloud.example.com/subdir/', 'http://cloud.example.com/subdir'),
    ]) {
      final baseURL = Uri.parse(values.$1);
      final sanitizedBaseURL = Uri.parse(values.$2);

      test(baseURL, () {
        expect(
          constructUri(baseURL).toString(),
          '$sanitizedBaseURL$webdavBase',
        );
        expect(
          constructUri(baseURL, PathUri.parse('/')).toString(),
          '$sanitizedBaseURL$webdavBase',
        );
        expect(
          constructUri(baseURL, PathUri.parse('test')).toString(),
          '$sanitizedBaseURL$webdavBase/test',
        );
        expect(
          constructUri(baseURL, PathUri.parse('test/')).toString(),
          '$sanitizedBaseURL$webdavBase/test',
        );
        expect(
          constructUri(baseURL, PathUri.parse('/test')).toString(),
          '$sanitizedBaseURL$webdavBase/test',
        );
        expect(
          constructUri(baseURL, PathUri.parse('/test/')).toString(),
          '$sanitizedBaseURL$webdavBase/test',
        );
      });
    }
  });
}
