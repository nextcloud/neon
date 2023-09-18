// ignore_for_file: avoid_implementing_value_types

import 'package:mocktail/mocktail.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:test/test.dart';

// ignore: missing_override_of_must_be_overridden
class AppImplementationMock extends Mock implements AppImplementation {}

void main() {
  group('group name', () {
    test('AccountFind', () {
      final app1 = AppImplementationMock();
      final app2 = AppImplementationMock();

      final apps = {
        app1,
        app2,
      };

      when(() => app1.id).thenReturn('app1');
      when(() => app2.id).thenReturn('app2');

      expect(apps.tryFind(null), isNull);
      expect(apps.tryFind('invalidID'), isNull);
      expect(apps.tryFind(app2.id), equals(app2));

      expect(() => apps.find('invalidID'), throwsA(isA<StateError>()));
      expect(apps.find(app2.id), equals(app2));
    });
  });
}
