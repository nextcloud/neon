part of 'notifications_push_repository.dart';

/// A storage for push subscriptions and the device private key.
class NotificationsPushStorage {
  /// Creates a new [NotificationsPushStorage].
  NotificationsPushStorage({
    required SingleValueStore devicePrivateKeyPersistence,
    required Persistence<Object> pushSubscriptionsPersistence,
  })  : _pushSubscriptionsPersistence = pushSubscriptionsPersistence,
        _devicePrivateKeyPersistence = devicePrivateKeyPersistence;

  final SingleValueStore _devicePrivateKeyPersistence;
  final Persistence _pushSubscriptionsPersistence;

  /// Reads the stored device private key.
  RSAPrivateKey? readDevicePrivateKey() {
    final privateKey = _devicePrivateKeyPersistence.getString();
    if (privateKey != null && privateKey.isNotEmpty) {
      return RSAPrivateKey.fromPEM(privateKey);
    }

    return null;
  }

  /// Saves a new device [privateKey].
  Future<void> saveDevicePrivateKey(RSAPrivateKey privateKey) async {
    await _devicePrivateKeyPersistence.setString(privateKey.toPEM());
  }

  /// Reads all stored subscriptions.
  Future<BuiltMap<String, PushSubscription>> readSubscriptions() async {
    final builder = MapBuilder<String, PushSubscription>();

    final keys = await _pushSubscriptionsPersistence.keys();
    for (final key in keys) {
      final value = await _pushSubscriptionsPersistence.getValue(key);
      builder[key] = PushSubscription.fromJson(json.decode(value! as String) as Map<String, dynamic>);
    }

    return builder.build();
  }

  /// Updates a [subscription].
  ///
  /// If [PushSubscription.endpoint] and [PushSubscription.pushDevice] are `null` the subscription will be removed.
  Future<void> updateSubscription(String key, PushSubscription subscription) async {
    if (subscription.endpoint == null && subscription.pushDevice == null) {
      _pushSubscriptionsPersistence.remove(key);
    } else {
      _pushSubscriptionsPersistence.setValue(key, json.encode(subscription.toJson()));
    }
  }
}
