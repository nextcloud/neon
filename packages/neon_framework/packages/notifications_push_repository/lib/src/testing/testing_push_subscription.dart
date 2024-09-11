import 'package:meta/meta.dart';
import 'package:notifications_push_repository/src/models/models.dart';

/// Creates a mocked [PushSubscription] object.
@visibleForTesting
PushSubscription createPushSubscription({
  String endpoint = 'endpoint',
  String publicKey = 'publicKey',
  String deviceIdentifier = 'deviceIdentifier',
  String signature = 'signature',
}) {
  return PushSubscription(
    (b) => b
      ..endpoint = endpoint
      ..pushDevice.update(
        (b) => b
          ..publicKey = publicKey
          ..deviceIdentifier = deviceIdentifier
          ..signature = signature,
      ),
  );
}
