import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/testing/mocks.dart';
import 'package:neon_framework/src/utils/findable.dart';

void main() {
  group('group name', () {
    test('AccountFind', () {
      final app1 = MockAppImplementation();
      final app2 = MockAppImplementation();

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
