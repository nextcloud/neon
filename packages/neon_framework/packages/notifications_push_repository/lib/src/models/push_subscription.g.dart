// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_subscription.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PushSubscription> _$pushSubscriptionSerializer = _$PushSubscriptionSerializer();

class _$PushSubscriptionSerializer implements StructuredSerializer<PushSubscription> {
  @override
  final Iterable<Type> types = const [PushSubscription, _$PushSubscription];
  @override
  final String wireName = 'PushSubscription';

  @override
  Iterable<Object?> serialize(Serializers serializers, PushSubscription object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.endpoint;
    if (value != null) {
      result
        ..add('endpoint')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.pushDevice;
    if (value != null) {
      result
        ..add('pushDevice')
        ..add(serializers.serialize(value, specifiedType: const FullType(notifications.PushDevice)));
    }
    return result;
  }

  @override
  PushSubscription deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PushSubscriptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'endpoint':
          result.endpoint = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'pushDevice':
          result.pushDevice.replace(serializers.deserialize(value,
              specifiedType: const FullType(notifications.PushDevice))! as notifications.PushDevice);
          break;
      }
    }

    return result.build();
  }
}

class _$PushSubscription extends PushSubscription {
  @override
  final String? endpoint;
  @override
  final notifications.PushDevice? pushDevice;

  factory _$PushSubscription([void Function(PushSubscriptionBuilder)? updates]) =>
      (PushSubscriptionBuilder()..update(updates))._build();

  _$PushSubscription._({this.endpoint, this.pushDevice}) : super._();

  @override
  PushSubscription rebuild(void Function(PushSubscriptionBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  PushSubscriptionBuilder toBuilder() => PushSubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PushSubscription && endpoint == other.endpoint && pushDevice == other.pushDevice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, endpoint.hashCode);
    _$hash = $jc(_$hash, pushDevice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PushSubscription')
          ..add('endpoint', endpoint)
          ..add('pushDevice', pushDevice))
        .toString();
  }
}

class PushSubscriptionBuilder implements Builder<PushSubscription, PushSubscriptionBuilder> {
  _$PushSubscription? _$v;

  String? _endpoint;
  String? get endpoint => _$this._endpoint;
  set endpoint(String? endpoint) => _$this._endpoint = endpoint;

  notifications.PushDeviceBuilder? _pushDevice;
  notifications.PushDeviceBuilder get pushDevice => _$this._pushDevice ??= notifications.PushDeviceBuilder();
  set pushDevice(notifications.PushDeviceBuilder? pushDevice) => _$this._pushDevice = pushDevice;

  PushSubscriptionBuilder();

  PushSubscriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _endpoint = $v.endpoint;
      _pushDevice = $v.pushDevice?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PushSubscription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PushSubscription;
  }

  @override
  void update(void Function(PushSubscriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PushSubscription build() => _build();

  _$PushSubscription _build() {
    _$PushSubscription _$result;
    try {
      _$result = _$v ?? _$PushSubscription._(endpoint: endpoint, pushDevice: _pushDevice?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pushDevice';
        _pushDevice?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'PushSubscription', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
