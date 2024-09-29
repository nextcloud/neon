import 'package:flutter_test/flutter_test.dart';
import 'package:notifications_push_repository/testing.dart';

void main() {
  group('PushSubscription', () {
    group('constructor', () {
      test('works correctly', () {
        expect(
          createPushSubscription,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createPushSubscription(),
        equals(createPushSubscription()),
      );

      expect(
        createPushSubscription().hashCode,
        equals(createPushSubscription().hashCode),
      );

      expect(
        createPushSubscription(),
        isNot(
          equals(
            createPushSubscription(
              endpoint: '',
            ),
          ),
        ),
      );
    });

    group('rebuild', () {
      test('returns the same object if not attributes are changed', () {
        expect(
          createPushSubscription().rebuild((_) {}),
          equals(createPushSubscription()),
        );
      });

      test('replaces every attribute', () {
        expect(
          createPushSubscription().rebuild(
            (b) => b
              ..endpoint = 'new-endpoint'
              ..pushDevice.update(
                (b) => b
                  ..publicKey = 'new-publicKey'
                  ..deviceIdentifier = 'new-deviceIdentifier'
                  ..signature = 'new-signature',
              ),
          ),
          equals(
            createPushSubscription(
              endpoint: 'new-endpoint',
              publicKey: 'new-publicKey',
              deviceIdentifier: 'new-deviceIdentifier',
              signature: 'new-signature',
            ),
          ),
        );
      });
    });

    test('to string', () {
      expect(
        createPushSubscription().toString(),
        equals('''
PushSubscription {
  endpoint=endpoint,
  pushDevice=PushDevice {
    publicKey=publicKey,
    deviceIdentifier=deviceIdentifier,
    signature=signature,
  },
}'''),
      );
    });
  });
}
