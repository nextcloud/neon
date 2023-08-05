@Retry(3)
library webdav_test;

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group('webdav', () {
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
        '/',
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
        '/',
        depth: 'infinity',
      ))
          .responses;
      expect(responses, hasLength(48));
    });

    test('Get file props', () async {
      final response = (await client.webdav.propfind(
        'Nextcloud.png',
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
      final data = Uint8List.fromList(utf8.encode('test'));
      await client.webdav.mkcol('test');
      await client.webdav.put(data, 'test/test.txt');

      final response = (await client.webdav.propfind(
        'test',
        prop: WebDavPropWithoutValues.fromBools(
          davgetcontenttype: true,
          davgetlastmodified: true,
          davresourcetype: true,
          ocsize: true,
        ),
        depth: '0',
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
      final response = await client.webdav.put(Uint8List.fromList(utf8.encode('test')), 'test.txt');
      final id = response.headers['oc-fileid']!.first;
      await client.webdav.proppatch(
        'test.txt',
        set: WebDavProp(
          ocfavorite: 1,
        ),
      );

      final responses = (await client.webdav.report(
        '/',
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
        Uint8List.fromList(utf8.encode('test')),
        'test.txt',
        lastModified: lastModifiedDate,
        created: createdDate,
      );

      final updated = await client.webdav.proppatch(
        'test.txt',
        set: WebDavProp(
          ocfavorite: 1,
        ),
      );
      expect(updated, isTrue);

      final props = (await client.webdav.propfind(
        'test.txt',
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
      await client.webdav.put(Uint8List.fromList(utf8.encode('test')), 'test.txt');

      var updated = await client.webdav.proppatch(
        'test.txt',
        set: WebDavProp(
          ocfavorite: 1,
        ),
      );
      expect(updated, isTrue);

      var props = (await client.webdav.propfind(
        'test.txt',
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
        'test.txt',
        remove: WebDavPropWithoutValues.fromBools(
          ocfavorite: true,
        ),
      );
      expect(updated, isFalse);

      props = (await client.webdav.propfind(
        'test.txt',
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
        'test.png',
        onProgress: progressValues.add,
      );
      await client.webdav.getFile(
        'test.png',
        destination,
        onProgress: progressValues.add,
      );
      expect(progressValues, [100.0, 100.0]);
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
            final content = Uint8List.fromList(utf8.encode('This is a test file'));

            final response = await client.webdav.put(content, path);
            expect(response.statusCode, 201);

            final downloadedContent = await client.webdav.get(path);
            expect(downloadedContent, equals(content));
          });
        }

        test('put_no_parent', () async {
          expect(
            () => client.webdav.put(Uint8List(0), '409me/noparent.txt'),
            // https://github.com/nextcloud/server/issues/39625
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
          );
        });

        test('delete', () async {
          await client.webdav.put(Uint8List(0), 'test.txt');

          final response = await client.webdav.delete('test.txt');
          expect(response.statusCode, 204);
        });

        test('delete_null', () async {
          expect(
            () => client.webdav.delete('test.txt'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 404)),
          );
        });

        // delete_fragment: This test is not applicable because the fragment is already removed on the client side

        test('mkcol', () async {
          final response = await client.webdav.mkcol('test');
          expect(response.statusCode, 201);
        });

        test('mkcol_again', () async {
          await client.webdav.mkcol('test');

          expect(
            () => client.webdav.mkcol('test'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 405)),
          );
        });

        test('delete_coll', () async {
          var response = await client.webdav.mkcol('test');

          response = await client.webdav.delete('test');
          expect(response.statusCode, 204);
        });

        test('mkcol_no_parent', () async {
          expect(
            () => client.webdav.mkcol('409me/noparent'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
          );
        });

        // mkcol_with_body: This test is not applicable because we only write valid request bodies
      });

      group('copymove', () {
        test('copy_simple', () async {
          await client.webdav.mkcol('src');

          final response = await client.webdav.copy('src', 'dst');
          expect(response.statusCode, 201);
        });

        test('copy_overwrite', () async {
          await client.webdav.mkcol('src');
          await client.webdav.mkcol('dst');

          expect(
            () => client.webdav.copy('src', 'dst'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
          );

          final response = await client.webdav.copy('src', 'dst', overwrite: true);
          expect(response.statusCode, 204);
        });

        test('copy_nodestcoll', () async {
          await client.webdav.mkcol('src');

          expect(
            () => client.webdav.copy('src', 'nonesuch/dst'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 409)),
          );
        });

        test('copy_coll', () async {
          await client.webdav.mkcol('src');
          await client.webdav.mkcol('src/sub');
          for (var i = 0; i < 10; i++) {
            await client.webdav.put(Uint8List(0), 'src/$i.txt');
          }
          await client.webdav.copy('src', 'dst1');
          await client.webdav.copy('src', 'dst2');

          expect(
            () => client.webdav.copy('src', 'dst1'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
          );

          var response = await client.webdav.copy('src', 'dst2', overwrite: true);
          expect(response.statusCode, 204);

          for (var i = 0; i < 10; i++) {
            response = await client.webdav.delete('dst1/$i.txt');
            expect(response.statusCode, 204);
          }

          response = await client.webdav.delete('dst1/sub');
          expect(response.statusCode, 204);

          response = await client.webdav.delete('dst2');
          expect(response.statusCode, 204);
        });

        // copy_shallow: Does not work on litmus, let's wait for https://github.com/nextcloud/server/issues/39627

        test('move', () async {
          await client.webdav.put(Uint8List(0), 'src1.txt');
          await client.webdav.put(Uint8List(0), 'src2.txt');
          await client.webdav.mkcol('coll');

          var response = await client.webdav.move('src1.txt', 'dst.txt');
          expect(response.statusCode, 201);

          expect(
            () => client.webdav.move('src2.txt', 'dst.txt'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
          );

          response = await client.webdav.move('src2.txt', 'dst.txt', overwrite: true);
          expect(response.statusCode, 204);
        });

        test('move_coll', () async {
          await client.webdav.mkcol('src');
          await client.webdav.mkcol('src/sub');
          for (var i = 0; i < 10; i++) {
            await client.webdav.put(Uint8List(0), 'src/$i.txt');
          }
          await client.webdav.put(Uint8List(0), 'noncoll');
          await client.webdav.copy('src', 'dst2');
          await client.webdav.move('src', 'dst1');

          expect(
            () => client.webdav.move('dst1', 'dst2'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
          );

          await client.webdav.move('dst2', 'dst1', overwrite: true);
          await client.webdav.copy('dst1', 'dst2');

          for (var i = 0; i < 10; i++) {
            final response = await client.webdav.delete('dst1/$i.txt');
            expect(response.statusCode, 204);
          }

          final response = await client.webdav.delete('dst1/sub');
          expect(response.statusCode, 204);

          expect(
            () => client.webdav.move('dst2', 'noncoll'),
            throwsA(predicate<DynamiteApiException>((final e) => e.statusCode == 412)),
          );
        });
      });

      group('largefile', () {
        final largefileSize = pow(10, 9).toInt(); // 1GB

        // large_put: Already covered by large_get

        test('large_get', () async {
          final response = await client.webdav.put(Uint8List(largefileSize), 'test.txt');
          expect(response.statusCode, 201);

          final downloadedContent = await client.webdav.get('test.txt');
          expect(downloadedContent, hasLength(largefileSize));
        });
      });

      // props: Most of them are either not applicable or hard/impossible to implement because we don't allow just writing any props
    });
  });
}
