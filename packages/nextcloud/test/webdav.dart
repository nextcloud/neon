import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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
      expect(responses, hasLength(9));
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
      expect(responses, hasLength(37));
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
      expect(responses, hasLength(11));
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
      final props = (await client.webdav.ls(
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
          .responses
          .single
          .propstats
          .first
          .prop;
      expect(webdavDateFormat.parseUtc(props.davgetlastmodified!).isBefore(DateTime.now()), isTrue);
      expect(props.davgetetag, isNotEmpty);
      expect(props.davgetcontenttype, 'image/png');
      expect(props.davgetcontentlength, 50598);
      expect(props.davresourcetype!.collection, isNull);
      expect(props.ocid, isNotEmpty);
      expect(props.ocfileid, isNotEmpty);
      expect(props.ocfavorite, 0);
      expect(props.occommentshref, isNotEmpty);
      expect(props.occommentscount, 0);
      expect(props.occommentsunread, 0);
      expect(props.ocdownloadurl, isNull);
      expect(props.ocownerid, 'user1');
      expect(props.ocownerdisplayname, 'User One');
      expect(props.ocsize, 50598);
      expect(props.ocpermissions, 'RGDNVW');
      expect(props.ncnote, isNull);
      expect(props.ncdatafingerprint, isNull);
      expect(props.nchaspreview, isTrue);
      expect(props.ncmounttype, isNull);
      expect(props.ncisencrypted, isNull);
      expect(props.ncmetadataetag, isNull);
      expect(props.ncuploadtime, 0);
      expect(props.nccreationtime, 0);
      expect(props.ncrichworkspace, isNull);
      expect(props.ocssharepermissions, 19);
      expect(json.decode(props.ocmsharepermissions!), ['share', 'read', 'write']);
    });

    test('Get directory props', () async {
      final data = Uint8List.fromList(utf8.encode('test'));
      await client.webdav.mkdir('test');
      await client.webdav.upload(data, 'test/test.txt');

      final props = (await client.webdav.ls(
        'test',
        prop: WebDavPropfindProp.fromBools(
          davgetcontenttype: true,
          davgetlastmodified: true,
          davresourcetype: true,
          ocsize: true,
        ),
        depth: '0',
      ))
          .responses
          .single
          .propstats
          .first
          .prop;
      expect(props.davgetcontenttype, isNull);
      expectDateInReasonableTimeRange(webdavDateFormat.parseUtc(props.davgetlastmodified!), DateTime.now());
      expect(props.davresourcetype!.collection, isNotNull);
      expect(props.ocsize, data.lengthInBytes);
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
