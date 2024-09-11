import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

const _fixtureBasePath = [
  'test',
  'fixtures',
];

/// Loads the fixture with [fixtureID] and returns its content.
///
/// If there is no stored fixture a new one is created.
@internal
String? loadFixture(String fixtureID) {
  final path = p.joinAll([
    ..._fixtureBasePath,
    ...p.posix.split(fixtureID),
  ]);

  final fixtureFile = File(path);
  if (fixtureFile.existsSync()) {
    return fixtureFile.readAsStringSync();
  } else {
    fixtureFile.createSync(recursive: true);
    return null;
  }
}
