import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

Future main() async {
  await run(await getDockerImage());
}

Future run(final DockerImage image) async {
  group('webdav', () {
    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(container);
    });
    tearDown(() => container.destroy());

    test('Fail without username', () async {
      client = await getTestClient(
        container,
        username: null,
      );
      expect(() => client.webdav, throwsException);
    });

    test('Get status', () async {
      final status = await client.webdav.status();
      expect(status.capabilities, containsAll(['1', '3', 'access-control']));
      expect(status.searchCapabilities, hasLength(0));
    });

    test('List directory', () async {
      final responses = (await client.webdav.ls(
        '/',
        prop: WebDavPropfindProp.fromBools(
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
      final responses = (await client.webdav.ls(
        '/',
        depth: 'infinity',
      ))
          .responses;
      expect(responses, hasLength(48));
    });

    test('Create directory', () async {
      final response = await client.webdav.mkdir('test');
      expect(response.statusCode, equals(201));
    });

    test('Create directory recursively', () async {
      final response = await client.webdav.mkdirs('test/bla');
      expect(response!.statusCode, equals(201));

      final responses = (await client.webdav.ls('/test')).responses;
      expect(responses, hasLength(2));
      expect(responses[1].href, endsWith('/test/bla/'));
    });

    test('Upload files', () async {
      final pngBytes = File('test/files/test.png').readAsBytesSync();
      final txtBytes = File('test/files/test.txt').readAsBytesSync();

      var response = await client.webdav.upload(pngBytes, 'test.png');
      expect(response.statusCode, equals(201));

      response = await client.webdav.upload(txtBytes, 'test.txt');
      expect(response.statusCode, equals(201));

      final responses = (await client.webdav.ls(
        '/',
        prop: WebDavPropfindProp.fromBools(
          ocsize: true,
        ),
      ))
          .responses;
      expect(responses, hasLength(12));
      expect(
        responses.singleWhere((final response) => response.href!.endsWith('/test.png')).propstats.first.prop.ocsize,
        pngBytes.lengthInBytes,
      );
      expect(
        responses.singleWhere((final response) => response.href!.endsWith('/test.txt')).propstats.first.prop.ocsize,
        txtBytes.lengthInBytes,
      );
    });

    test('Upload file', () async {
      final lastModified = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch ~/ 1000 * 1000);
      final created = lastModified.subtract(const Duration(hours: 1));
      final txtBytes = File('test/files/test.txt').readAsBytesSync();

      final response = await client.webdav.upload(
        txtBytes,
        'test.txt',
        lastModified: lastModified,
        created: created,
      );
      expect(response.statusCode, equals(201));

      final props = (await client.webdav.ls(
        '/',
        prop: WebDavPropfindProp.fromBools(
          davgetlastmodified: true,
          nccreationtime: true,
        ),
      ))
          .responses
          .singleWhere((final response) => response.href!.endsWith('/test.txt'))
          .propstats
          .first
          .prop;
      expect(
        webdavDateFormat.parseUtc(props.davgetlastmodified!).millisecondsSinceEpoch,
        lastModified.millisecondsSinceEpoch,
      );
      expect(
        DateTime.fromMillisecondsSinceEpoch(props.nccreationtime! * 1000).millisecondsSinceEpoch,
        created.millisecondsSinceEpoch,
      );
    });

    test('Download file', () async {
      final response = await client.webdav.download('Nextcloud.png');
      expect(sha1.convert(response).toString(), '5ab8040bc0e9a3c47f45abd8a6d44f6e381ba6ed');
    });

    test('Delete file', () async {
      final response = await client.webdav.delete('Nextcloud.png');
      expect(response.statusCode, 204);
      final responses = (await client.webdav.ls('/')).responses;
      expect(responses.where((final response) => response.href!.endsWith('/Nextcloud.png')), hasLength(0));
    });

    test('Copy file', () async {
      final response = await client.webdav.copy(
        'Nextcloud.png',
        'test.png',
      );
      expect(response.statusCode, 201);
      final responses = (await client.webdav.ls('/')).responses;
      expect(responses.where((final response) => response.href!.endsWith('/Nextcloud.png')), hasLength(1));
      expect(responses.where((final response) => response.href!.endsWith('/test.png')), hasLength(1));
    });

    test('Copy file (overwrite fail)', () async {
      await client.webdav.upload(Uint8List.fromList(utf8.encode('1')), '1.txt');
      await client.webdav.upload(Uint8List.fromList(utf8.encode('2')), '2.txt');

      expect(
        () => client.webdav.copy('1.txt', '2.txt'),
        throwsA(predicate((final e) => (e! as NextcloudApiException).statusCode == 412)),
      );
    });

    test('Copy file (overwrite success)', () async {
      await client.webdav.upload(Uint8List.fromList(utf8.encode('1')), '1.txt');
      await client.webdav.upload(Uint8List.fromList(utf8.encode('2')), '2.txt');

      final response = await client.webdav.copy(
        '1.txt',
        '2.txt',
        overwrite: true,
      );
      expect(response.statusCode, 204);
    });

    test('Move file', () async {
      final response = await client.webdav.move(
        'Nextcloud.png',
        'test.png',
      );
      expect(response.statusCode, 201);
      final responses = (await client.webdav.ls('/')).responses;
      expect(responses.where((final response) => response.href!.endsWith('/Nextcloud.png')), hasLength(0));
      expect(responses.where((final response) => response.href!.endsWith('/test.png')), hasLength(1));
    });

    test('Move file (overwrite fail)', () async {
      await client.webdav.upload(Uint8List.fromList(utf8.encode('1')), '1.txt');
      await client.webdav.upload(Uint8List.fromList(utf8.encode('2')), '2.txt');

      expect(
        () => client.webdav.move('1.txt', '2.txt'),
        throwsA(predicate((final e) => (e! as NextcloudApiException).statusCode == 412)),
      );
    });

    test('Move file (overwrite success)', () async {
      await client.webdav.upload(Uint8List.fromList(utf8.encode('1')), '1.txt');
      await client.webdav.upload(Uint8List.fromList(utf8.encode('2')), '2.txt');

      final response = await client.webdav.move(
        '1.txt',
        '2.txt',
        overwrite: true,
      );
      expect(response.statusCode, 204);
    });

    test('Get file props', () async {
      final response = (await client.webdav.ls(
        'Nextcloud.png',
        prop: WebDavPropfindProp.fromBools(
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
          .toWebDavFiles(client.webdav)
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
      await client.webdav.mkdir('test');
      await client.webdav.upload(data, 'test/test.txt');

      final response = (await client.webdav.ls(
        'test',
        prop: WebDavPropfindProp.fromBools(
          davgetcontenttype: true,
          davgetlastmodified: true,
          davresourcetype: true,
          ocsize: true,
        ),
        depth: '0',
      ))
          .toWebDavFiles(client.webdav)
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
      final response = await client.webdav.upload(Uint8List.fromList(utf8.encode('test')), 'test.txt');
      final id = response.headers['oc-fileid']!.first;
      await client.webdav.updateProps(
        'test.txt',
        WebDavProp(
          ocfavorite: 1,
        ),
      );

      final responses = (await client.webdav.filter(
        '/',
        WebDavOcFilterRules(
          ocfavorite: 1,
        ),
        prop: WebDavPropfindProp.fromBools(
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
      final createdDate = DateTime.utc(1971, 2);
      final createdEpoch = createdDate.millisecondsSinceEpoch ~/ 1000;
      final uploadTime = DateTime.now();

      await client.webdav.upload(Uint8List.fromList(utf8.encode('test')), 'test.txt');

      final updated = await client.webdav.updateProps(
        'test.txt',
        WebDavProp(
          ocfavorite: 1,
          nccreationtime: createdEpoch,
        ),
      );
      expect(updated, isTrue);

      final props = (await client.webdav.ls(
        'test.txt',
        prop: WebDavPropfindProp.fromBools(
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
      expect(DateTime.fromMillisecondsSinceEpoch(props.nccreationtime! * 1000).isAtSameMomentAs(createdDate), isTrue);
      expectDateInReasonableTimeRange(DateTime.fromMillisecondsSinceEpoch(props.ncuploadtime! * 1000), uploadTime);
    });
  });
}
