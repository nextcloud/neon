import 'package:meta/meta.dart';
import 'package:nextcloud_test_api/client.dart';
import 'package:test/expect.dart';
// ignore: implementation_imports
import 'package:test_api/src/backend/invoker.dart';

var _closed = false;
final _fixture = <String>[];

/// Appends some [data] to the current fixture.
@internal
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
/// If there is no stored fixture an empty one is created.
@internal
Future<void> validateFixture(NextcloudTestApiClient client, Preset preset) async {
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
    if (groups[i] == '${preset.version.major}.${preset.version.minor}') {
      groups.removeAt(i);
      break;
    }
  }

  final fixtureName = _formatName(Invoker.current!.liveTest.individualName);

  final fixturePath = [
    ...groups.map(_formatName),
    '$fixtureName.regexp',
  ];

  final response = await client.validateFixture(
    fixturePath: fixturePath,
  );
  final pattern = response.fixture;

  if (pattern == null) {
    fail(
      'Missing fixture: '
      '$data',
    );
  } else if (!RegExp('^$pattern\$').hasMatch(data)) {
    fail('$data\ndoes not match\n$pattern');
  }

  _closed = false;
}

String _formatName(String name) => name.toLowerCase().replaceAll(' ', '_');
