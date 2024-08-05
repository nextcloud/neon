import 'package:built_collection/built_collection.dart';
import 'package:nextcloud/webdav.dart';
import 'package:nextcloud_test/src/models/models.dart';
// ignore: implementation_imports
import 'package:test_api/src/backend/invoker.dart';
import 'package:universal_io/io.dart';

var _closed = false;
final _fixture = <String>[];

/// Appends some [data] to the current fixture.
void appendFixture(String data) {
  if (!_closed) {
    _fixture.add(data);
  }
}

/// Closes the fixture so no new data can be appended.
void closeFixture() {
  _closed = true;
}

/// Resets all recorded fixtures.
///
/// Needed when network requests are made in the setup part of a test.
void resetFixture() {
  _fixture.clear();
}

/// Validates that the requests match the stored fixtures.
///
/// If there is no stored fixture a new one is created.
void validateFixture(NextcloudTester tester) {
  if (_fixture.isEmpty) {
    return;
  }
  final data = _fixture.join('\n');
  _fixture.clear();

  final groups = <String>[];
  for (final group in Invoker.current!.liveTest.groups) {
    if (group.name.isEmpty) {
      continue;
    }

    groups.add(group.name.replaceFirst('${groups.join(' ')} ', ''));
  }

  if (groups.isNotEmpty && groups[0] == 'server') {
    groups.removeAt(0);
  }

  // Remove the groups that are the preset name and the preset version and the app is kept.
  for (var i = 0; i <= 2; i++) {
    if (groups[i] == '${tester.version.major}.${tester.version.minor}') {
      groups.removeAt(i);
      break;
    }
  }

  final fixturesPath = PathUri(
    isAbsolute: false,
    isDirectory: true,
    pathSegments: BuiltList.from([
      'test',
      'fixtures',
      ...groups.map(_formatName),
    ]),
  );
  final fixturesDir = Directory(fixturesPath.path);
  if (!fixturesDir.existsSync()) {
    fixturesDir.createSync(recursive: true);
  }

  final fixtureName = _formatName(Invoker.current!.liveTest.individualName.toLowerCase());
  final fixtureFile = File(fixturesPath.join(PathUri.parse('$fixtureName.regexp')).path);
  if (fixtureFile.existsSync()) {
    final pattern = fixtureFile.readAsStringSync();
    final hasMatch = RegExp('^$pattern\$').hasMatch(data);
    if (!hasMatch) {
      throw Exception('$data\ndoes not match\n$pattern');
    }
  } else {
    fixtureFile.writeAsStringSync(RegExp.escape(data));
    throw Exception('Missing fixture $fixtureFile');
  }

  _closed = false;
}

String _formatName(String name) => name.toLowerCase().replaceAll(' ', '_');
