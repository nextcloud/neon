import 'package:built_collection/built_collection.dart';
import 'package:crypton/crypton.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/storage.dart';
import 'package:notifications_push_repository/notifications_push_repository.dart';
import 'package:notifications_push_repository/src/models/models.dart';

class _SingleValueStoreMock extends Mock implements SingleValueStore {}

class _PersistenceMock extends Mock implements Persistence {}

void main() {
  late SingleValueStore devicePrivateKeyPersistence;
  late Persistence pushSubscriptionsPersistence;
  late NotificationsPushStorage storage;

  setUp(() {
    devicePrivateKeyPersistence = _SingleValueStoreMock();
    pushSubscriptionsPersistence = _PersistenceMock();

    storage = NotificationsPushStorage(
      devicePrivateKeyPersistence: devicePrivateKeyPersistence,
      pushSubscriptionsPersistence: pushSubscriptionsPersistence,
    );
  });

  group('NotificationsPushStorage', () {
    group('Device private key', () {
      const privateKeyPEM = '''
-----BEGIN RSA PRIVATE KEY-----
MDsCAQAwDQYJKoZIhvcNAQEBBQAEJzAlAgEAAgMBchMCAwEAAQICFgECAgHBAgIA0wICAQECAgCtAgIBCg==
-----END RSA PRIVATE KEY-----''';
      final privateKey = RSAPrivateKey.fromPEM(privateKeyPEM);

      test('readDevicePrivateKey', () {
        when(() => devicePrivateKeyPersistence.getString()).thenReturn(privateKeyPEM);

        expect(storage.readDevicePrivateKey()!.toPEM(), privateKeyPEM);
        verify(() => devicePrivateKeyPersistence.getString()).called(1);
      });

      test('saveDevicePrivateKey', () async {
        when(() => devicePrivateKeyPersistence.setString(any())).thenAnswer((_) async => true);

        await storage.saveDevicePrivateKey(privateKey);
        verify(() => devicePrivateKeyPersistence.setString(privateKeyPEM)).called(1);
      });
    });

    group('Push subscriptions', () {
      final subscriptionsMap = BuiltMap<String, PushSubscription>({
        'a': PushSubscription(
          (b) => b
            ..endpoint = 'endpoint1'
            ..pushDevice.update(
              (b) => b
                ..publicKey = 'publicKey1'
                ..deviceIdentifier = 'deviceIdentifier1'
                ..signature = 'signature1',
            ),
        ),
        'b': PushSubscription(
          (b) => b
            ..endpoint = 'endpoint2'
            ..pushDevice.update(
              (b) => b
                ..publicKey = 'publicKey2'
                ..deviceIdentifier = 'deviceIdentifier2'
                ..signature = 'signature2',
            ),
        ),
      });
      final serializedSubscriptions = BuiltMap<String, String>({
        'a':
            '{"endpoint":"endpoint1","pushDevice":{"publicKey":"publicKey1","deviceIdentifier":"deviceIdentifier1","signature":"signature1"}}',
        'b':
            '{"endpoint":"endpoint2","pushDevice":{"publicKey":"publicKey2","deviceIdentifier":"deviceIdentifier2","signature":"signature2"}}',
      });

      test('readSubscriptions', () async {
        when(() => pushSubscriptionsPersistence.keys()).thenReturn(['a', 'b']);
        when(() => pushSubscriptionsPersistence.getValue(any())).thenAnswer((invocation) {
          final key = invocation.positionalArguments.single as String;
          return serializedSubscriptions[key];
        });

        final subscriptions = await storage.readSubscriptions();
        expect(subscriptions, equals(subscriptionsMap));

        verify(() => pushSubscriptionsPersistence.keys()).called(1);
        verify(() => pushSubscriptionsPersistence.getValue('a')).called(1);
        verify(() => pushSubscriptionsPersistence.getValue('b')).called(1);
        verifyNever(() => pushSubscriptionsPersistence.getValue(any()));
      });

      test('updateSubscription', () async {
        when(() => pushSubscriptionsPersistence.setValue(any(), any())).thenReturn(true);
        when(() => pushSubscriptionsPersistence.remove(any())).thenReturn(true);

        await storage.updateSubscription('a', subscriptionsMap['a']!);
        verify(() => pushSubscriptionsPersistence.setValue('a', serializedSubscriptions['a']!)).called(1);
        verifyNever(() => pushSubscriptionsPersistence.setValue(any(), any()));
        verifyNever(() => pushSubscriptionsPersistence.remove(any()));

        await storage.updateSubscription('b', subscriptionsMap['b']!);
        verify(() => pushSubscriptionsPersistence.setValue('b', serializedSubscriptions['b']!)).called(1);
        verifyNever(() => pushSubscriptionsPersistence.setValue(any(), any()));
        verifyNever(() => pushSubscriptionsPersistence.remove(any()));

        await storage.updateSubscription('c', PushSubscription());
        verify(() => pushSubscriptionsPersistence.remove('c')).called(1);
        verifyNever(() => pushSubscriptionsPersistence.remove(any()));
        verifyNever(() => pushSubscriptionsPersistence.setValue(any(), any()));
      });
    });
  });
}
