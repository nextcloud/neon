import 'package:mocktail/mocktail.dart';
import 'package:neon/src/models/client_implementation.dart';
import 'package:test/test.dart';

// ignore: missing_override_of_must_be_overridden, avoid_implementing_value_types
class ClientImplementationMock extends Mock implements ClientImplementation {}

void main() {
  group('group name', () {
    test('AccountFind', () {
      final client1 = ClientImplementationMock();
      final client2 = ClientImplementationMock();

      final apps = {
        client1,
        client2,
      };

      when(() => client1.id).thenReturn('app1');
      when(() => client2.id).thenReturn('app2');

      expect(apps.tryFind(null), isNull);
      expect(apps.tryFind('invalidID'), isNull);
      expect(apps.tryFind(client2.id), equals(client2));

      expect(() => apps.find('invalidID'), throwsA(isA<StateError>()));
      expect(apps.find(client2.id), equals(client2));
    });
  });
}
