import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/notifications.dart' as notifications;

part 'push_subscription.g.dart';

@internal
abstract class PushSubscription implements Built<PushSubscription, PushSubscriptionBuilder> {
  factory PushSubscription([void Function(PushSubscriptionBuilder)? updates]) = _$PushSubscription;

  const PushSubscription._();

  factory PushSubscription.fromJson(Map<String, dynamic> json) => _serializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<PushSubscription> get serializer => _$pushSubscriptionSerializer;

  String? get endpoint;

  notifications.PushDevice? get pushDevice;
}

final Serializers _serializers = (Serializers().toBuilder()
      ..add(PushSubscription.serializer)
      ..add(notifications.PushDevice.serializer)
      ..addPlugin(StandardJsonPlugin()))
    .build();
