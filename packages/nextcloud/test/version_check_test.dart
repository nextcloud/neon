import 'package:built_collection/built_collection.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';
import 'package:version/version.dart';

void main() {
  group('Version check', () {
    test('Equality check', () {
      final check1 = VersionCheck(
        versions: BuiltList([Version(1, 0, 0)]),
        minimumVersion: Version(1, 0, 0),
        isSupportedOverride: false,
      );

      final check2 = VersionCheck(
        versions: BuiltList([Version(1, 0, 0)]),
        minimumVersion: Version(1, 0, 0),
        isSupportedOverride: false,
      );

      expect(check1, check2);
    });

    test('Null versions', () {
      final check = VersionCheck(
        versions: null,
        // Invalid constraints to avoid accidental validation
        minimumVersion: Version(2, 0, 0),
      );
      expect(check.isSupported, isTrue);
    });

    test('Empty versions', () {
      final check = VersionCheck(
        versions: BuiltList(),
        // Invalid constraints to avoid accidental validation
        minimumVersion: Version(2, 0, 0),
      );
      expect(check.isSupported, isTrue);
    });

    test('Multiple versions', () {
      final check = VersionCheck(
        versions: BuiltList([
          Version(0, 9, 9),
          Version(1, 5, 0),
          Version(2, 0, 0),
        ]),
        minimumVersion: Version(1, 0, 0),
      );
      expect(check.isSupported, isTrue);
    });
  });
}
