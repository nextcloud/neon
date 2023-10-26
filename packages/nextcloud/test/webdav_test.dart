import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

import 'helper.dart';

void main() {
  test('constructUri', () {
    var baseURL = Uri.parse('http://cloud.example.com');
    expect(WebDavClient.constructUri(baseURL).toString(), '$baseURL$webdavBasePath');
    expect(WebDavClient.constructUri(baseURL, Uri(path: '/')).toString(), '$baseURL$webdavBasePath');
    expect(WebDavClient.constructUri(baseURL, Uri(path: 'test')).toString(), '$baseURL$webdavBasePath/test');

    baseURL = Uri.parse('http://cloud.example.com/subdir');
    expect(WebDavClient.constructUri(baseURL, Uri(path: 'test')).toString(), '$baseURL$webdavBasePath/test');

    expect(() => WebDavClient.constructUri(baseURL, Uri(path: '/test')), throwsA(isA<AssertionError>()));
    baseURL = Uri.parse('http://cloud.example.com/');
    expect(() => WebDavClient.constructUri(baseURL), throwsA(isA<AssertionError>()));
  });

  group(
    'webdav',
    () {
      late DockerImage image;
      setUpAll(() async => image = await getDockerImage());

      late DockerContainer container;
      late TestNextcloudClient client;

      setUp(() async {
        container = await getDockerContainer(image);
        client = await getTestClient(container);
      });
      tearDown(() => container.destroy());

      test('List directory', () async {
        final responses = (await client.webdav.propfind(
          Uri(path: '/'),
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
          Uri(path: '/'),
          depth: WebDavDepth.infinity,
        ))
            .responses;
        expect(responses, hasLength(48));
      });

      test('Get file props', () async {
        final response = (await client.webdav.propfind(
          Uri(path: 'Nextcloud.png'),
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

        expect(response.path, '/Nextcloud.png');
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
        final data = utf8.encode('test') as Uint8List;
        await client.webdav.mkcol(Uri(path: 'test'));
        await client.webdav.put(data, Uri(path: 'test/test.txt'));

        final response = (await client.webdav.propfind(
          Uri(path: 'test'),
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

        expect(response.path, '/test/');
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
        final response = await client.webdav.put(utf8.encode('test') as Uint8List, Uri(path: 'test.txt'));
        final id = response.headers['oc-fileid']!.first;
        await client.webdav.proppatch(
          Uri(path: 'test.txt'),
          set: WebDavProp(
            ocfavorite: 1,
          ),
        );

        final responses = (await client.webdav.report(
          Uri(path: '/'),
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
          utf8.encode('test') as Uint8List,
          Uri(path: 'test.txt'),
          lastModified: lastModifiedDate,
          created: createdDate,
        );

        final updated = await client.webdav.proppatch(
          Uri(path: 'test.txt'),
          set: WebDavProp(
            ocfavorite: 1,
          ),
        );
        expect(updated, isTrue);

        final props = (await client.webdav.propfind(
          Uri(path: 'test.txt'),
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
        await client.webdav.put(utf8.encode('test') as Uint8List, Uri(path: 'test.txt'));

        var updated = await client.webdav.proppatch(
          Uri(path: 'test.txt'),
          set: WebDavProp(
            ocfavorite: 1,
          ),
        );
        expect(updated, isTrue);

        var props = (await client.webdav.propfind(
          Uri(path: 'test.txt'),
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
          Uri(path: 'test.txt'),
          remove: WebDavPropWithoutValues.fromBools(
            ocfavorite: true,
          ),
        );
        expect(updated, isFalse);

        props = (await client.webdav.propfind(
          Uri(path: 'test.txt'),
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
          Uri(path: 'test.png'),
          onProgress: progressValues.add,
        );
        await client.webdav.getFile(
          Uri(path: 'test.png'),
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
              final content = utf8.encode('This is a test file') as Uint8List;

              final response = await client.webdav.put(content, Uri(path: path));
              expect(response.statusCode, 201);

              final downloadedContent = await client.webdav.get(Uri(path: path));
              expect(downloadedContent, equals(content));
            });
          }

          test('put_no_parent', () async {
            expect(
              () => client.webdav.put(Uint8List(0), Uri(path: '409me/noparent.txt')),
              // https://github.com/nextcloud/server/issues/39625
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
            );
          });

          test('delete', () async {
            await client.webdav.put(Uint8List(0), Uri(path: 'test.txt'));

            final response = await client.webdav.delete(Uri(path: 'test.txt'));
            expect(response.statusCode, 204);
          });

          test('delete_null', () async {
            expect(
              () => client.webdav.delete(Uri(path: 'test.txt')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 404)),
            );
          });

          // delete_fragment: This test is not applicable because the fragment is already removed on the client side

          test('mkcol', () async {
            final response = await client.webdav.mkcol(Uri(path: 'test'));
            expect(response.statusCode, 201);
          });

          test('mkcol_again', () async {
            await client.webdav.mkcol(Uri(path: 'test'));

            expect(
              () => client.webdav.mkcol(Uri(path: 'test')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 405)),
            );
          });

          test('delete_coll', () async {
            var response = await client.webdav.mkcol(Uri(path: 'test'));

            response = await client.webdav.delete(Uri(path: 'test'));
            expect(response.statusCode, 204);
          });

          test('mkcol_no_parent', () async {
            expect(
              () => client.webdav.mkcol(Uri(path: '409me/noparent')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
            );
          });

          // mkcol_with_body: This test is not applicable because we only write valid request bodies
        });

        group('copymove', () {
          test('copy_simple', () async {
            await client.webdav.mkcol(Uri(path: 'src'));

            final response = await client.webdav.copy(Uri(path: 'src'), Uri(path: 'dst'));
            expect(response.statusCode, 201);
          });

          test('copy_overwrite', () async {
            await client.webdav.mkcol(Uri(path: 'src'));
            await client.webdav.mkcol(Uri(path: 'dst'));

            expect(
              () => client.webdav.copy(Uri(path: 'src'), Uri(path: 'dst')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );

            final response = await client.webdav.copy(Uri(path: 'src'), Uri(path: 'dst'), overwrite: true);
            expect(response.statusCode, 204);
          });

          test('copy_nodestcoll', () async {
            await client.webdav.mkcol(Uri(path: 'src'));

            expect(
              () => client.webdav.copy(Uri(path: 'src'), Uri(path: 'nonesuch/dst')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
            );
          });

          test('copy_coll', () async {
            await client.webdav.mkcol(Uri(path: 'src'));
            await client.webdav.mkcol(Uri(path: 'src/sub'));
            for (var i = 0; i < 10; i++) {
              await client.webdav.put(Uint8List(0), Uri(path: 'src/$i.txt'));
            }
            await client.webdav.copy(Uri(path: 'src'), Uri(path: 'dst1'));
            await client.webdav.copy(Uri(path: 'src'), Uri(path: 'dst2'));

            expect(
              () => client.webdav.copy(Uri(path: 'src'), Uri(path: 'dst1')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );

            var response = await client.webdav.copy(Uri(path: 'src'), Uri(path: 'dst2'), overwrite: true);
            expect(response.statusCode, 204);

            for (var i = 0; i < 10; i++) {
              response = await client.webdav.delete(Uri(path: 'dst1/$i.txt'));
              expect(response.statusCode, 204);
            }

            response = await client.webdav.delete(Uri(path: 'dst1/sub'));
            expect(response.statusCode, 204);

            response = await client.webdav.delete(Uri(path: 'dst2'));
            expect(response.statusCode, 204);
          });

          // copy_shallow: Does not work on litmus, let's wait for https://github.com/nextcloud/server/issues/39627

          test('move', () async {
            await client.webdav.put(Uint8List(0), Uri(path: 'src1.txt'));
            await client.webdav.put(Uint8List(0), Uri(path: 'src2.txt'));
            await client.webdav.mkcol(Uri(path: 'coll'));

            var response = await client.webdav.move(Uri(path: 'src1.txt'), Uri(path: 'dst.txt'));
            expect(response.statusCode, 201);

            expect(
              () => client.webdav.move(Uri(path: 'src2.txt'), Uri(path: 'dst.txt')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );

            response = await client.webdav.move(Uri(path: 'src2.txt'), Uri(path: 'dst.txt'), overwrite: true);
            expect(response.statusCode, 204);
          });

          test('move_coll', () async {
            await client.webdav.mkcol(Uri(path: 'src'));
            await client.webdav.mkcol(Uri(path: 'src/sub'));
            for (var i = 0; i < 10; i++) {
              await client.webdav.put(Uint8List(0), Uri(path: 'src/$i.txt'));
            }
            await client.webdav.put(Uint8List(0), Uri(path: 'noncoll'));
            await client.webdav.copy(Uri(path: 'src'), Uri(path: 'dst2'));
            await client.webdav.move(Uri(path: 'src'), Uri(path: 'dst1'));

            expect(
              () => client.webdav.move(Uri(path: 'dst1'), Uri(path: 'dst2')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );

            await client.webdav.move(Uri(path: 'dst2'), Uri(path: 'dst1'), overwrite: true);
            await client.webdav.copy(Uri(path: 'dst1'), Uri(path: 'dst2'));

            for (var i = 0; i < 10; i++) {
              final response = await client.webdav.delete(Uri(path: 'dst1/$i.txt'));
              expect(response.statusCode, 204);
            }

            final response = await client.webdav.delete(Uri(path: 'dst1/sub'));
            expect(response.statusCode, 204);

            expect(
              () => client.webdav.move(Uri(path: 'dst2'), Uri(path: 'noncoll')),
              throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
            );
          });
        });

        group('largefile', () {
          final largefileSize = pow(10, 9).toInt(); // 1GB

          // large_put: Already covered by large_get

          test('large_get', () async {
            final response = await client.webdav.put(Uint8List(largefileSize), Uri(path: 'test.txt'));
            expect(response.statusCode, 201);

            final downloadedContent = await client.webdav.get(Uri(path: 'test.txt'));
            expect(downloadedContent, hasLength(largefileSize));
          });
        });

        // props: Most of them are either not applicable or hard/impossible to implement because we don't allow just writing any props
      });
    },
    tags: 'integration',
  );
}
