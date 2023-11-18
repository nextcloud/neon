import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

import 'helper.dart';

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
          WebDavClient.constructUri(baseURL).toString(),
          '$sanitizedBaseURL$webdavBase',
        );
        expect(
          WebDavClient.constructUri(baseURL, PathUri.parse('/')).toString(),
          '$sanitizedBaseURL$webdavBase',
        );
        expect(
          WebDavClient.constructUri(baseURL, PathUri.parse('test')).toString(),
          '$sanitizedBaseURL$webdavBase/test',
        );
        expect(
          WebDavClient.constructUri(baseURL, PathUri.parse('test/')).toString(),
          '$sanitizedBaseURL$webdavBase/test',
        );
        expect(
          WebDavClient.constructUri(baseURL, PathUri.parse('/test')).toString(),
          '$sanitizedBaseURL$webdavBase/test',
        );
        expect(
          WebDavClient.constructUri(baseURL, PathUri.parse('/test/')).toString(),
          '$sanitizedBaseURL$webdavBase/test',
        );
      });
    }
  });

  group('PathUri', () {
    test('isAbsolute', () {
      expect(PathUri.parse('').isAbsolute, false);
      expect(PathUri.parse('/').isAbsolute, true);
      expect(PathUri.parse('test').isAbsolute, false);
      expect(PathUri.parse('test/').isAbsolute, false);
      expect(PathUri.parse('/test').isAbsolute, true);
      expect(PathUri.parse('/test/').isAbsolute, true);
    });

    test('isDirectory', () {
      expect(PathUri.parse('').isDirectory, true);
      expect(PathUri.parse('/').isDirectory, true);
      expect(PathUri.parse('test').isDirectory, false);
      expect(PathUri.parse('test/').isDirectory, true);
      expect(PathUri.parse('/test').isDirectory, false);
      expect(PathUri.parse('/test/').isDirectory, true);
    });

    test('pathSegments', () {
      expect(PathUri.parse('').pathSegments, isEmpty);
      expect(PathUri.parse('/').pathSegments, isEmpty);
      expect(PathUri.parse('test').pathSegments, ['test']);
      expect(PathUri.parse('test/').pathSegments, ['test']);
      expect(PathUri.parse('/test').pathSegments, ['test']);
      expect(PathUri.parse('/test/').pathSegments, ['test']);
    });

    test('path', () {
      expect(PathUri.parse('').path, '');
      expect(PathUri.parse('/').path, '/');
      expect(PathUri.parse('test').path, 'test');
      expect(PathUri.parse('test/').path, 'test/');
      expect(PathUri.parse('/test').path, '/test');
      expect(PathUri.parse('/test/').path, '/test/');
    });

    test('normalization', () {
      expect(PathUri.parse('/test/abc/').path, '/test/abc/');
      expect(PathUri.parse('//test//abc//').path, '/test/abc/');
      expect(PathUri.parse('///test///abc///').path, '/test/abc/');
    });

    test('name', () {
      expect(PathUri.parse('').name, '');
      expect(PathUri.parse('test').name, 'test');
      expect(PathUri.parse('/test/').name, 'test');
      expect(PathUri.parse('abc/test').name, 'test');
      expect(PathUri.parse('/abc/test/').name, 'test');
    });

    test('parent', () {
      expect(PathUri.parse('').parent, null);
      expect(PathUri.parse('/').parent, null);
      expect(PathUri.parse('test').parent, PathUri.parse(''));
      expect(PathUri.parse('test/abc').parent, PathUri.parse('test/'));
      expect(PathUri.parse('test/abc/').parent, PathUri.parse('test/'));
      expect(PathUri.parse('/test/abc').parent, PathUri.parse('/test/'));
      expect(PathUri.parse('/test/abc/').parent, PathUri.parse('/test/'));
    });

    test('join', () {
      expect(PathUri.parse('').join(PathUri.parse('test')), PathUri.parse('test'));
      expect(PathUri.parse('/').join(PathUri.parse('test')), PathUri.parse('/test'));
      expect(() => PathUri.parse('test').join(PathUri.parse('abc')), throwsA(isA<StateError>()));
      expect(PathUri.parse('test/').join(PathUri.parse('abc')), PathUri.parse('test/abc'));
      expect(PathUri.parse('test/').join(PathUri.parse('abc/123')), PathUri.parse('test/abc/123'));
      expect(PathUri.parse('/test/').join(PathUri.parse('abc')), PathUri.parse('/test/abc'));
      expect(PathUri.parse('/test/').join(PathUri.parse('/abc')), PathUri.parse('/test/abc'));
      expect(PathUri.parse('/test/').join(PathUri.parse('/abc/')), PathUri.parse('/test/abc/'));
    });

    test('rename', () {
      expect(PathUri.parse('').rename('test'), PathUri.parse(''));
      expect(PathUri.parse('test').rename('abc'), PathUri.parse('abc'));
      expect(PathUri.parse('test/').rename('abc'), PathUri.parse('abc/'));
      expect(PathUri.parse('test/abc').rename('123'), PathUri.parse('test/123'));
      expect(PathUri.parse('test/abc/').rename('123'), PathUri.parse('test/123/'));
      expect(() => PathUri.parse('test').rename('abc/'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test/').rename('abc/'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test').rename('/abc'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test/').rename('/abc'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test').rename('abc/123'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test/').rename('abc/123'), throwsA(isA<Exception>()));
    });
  });

  group(
    'webdav',
    () {
      late DockerContainer container;
      late TestNextcloudClient client;

      setUp(() async {
        container = await getDockerContainer();
        client = await getTestClient(container);
      });
      tearDown(() => container.destroy());

      test('List directory', () async {
        final responses = (await client.webdav.propfind(
          PathUri.parse('/'),
          prop: WebDavPropWithoutValues.fromBools(
            nchaspreview: true,
            davgetcontenttype: true,
            davgetlastmodified: true,
            ocsize: true,
          ),
        ))
            .responses;
        expect(responses, hasLength(10));
        final props =
            responses.singleWhere((final response) => response.href!.endsWith('/Nextcloud.png')).propstats.first.prop;
        expect(props.nchaspreview, isTrue);
        expect(props.davgetcontenttype, 'image/png');
        expect(webdavDateFormat.parseUtc(props.davgetlastmodified!).isBefore(DateTime.now()), isTrue);
        expect(props.ocsize, 50598);
      });

      test('List directory recursively', () async {
        final responses = (await client.webdav.propfind(
          PathUri.parse('/'),
          depth: WebDavDepth.infinity,
        ))
            .responses;
        expect(responses, hasLength(48));
      });

      test('Get file props', () async {
        final response = (await client.webdav.propfind(
          PathUri.parse('Nextcloud.png'),
          prop: WebDavPropWithoutValues.fromBools(
            davgetlastmodified: true,
            davgetetag: true,
            davgetcontenttype: true,
            davgetcontentlength: true,
            davresourcetype: true,
            ocid: true,
            ocfileid: true,
            ocfavorite: true,
            occommentshref: true,
            occommentscount: true,
            occommentsunread: true,
            ocdownloadurl: true,
            ocownerid: true,
            ocownerdisplayname: true,
            ocsize: true,
            ocpermissions: true,
            ncnote: true,
            ncdatafingerprint: true,
            nchaspreview: true,
            ncmounttype: true,
            ncisencrypted: true,
            ncmetadataetag: true,
            ncuploadtime: true,
            nccreationtime: true,
            ncrichworkspace: true,
            ocssharepermissions: true,
            ocmsharepermissions: true,
          ),
        ))
            .toWebDavFiles()
            .single;

        expect(response.path, PathUri.parse('Nextcloud.png'));
        expect(response.id, isNotEmpty);
        expect(response.fileId, isNotEmpty);
        expect(response.isCollection, isFalse);
        expect(response.mimeType, 'image/png');
        expect(response.etag, isNotEmpty);
        expect(response.size, 50598);
        expect(response.ownerId, 'user1');
        expect(response.ownerDisplay, 'User One');
        expect(response.lastModified!.isBefore(DateTime.now()), isTrue);
        expect(response.isDirectory, isFalse);
        expect(response.uploadedDate, DateTime.utc(1970));
        expect(response.createdDate, DateTime.utc(1970));
        expect(response.favorite, isFalse);
        expect(response.hasPreview, isTrue);
        expect(response.name, 'Nextcloud.png');
        expect(response.isDirectory, isFalse);

        expect(webdavDateFormat.parseUtc(response.props.davgetlastmodified!).isBefore(DateTime.now()), isTrue);
        expect(response.props.davgetetag, isNotEmpty);
        expect(response.props.davgetcontenttype, 'image/png');
        expect(response.props.davgetcontentlength, 50598);
        expect(response.props.davresourcetype!.collection, isNull);
        expect(response.props.ocid, isNotEmpty);
        expect(response.props.ocfileid, isNotEmpty);
        expect(response.props.ocfavorite, 0);
        expect(response.props.occommentshref, isNotEmpty);
        expect(response.props.occommentscount, 0);
        expect(response.props.occommentsunread, 0);
        expect(response.props.ocdownloadurl, isNull);
        expect(response.props.ocownerid, 'user1');
        expect(response.props.ocownerdisplayname, 'User One');
        expect(response.props.ocsize, 50598);
        expect(response.props.ocpermissions, 'RGDNVW');
        expect(response.props.ncnote, isNull);
        expect(response.props.ncdatafingerprint, isNull);
        expect(response.props.nchaspreview, isTrue);
        expect(response.props.ncmounttype, isNull);
        expect(response.props.ncisencrypted, isNull);
        expect(response.props.ncmetadataetag, isNull);
        expect(response.props.ncuploadtime, 0);
        expect(response.props.nccreationtime, 0);
        expect(response.props.ncrichworkspace, isNull);
        expect(response.props.ocssharepermissions, 19);
        expect(json.decode(response.props.ocmsharepermissions!), ['share', 'read', 'write']);
      });

      test('Get directory props', () async {
        final data = utf8.encode('test');
        await client.webdav.mkcol(PathUri.parse('test'));
        await client.webdav.put(data, PathUri.parse('test/test.txt'));

        final response = (await client.webdav.propfind(
          PathUri.parse('test'),
          prop: WebDavPropWithoutValues.fromBools(
            davgetcontenttype: true,
            davgetlastmodified: true,
            davresourcetype: true,
            ocsize: true,
          ),
          depth: WebDavDepth.zero,
        ))
            .toWebDavFiles()
            .single;

        expect(response.path, PathUri.parse('test/'));
        expect(response.isCollection, isTrue);
        expect(response.mimeType, isNull);
        expect(response.size, data.lengthInBytes);
        expectDateInReasonableTimeRange(response.lastModified!, DateTime.now());
        expect(response.name, 'test');
        expect(response.isDirectory, isTrue);

        expect(response.props.davgetcontenttype, isNull);
        expectDateInReasonableTimeRange(webdavDateFormat.parseUtc(response.props.davgetlastmodified!), DateTime.now());
        expect(response.props.davresourcetype!.collection, isNotNull);
        expect(response.props.ocsize, data.lengthInBytes);
      });

      test('Filter files', () async {
        final response = await client.webdav.put(utf8.encode('test'), PathUri.parse('test.txt'));
        final id = response.headers['oc-fileid']!.first;
        await client.webdav.proppatch(
          PathUri.parse('test.txt'),
          set: WebDavProp(
            ocfavorite: 1,
          ),
        );

        final responses = (await client.webdav.report(
          PathUri.parse('/'),
          WebDavOcFilterRules(
            ocfavorite: 1,
          ),
          prop: WebDavPropWithoutValues.fromBools(
            ocid: true,
            ocfavorite: true,
          ),
        ))
            .responses;
        expect(responses, hasLength(1));
        final props =
            responses.singleWhere((final response) => response.href!.endsWith('/test.txt')).propstats.first.prop;
        expect(props.ocid, id);
        expect(props.ocfavorite, 1);
      });

      test('Set properties', () async {
        final lastModifiedDate = DateTime.utc(1972, 3);
        final createdDate = DateTime.utc(1971, 2);
        final uploadTime = DateTime.now();

        await client.webdav.put(
          utf8.encode('test'),
          PathUri.parse('test.txt'),
          lastModified: lastModifiedDate,
          created: createdDate,
        );

        final updated = await client.webdav.proppatch(
          PathUri.parse('test.txt'),
          set: WebDavProp(
            ocfavorite: 1,
          ),
        );
        expect(updated, isTrue);

        final props = (await client.webdav.propfind(
          PathUri.parse('test.txt'),
          prop: WebDavPropWithoutValues.fromBools(
            ocfavorite: true,
            davgetlastmodified: true,
            nccreationtime: true,
            ncuploadtime: true,
          ),
        ))
            .responses
            .single
            .propstats
            .first
            .prop;
        expect(props.ocfavorite, 1);
        expect(webdavDateFormat.parseUtc(props.davgetlastmodified!), lastModifiedDate);
        expect(DateTime.fromMillisecondsSinceEpoch(props.nccreationtime! * 1000).isAtSameMomentAs(createdDate), isTrue);
        expectDateInReasonableTimeRange(DateTime.fromMillisecondsSinceEpoch(props.ncuploadtime! * 1000), uploadTime);
      });

      test('Remove properties', () async {
        await client.webdav.put(utf8.encode('test'), PathUri.parse('test.txt'));

        var updated = await client.webdav.proppatch(
          PathUri.parse('test.txt'),
          set: WebDavProp(
            ocfavorite: 1,
          ),
        );
        expect(updated, isTrue);

        var props = (await client.webdav.propfind(
          PathUri.parse('test.txt'),
          prop: WebDavPropWithoutValues.fromBools(
            ocfavorite: true,
            nccreationtime: true,
            ncuploadtime: true,
          ),
        ))
            .responses
            .single
            .propstats
            .first
            .prop;
        expect(props.ocfavorite, 1);

        updated = await client.webdav.proppatch(
          PathUri.parse('test.txt'),
          remove: WebDavPropWithoutValues.fromBools(
            ocfavorite: true,
          ),
        );
        expect(updated, isFalse);

        props = (await client.webdav.propfind(
          PathUri.parse('test.txt'),
          prop: WebDavPropWithoutValues.fromBools(
            ocfavorite: true,
          ),
        ))
            .responses
            .single
            .propstats
            .first
            .prop;
        expect(props.ocfavorite, 0);
      });

      test('Upload and download file', () async {
        final destinationDir = Directory.systemTemp.createTempSync();
        final destination = File('${destinationDir.path}/test.png');
        final source = File('test/files/test.png');
        final progressValues = <double>[];

        await client.webdav.putFile(
          source,
          source.statSync(),
          PathUri.parse('test.png'),
          onProgress: progressValues.add,
        );
        await client.webdav.getFile(
          PathUri.parse('test.png'),
          destination,
          onProgress: progressValues.add,
        );
        expect(progressValues, containsAll([1.0, 1.0]));
        expect(destination.readAsBytesSync(), source.readAsBytesSync());

        destinationDir.deleteSync(recursive: true);
      });

      group('litmus', () {
        group('basic', () {
          test('options', () async {
            final options = await client.webdav.options();
            expect(options.capabilities, contains('1'));
            expect(options.capabilities, contains('3'));
            // Nextcloud only contains a fake plugin for Class 2 support: https://github.com/nextcloud/server/blob/master/apps/dav/lib/Connector/Sabre/FakeLockerPlugin.php
            // It does not actually support locking and is only there for compatibility reasons.
            expect(options.capabilities, isNot(contains('2')));
          });

          for (final (name, path) in [
            ('put_get', 'res'),
            ('put_get_utf8_segment', 'res-%e2%82%ac'),
          ]) {
            test(name, () async {
              final content = utf8.encode('This is a test file');

              final response = await client.webdav.put(content, PathUri.parse(path));
              expect(response.statusCode, 201);

              final downloadedContent = await client.webdav.get(PathUri.parse(path));
              expect(downloadedContent, equals(content));
            });
          }

          test('put_no_parent', () async {
            expect(
              () => client.webdav.put(Uint8List(0), PathUri.parse('409me/noparent.txt')),
              // https://github.com/nextcloud/server/issues/39625
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
            );
          });

          test('delete', () async {
            await client.webdav.put(Uint8List(0), PathUri.parse('test.txt'));

            final response = await client.webdav.delete(PathUri.parse('test.txt'));
            expect(response.statusCode, 204);
          });

          test('delete_null', () async {
            expect(
              () => client.webdav.delete(PathUri.parse('test.txt')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 404)),
            );
          });

          // delete_fragment: This test is not applicable because the fragment is already removed on the client side

          test('mkcol', () async {
            final response = await client.webdav.mkcol(PathUri.parse('test'));
            expect(response.statusCode, 201);
          });

          test('mkcol_again', () async {
            await client.webdav.mkcol(PathUri.parse('test'));

            expect(
              () => client.webdav.mkcol(PathUri.parse('test')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 405)),
            );
          });

          test('delete_coll', () async {
            var response = await client.webdav.mkcol(PathUri.parse('test'));

            response = await client.webdav.delete(PathUri.parse('test'));
            expect(response.statusCode, 204);
          });

          test('mkcol_no_parent', () async {
            expect(
              () => client.webdav.mkcol(PathUri.parse('409me/noparent')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
            );
          });

          // mkcol_with_body: This test is not applicable because we only write valid request bodies
        });

        group('copymove', () {
          test('copy_simple', () async {
            await client.webdav.mkcol(PathUri.parse('src'));

            final response = await client.webdav.copy(PathUri.parse('src'), PathUri.parse('dst'));
            expect(response.statusCode, 201);
          });

          test('copy_overwrite', () async {
            await client.webdav.mkcol(PathUri.parse('src'));
            await client.webdav.mkcol(PathUri.parse('dst'));

            expect(
              () => client.webdav.copy(PathUri.parse('src'), PathUri.parse('dst')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );

            final response = await client.webdav.copy(PathUri.parse('src'), PathUri.parse('dst'), overwrite: true);
            expect(response.statusCode, 204);
          });

          test('copy_nodestcoll', () async {
            await client.webdav.mkcol(PathUri.parse('src'));

            expect(
              () => client.webdav.copy(PathUri.parse('src'), PathUri.parse('nonesuch/dst')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
            );
          });

          test('copy_coll', () async {
            await client.webdav.mkcol(PathUri.parse('src'));
            await client.webdav.mkcol(PathUri.parse('src/sub'));
            for (var i = 0; i < 10; i++) {
              await client.webdav.put(Uint8List(0), PathUri.parse('src/$i.txt'));
            }
            await client.webdav.copy(PathUri.parse('src'), PathUri.parse('dst1'));
            await client.webdav.copy(PathUri.parse('src'), PathUri.parse('dst2'));

            expect(
              () => client.webdav.copy(PathUri.parse('src'), PathUri.parse('dst1')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );

            var response = await client.webdav.copy(PathUri.parse('src'), PathUri.parse('dst2'), overwrite: true);
            expect(response.statusCode, 204);

            for (var i = 0; i < 10; i++) {
              response = await client.webdav.delete(PathUri.parse('dst1/$i.txt'));
              expect(response.statusCode, 204);
            }

            response = await client.webdav.delete(PathUri.parse('dst1/sub'));
            expect(response.statusCode, 204);

            response = await client.webdav.delete(PathUri.parse('dst2'));
            expect(response.statusCode, 204);
          });

          // copy_shallow: Does not work on litmus, let's wait for https://github.com/nextcloud/server/issues/39627

          test('move', () async {
            await client.webdav.put(Uint8List(0), PathUri.parse('src1.txt'));
            await client.webdav.put(Uint8List(0), PathUri.parse('src2.txt'));
            await client.webdav.mkcol(PathUri.parse('coll'));

            var response = await client.webdav.move(PathUri.parse('src1.txt'), PathUri.parse('dst.txt'));
            expect(response.statusCode, 201);

            expect(
              () => client.webdav.move(PathUri.parse('src2.txt'), PathUri.parse('dst.txt')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );

            response = await client.webdav.move(PathUri.parse('src2.txt'), PathUri.parse('dst.txt'), overwrite: true);
            expect(response.statusCode, 204);
          });

          test('move_coll', () async {
            await client.webdav.mkcol(PathUri.parse('src'));
            await client.webdav.mkcol(PathUri.parse('src/sub'));
            for (var i = 0; i < 10; i++) {
              await client.webdav.put(Uint8List(0), PathUri.parse('src/$i.txt'));
            }
            await client.webdav.put(Uint8List(0), PathUri.parse('noncoll'));
            await client.webdav.copy(PathUri.parse('src'), PathUri.parse('dst2'));
            await client.webdav.move(PathUri.parse('src'), PathUri.parse('dst1'));

            expect(
              () => client.webdav.move(PathUri.parse('dst1'), PathUri.parse('dst2')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );

            await client.webdav.move(PathUri.parse('dst2'), PathUri.parse('dst1'), overwrite: true);
            await client.webdav.copy(PathUri.parse('dst1'), PathUri.parse('dst2'));

            for (var i = 0; i < 10; i++) {
              final response = await client.webdav.delete(PathUri.parse('dst1/$i.txt'));
              expect(response.statusCode, 204);
            }

            final response = await client.webdav.delete(PathUri.parse('dst1/sub'));
            expect(response.statusCode, 204);

            expect(
              () => client.webdav.move(PathUri.parse('dst2'), PathUri.parse('noncoll')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );
          });
        });

        group('largefile', () {
          final largefileSize = pow(10, 9).toInt(); // 1GB

          // large_put: Already covered by large_get

          test('large_get', () async {
            final content = Uint8List.fromList(List.generate(largefileSize, (final i) => i % 256));

            final response = await client.webdav.put(content, PathUri.parse('test.txt'));
            expect(response.statusCode, 201);

            final downloadedContent = await client.webdav.get(PathUri.parse('test.txt'));
            expect(downloadedContent, hasLength(largefileSize));
            expect(downloadedContent, equals(content));
          });
        });

        // props: Most of them are either not applicable or hard/impossible to implement because we don't allow just writing any props
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
