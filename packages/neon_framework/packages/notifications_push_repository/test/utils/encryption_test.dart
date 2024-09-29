import 'dart:convert';

import 'package:built_value_test/matcher.dart';
import 'package:crypton/crypton.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notifications_push_repository/notifications_push_repository.dart';
import 'package:notifications_push_repository/src/utils/encryption.dart';
import 'package:notifications_push_repository/testing.dart';

class _StorageMock extends Mock implements NotificationsPushStorage {}

void main() {
  const privateKeyPEM = '''
-----BEGIN RSA PRIVATE KEY-----
MIICHwIBADANBgkqhkiG9w0BAQEFAASCAgkwggIFAgEAAm4BELTz808T8iAkvBkg
tnWs4a1aNcCFAAX54ePLK40YAL/tQjUGoIe0+zO7yzMT0bydk6BFOdyrIP2iwALN
eOLwDvSi7bfpMZ72TqNz8JlBnEFKDS66XBwFMfbfmWTcXpGyaalFrHfsumcYniM2
xwIDAQABAm4Agbw0WkoCiSu1ji6+G098QZjA09WU8F/ncwl1vHBRPPoRm2+yiWhG
N0NzUcYo5Zy/sl2K0W4jgRrrgimOQLekZiTX2hpZjMXmuwdxHLcXf9BQlkUWaegg
gqySWUaaSTjRS0twq+S95ETULNPoQQI3HVercaYdMW+1+QCZnyOBkOxdLGUcnHwK
Fhn1DE+uzkTPcwQ/3pTcp3K/QHusFAzgYGuvI9FBtwI3CUs/LPOJQjIrvB2ZnUFL
9tF5raWmVS4MKbd2lM1FZmhLHtva2X9Bnhn0EClhPbmlGV9mo8BzcQI3Gn1xfDK5
nE37/Qa7qd4GNO4O1+uYvvWErZtVjX3KlNGub2ngt3OxGUMQwohkO928G5BcF3vt
VQI3BH+FwRTRntc3caGF4qVixb+Wu6OLwHg77MjdvKEo8KqTiQjxgAjmUkXPaS8N
4FkEfiY9QA36EQI3AKxizo9goAHnTmY1OVi+4GLp0HroWP64RjW8R/cUemggMqEa
UJYvEQEss8/UoYhOACOm5PEqNg==
-----END RSA PRIVATE KEY-----''';
  late NotificationsPushStorage storage;

  setUpAll(() {
    registerFallbackValue(RSAPrivateKey(BigInt.zero, BigInt.zero, BigInt.zero, BigInt.zero));
  });

  setUp(() {
    storage = _StorageMock();
  });

  group('getDevicePrivateKey', () {
    test('New', () async {
      when(() => storage.readDevicePrivateKey()).thenAnswer((_) => null);
      when(() => storage.saveDevicePrivateKey(any())).thenAnswer((_) async {});

      final privateKey = await getDevicePrivateKey(storage);
      expect(privateKey.toFormattedPEM(), isNot(privateKeyPEM));

      verify(() => storage.saveDevicePrivateKey(privateKey)).called(1);
    });

    test('Existing', () async {
      when(() => storage.readDevicePrivateKey()).thenAnswer((_) => RSAPrivateKey.fromPEM(privateKeyPEM));

      final privateKey = await getDevicePrivateKey(storage);
      expect(privateKey.toFormattedPEM(), equals(privateKeyPEM));

      verifyNever(() => storage.saveDevicePrivateKey(any()));
    });
  });

  test('parseEncryptedPushNotifications', () async {
    when(() => storage.readDevicePrivateKey()).thenAnswer((_) => RSAPrivateKey.fromPEM(privateKeyPEM));

    const subject1 =
        'AOXrekPv+79XU82vEXx5WiA9WREus8uYYkfijtKdl4ggWRvvykaY5hQP7OT5P7iKSCzjmO7yNQTuXDJXYtWo/1Pq0AYSVrA3y37pNYr8d/WZklfvQtxIB6o/HTG6pUd1kER7QxVkP7RSHvw/9PU=';
    const subject2 =
        'AGcV+V73rhvcT2OMu5AAQNd01zd4BWCJqgZc782MOXlj62yKv4AxfbXLZpKjH2tFn8WiZRg6DJmX25v3652mzaJefC4d/urfbIGYN1a30NNSpPJIxjZ1XWUe2MV+aKuaj+liKYukVvzOpK+scCM=';
    final messages = utf8.encode(
      Uri(
        queryParameters: {
          'message1': '{"priority":"priority","type":"type","subject":"$subject1"}',
          'message2': '{"priority":"priority","type":"type","subject":"$subject2"}',
        },
      ).query,
    );

    final notifications = await parseEncryptedPushNotifications(storage, messages, 'accountID');
    expect(notifications, hasLength(2));
    expect(notifications[0], equalsBuilt(createPushNotification()));
    expect(notifications[1], equalsBuilt(createPushNotification(nid: 1)));
  });
}
