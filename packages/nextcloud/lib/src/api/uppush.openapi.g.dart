// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uppush.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UppushCheckResponse200ApplicationJson> _$uppushCheckResponse200ApplicationJsonSerializer =
    _$UppushCheckResponse200ApplicationJsonSerializer();
Serializer<UppushSetKeepaliveResponse200ApplicationJson> _$uppushSetKeepaliveResponse200ApplicationJsonSerializer =
    _$UppushSetKeepaliveResponse200ApplicationJsonSerializer();
Serializer<UppushCreateDeviceResponse200ApplicationJson> _$uppushCreateDeviceResponse200ApplicationJsonSerializer =
    _$UppushCreateDeviceResponse200ApplicationJsonSerializer();
Serializer<UppushSyncDeviceResponse401ApplicationJson> _$uppushSyncDeviceResponse401ApplicationJsonSerializer =
    _$UppushSyncDeviceResponse401ApplicationJsonSerializer();
Serializer<UppushDeleteDeviceResponse200ApplicationJson> _$uppushDeleteDeviceResponse200ApplicationJsonSerializer =
    _$UppushDeleteDeviceResponse200ApplicationJsonSerializer();
Serializer<UppushCreateAppResponse200ApplicationJson> _$uppushCreateAppResponse200ApplicationJsonSerializer =
    _$UppushCreateAppResponse200ApplicationJsonSerializer();
Serializer<UppushDeleteAppResponse200ApplicationJson> _$uppushDeleteAppResponse200ApplicationJsonSerializer =
    _$UppushDeleteAppResponse200ApplicationJsonSerializer();
Serializer<UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush>
    _$uppushUnifiedpushDiscoveryResponse200ApplicationJsonUnifiedpushSerializer =
    _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushSerializer();
Serializer<UppushUnifiedpushDiscoveryResponse200ApplicationJson>
    _$uppushUnifiedpushDiscoveryResponse200ApplicationJsonSerializer =
    _$UppushUnifiedpushDiscoveryResponse200ApplicationJsonSerializer();
Serializer<UppushPushResponse201ApplicationJson> _$uppushPushResponse201ApplicationJsonSerializer =
    _$UppushPushResponse201ApplicationJsonSerializer();
Serializer<UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush>
    _$uppushGatewayMatrixDiscoveryResponse200ApplicationJsonUnifiedpushSerializer =
    _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushSerializer();
Serializer<UppushGatewayMatrixDiscoveryResponse200ApplicationJson>
    _$uppushGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer =
    _$UppushGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer();
Serializer<UppushGatewayMatrixResponse200ApplicationJson> _$uppushGatewayMatrixResponse200ApplicationJsonSerializer =
    _$UppushGatewayMatrixResponse200ApplicationJsonSerializer();

class _$UppushCheckResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushCheckResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [UppushCheckResponse200ApplicationJson, _$UppushCheckResponse200ApplicationJson];
  @override
  final String wireName = 'UppushCheckResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushCheckResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushCheckResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushCheckResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushSetKeepaliveResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushSetKeepaliveResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushSetKeepaliveResponse200ApplicationJson,
    _$UppushSetKeepaliveResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UppushSetKeepaliveResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushSetKeepaliveResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushSetKeepaliveResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushSetKeepaliveResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushCreateDeviceResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushCreateDeviceResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushCreateDeviceResponse200ApplicationJson,
    _$UppushCreateDeviceResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UppushCreateDeviceResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushCreateDeviceResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
      'deviceId',
      serializers.serialize(object.deviceId, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UppushCreateDeviceResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushCreateDeviceResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'deviceId':
          result.deviceId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushSyncDeviceResponse401ApplicationJsonSerializer
    implements StructuredSerializer<UppushSyncDeviceResponse401ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushSyncDeviceResponse401ApplicationJson,
    _$UppushSyncDeviceResponse401ApplicationJson
  ];
  @override
  final String wireName = 'UppushSyncDeviceResponse401ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushSyncDeviceResponse401ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushSyncDeviceResponse401ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushSyncDeviceResponse401ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushDeleteDeviceResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushDeleteDeviceResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushDeleteDeviceResponse200ApplicationJson,
    _$UppushDeleteDeviceResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UppushDeleteDeviceResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushDeleteDeviceResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushDeleteDeviceResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushDeleteDeviceResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushCreateAppResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushCreateAppResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushCreateAppResponse200ApplicationJson,
    _$UppushCreateAppResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UppushCreateAppResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushCreateAppResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
      'token',
      serializers.serialize(object.token, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UppushCreateAppResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushCreateAppResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'token':
          result.token = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushDeleteAppResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushDeleteAppResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushDeleteAppResponse200ApplicationJson,
    _$UppushDeleteAppResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UppushDeleteAppResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushDeleteAppResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushDeleteAppResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushDeleteAppResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushSerializer
    implements StructuredSerializer<UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush> {
  @override
  final Iterable<Type> types = const [
    UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush,
    _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush
  ];
  @override
  final String wireName = 'UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushUnifiedpushDiscoveryResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushUnifiedpushDiscoveryResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushUnifiedpushDiscoveryResponse200ApplicationJson,
    _$UppushUnifiedpushDiscoveryResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UppushUnifiedpushDiscoveryResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushUnifiedpushDiscoveryResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unifiedpush',
      serializers.serialize(object.unifiedpush,
          specifiedType: const FullType(UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush)),
    ];

    return result;
  }

  @override
  UppushUnifiedpushDiscoveryResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unifiedpush':
          result.unifiedpush.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush))!
              as UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush);
          break;
      }
    }

    return result.build();
  }
}

class _$UppushPushResponse201ApplicationJsonSerializer
    implements StructuredSerializer<UppushPushResponse201ApplicationJson> {
  @override
  final Iterable<Type> types = const [UppushPushResponse201ApplicationJson, _$UppushPushResponse201ApplicationJson];
  @override
  final String wireName = 'UppushPushResponse201ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushPushResponse201ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushPushResponse201ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushPushResponse201ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushSerializer
    implements StructuredSerializer<UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush> {
  @override
  final Iterable<Type> types = const [
    UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush,
    _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush
  ];
  @override
  final String wireName = 'UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'gateway',
      serializers.serialize(object.gateway, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'gateway':
          result.gateway = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UppushGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushGatewayMatrixDiscoveryResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushGatewayMatrixDiscoveryResponse200ApplicationJson,
    _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UppushGatewayMatrixDiscoveryResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushGatewayMatrixDiscoveryResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unifiedpush',
      serializers.serialize(object.unifiedpush,
          specifiedType: const FullType(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush)),
    ];

    return result;
  }

  @override
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unifiedpush':
          result.unifiedpush.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush))!
              as UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush);
          break;
      }
    }

    return result.build();
  }
}

class _$UppushGatewayMatrixResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UppushGatewayMatrixResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushGatewayMatrixResponse200ApplicationJson,
    _$UppushGatewayMatrixResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UppushGatewayMatrixResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushGatewayMatrixResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'rejected',
      serializers.serialize(object.rejected, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];

    return result;
  }

  @override
  UppushGatewayMatrixResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushGatewayMatrixResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'rejected':
          result.rejected.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UppushCheckResponse200ApplicationJson extends UppushCheckResponse200ApplicationJson {
  @override
  final bool success;

  factory _$UppushCheckResponse200ApplicationJson(
          [void Function(UppushCheckResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushCheckResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushCheckResponse200ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushCheckResponse200ApplicationJson', 'success');
  }

  @override
  UppushCheckResponse200ApplicationJson rebuild(void Function(UppushCheckResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushCheckResponse200ApplicationJsonBuilder toBuilder() =>
      UppushCheckResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushCheckResponse200ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushCheckResponse200ApplicationJson')..add('success', success)).toString();
  }
}

class UppushCheckResponse200ApplicationJsonBuilder
    implements Builder<UppushCheckResponse200ApplicationJson, UppushCheckResponse200ApplicationJsonBuilder> {
  _$UppushCheckResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UppushCheckResponse200ApplicationJsonBuilder();

  UppushCheckResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushCheckResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushCheckResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushCheckResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushCheckResponse200ApplicationJson build() => _build();

  _$UppushCheckResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$UppushCheckResponse200ApplicationJson._(
            success:
                BuiltValueNullFieldError.checkNotNull(success, r'UppushCheckResponse200ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushSetKeepaliveResponse200ApplicationJson extends UppushSetKeepaliveResponse200ApplicationJson {
  @override
  final bool success;

  factory _$UppushSetKeepaliveResponse200ApplicationJson(
          [void Function(UppushSetKeepaliveResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushSetKeepaliveResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushSetKeepaliveResponse200ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushSetKeepaliveResponse200ApplicationJson', 'success');
  }

  @override
  UppushSetKeepaliveResponse200ApplicationJson rebuild(
          void Function(UppushSetKeepaliveResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushSetKeepaliveResponse200ApplicationJsonBuilder toBuilder() =>
      UppushSetKeepaliveResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushSetKeepaliveResponse200ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushSetKeepaliveResponse200ApplicationJson')..add('success', success))
        .toString();
  }
}

class UppushSetKeepaliveResponse200ApplicationJsonBuilder
    implements
        Builder<UppushSetKeepaliveResponse200ApplicationJson, UppushSetKeepaliveResponse200ApplicationJsonBuilder> {
  _$UppushSetKeepaliveResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UppushSetKeepaliveResponse200ApplicationJsonBuilder();

  UppushSetKeepaliveResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushSetKeepaliveResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushSetKeepaliveResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushSetKeepaliveResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushSetKeepaliveResponse200ApplicationJson build() => _build();

  _$UppushSetKeepaliveResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$UppushSetKeepaliveResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'UppushSetKeepaliveResponse200ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushCreateDeviceResponse200ApplicationJson extends UppushCreateDeviceResponse200ApplicationJson {
  @override
  final bool success;
  @override
  final String deviceId;

  factory _$UppushCreateDeviceResponse200ApplicationJson(
          [void Function(UppushCreateDeviceResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushCreateDeviceResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushCreateDeviceResponse200ApplicationJson._({required this.success, required this.deviceId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushCreateDeviceResponse200ApplicationJson', 'success');
    BuiltValueNullFieldError.checkNotNull(deviceId, r'UppushCreateDeviceResponse200ApplicationJson', 'deviceId');
  }

  @override
  UppushCreateDeviceResponse200ApplicationJson rebuild(
          void Function(UppushCreateDeviceResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushCreateDeviceResponse200ApplicationJsonBuilder toBuilder() =>
      UppushCreateDeviceResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushCreateDeviceResponse200ApplicationJson &&
        success == other.success &&
        deviceId == other.deviceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushCreateDeviceResponse200ApplicationJson')
          ..add('success', success)
          ..add('deviceId', deviceId))
        .toString();
  }
}

class UppushCreateDeviceResponse200ApplicationJsonBuilder
    implements
        Builder<UppushCreateDeviceResponse200ApplicationJson, UppushCreateDeviceResponse200ApplicationJsonBuilder> {
  _$UppushCreateDeviceResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  UppushCreateDeviceResponse200ApplicationJsonBuilder();

  UppushCreateDeviceResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _deviceId = $v.deviceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushCreateDeviceResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushCreateDeviceResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushCreateDeviceResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushCreateDeviceResponse200ApplicationJson build() => _build();

  _$UppushCreateDeviceResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$UppushCreateDeviceResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'UppushCreateDeviceResponse200ApplicationJson', 'success'),
            deviceId: BuiltValueNullFieldError.checkNotNull(
                deviceId, r'UppushCreateDeviceResponse200ApplicationJson', 'deviceId'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushSyncDeviceResponse401ApplicationJson extends UppushSyncDeviceResponse401ApplicationJson {
  @override
  final bool success;

  factory _$UppushSyncDeviceResponse401ApplicationJson(
          [void Function(UppushSyncDeviceResponse401ApplicationJsonBuilder)? updates]) =>
      (UppushSyncDeviceResponse401ApplicationJsonBuilder()..update(updates))._build();

  _$UppushSyncDeviceResponse401ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushSyncDeviceResponse401ApplicationJson', 'success');
  }

  @override
  UppushSyncDeviceResponse401ApplicationJson rebuild(
          void Function(UppushSyncDeviceResponse401ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushSyncDeviceResponse401ApplicationJsonBuilder toBuilder() =>
      UppushSyncDeviceResponse401ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushSyncDeviceResponse401ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushSyncDeviceResponse401ApplicationJson')..add('success', success))
        .toString();
  }
}

class UppushSyncDeviceResponse401ApplicationJsonBuilder
    implements Builder<UppushSyncDeviceResponse401ApplicationJson, UppushSyncDeviceResponse401ApplicationJsonBuilder> {
  _$UppushSyncDeviceResponse401ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UppushSyncDeviceResponse401ApplicationJsonBuilder();

  UppushSyncDeviceResponse401ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushSyncDeviceResponse401ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushSyncDeviceResponse401ApplicationJson;
  }

  @override
  void update(void Function(UppushSyncDeviceResponse401ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushSyncDeviceResponse401ApplicationJson build() => _build();

  _$UppushSyncDeviceResponse401ApplicationJson _build() {
    final _$result = _$v ??
        _$UppushSyncDeviceResponse401ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'UppushSyncDeviceResponse401ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushDeleteDeviceResponse200ApplicationJson extends UppushDeleteDeviceResponse200ApplicationJson {
  @override
  final bool success;

  factory _$UppushDeleteDeviceResponse200ApplicationJson(
          [void Function(UppushDeleteDeviceResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushDeleteDeviceResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushDeleteDeviceResponse200ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushDeleteDeviceResponse200ApplicationJson', 'success');
  }

  @override
  UppushDeleteDeviceResponse200ApplicationJson rebuild(
          void Function(UppushDeleteDeviceResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushDeleteDeviceResponse200ApplicationJsonBuilder toBuilder() =>
      UppushDeleteDeviceResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushDeleteDeviceResponse200ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushDeleteDeviceResponse200ApplicationJson')..add('success', success))
        .toString();
  }
}

class UppushDeleteDeviceResponse200ApplicationJsonBuilder
    implements
        Builder<UppushDeleteDeviceResponse200ApplicationJson, UppushDeleteDeviceResponse200ApplicationJsonBuilder> {
  _$UppushDeleteDeviceResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UppushDeleteDeviceResponse200ApplicationJsonBuilder();

  UppushDeleteDeviceResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushDeleteDeviceResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushDeleteDeviceResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushDeleteDeviceResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushDeleteDeviceResponse200ApplicationJson build() => _build();

  _$UppushDeleteDeviceResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$UppushDeleteDeviceResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'UppushDeleteDeviceResponse200ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushCreateAppResponse200ApplicationJson extends UppushCreateAppResponse200ApplicationJson {
  @override
  final bool success;
  @override
  final String token;

  factory _$UppushCreateAppResponse200ApplicationJson(
          [void Function(UppushCreateAppResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushCreateAppResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushCreateAppResponse200ApplicationJson._({required this.success, required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushCreateAppResponse200ApplicationJson', 'success');
    BuiltValueNullFieldError.checkNotNull(token, r'UppushCreateAppResponse200ApplicationJson', 'token');
  }

  @override
  UppushCreateAppResponse200ApplicationJson rebuild(
          void Function(UppushCreateAppResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushCreateAppResponse200ApplicationJsonBuilder toBuilder() =>
      UppushCreateAppResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushCreateAppResponse200ApplicationJson && success == other.success && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushCreateAppResponse200ApplicationJson')
          ..add('success', success)
          ..add('token', token))
        .toString();
  }
}

class UppushCreateAppResponse200ApplicationJsonBuilder
    implements Builder<UppushCreateAppResponse200ApplicationJson, UppushCreateAppResponse200ApplicationJsonBuilder> {
  _$UppushCreateAppResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  UppushCreateAppResponse200ApplicationJsonBuilder();

  UppushCreateAppResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushCreateAppResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushCreateAppResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushCreateAppResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushCreateAppResponse200ApplicationJson build() => _build();

  _$UppushCreateAppResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$UppushCreateAppResponse200ApplicationJson._(
            success:
                BuiltValueNullFieldError.checkNotNull(success, r'UppushCreateAppResponse200ApplicationJson', 'success'),
            token: BuiltValueNullFieldError.checkNotNull(token, r'UppushCreateAppResponse200ApplicationJson', 'token'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushDeleteAppResponse200ApplicationJson extends UppushDeleteAppResponse200ApplicationJson {
  @override
  final bool success;

  factory _$UppushDeleteAppResponse200ApplicationJson(
          [void Function(UppushDeleteAppResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushDeleteAppResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushDeleteAppResponse200ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushDeleteAppResponse200ApplicationJson', 'success');
  }

  @override
  UppushDeleteAppResponse200ApplicationJson rebuild(
          void Function(UppushDeleteAppResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushDeleteAppResponse200ApplicationJsonBuilder toBuilder() =>
      UppushDeleteAppResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushDeleteAppResponse200ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushDeleteAppResponse200ApplicationJson')..add('success', success))
        .toString();
  }
}

class UppushDeleteAppResponse200ApplicationJsonBuilder
    implements Builder<UppushDeleteAppResponse200ApplicationJson, UppushDeleteAppResponse200ApplicationJsonBuilder> {
  _$UppushDeleteAppResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UppushDeleteAppResponse200ApplicationJsonBuilder();

  UppushDeleteAppResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushDeleteAppResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushDeleteAppResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushDeleteAppResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushDeleteAppResponse200ApplicationJson build() => _build();

  _$UppushDeleteAppResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$UppushDeleteAppResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'UppushDeleteAppResponse200ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush
    extends UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush {
  @override
  final int version;

  factory _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush(
          [void Function(UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)? updates]) =>
      (UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder()..update(updates))._build();

  _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush._({required this.version}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        version, r'UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush', 'version');
  }

  @override
  UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush rebuild(
          void Function(UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder toBuilder() =>
      UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush && version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush')
          ..add('version', version))
        .toString();
  }
}

class UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder
    implements
        Builder<UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush,
            UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush? _$v;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();

  UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush;
  }

  @override
  void update(void Function(UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush build() => _build();

  _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush _build() {
    final _$result = _$v ??
        _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush._(
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush', 'version'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushUnifiedpushDiscoveryResponse200ApplicationJson
    extends UppushUnifiedpushDiscoveryResponse200ApplicationJson {
  @override
  final UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush unifiedpush;

  factory _$UppushUnifiedpushDiscoveryResponse200ApplicationJson(
          [void Function(UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushUnifiedpushDiscoveryResponse200ApplicationJson._({required this.unifiedpush}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        unifiedpush, r'UppushUnifiedpushDiscoveryResponse200ApplicationJson', 'unifiedpush');
  }

  @override
  UppushUnifiedpushDiscoveryResponse200ApplicationJson rebuild(
          void Function(UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder toBuilder() =>
      UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushUnifiedpushDiscoveryResponse200ApplicationJson && unifiedpush == other.unifiedpush;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, unifiedpush.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushUnifiedpushDiscoveryResponse200ApplicationJson')
          ..add('unifiedpush', unifiedpush))
        .toString();
  }
}

class UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder
    implements
        Builder<UppushUnifiedpushDiscoveryResponse200ApplicationJson,
            UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder> {
  _$UppushUnifiedpushDiscoveryResponse200ApplicationJson? _$v;

  UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder? _unifiedpush;
  UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder get unifiedpush =>
      _$this._unifiedpush ??= UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();
  set unifiedpush(UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder? unifiedpush) =>
      _$this._unifiedpush = unifiedpush;

  UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder();

  UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unifiedpush = $v.unifiedpush.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushUnifiedpushDiscoveryResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushUnifiedpushDiscoveryResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushUnifiedpushDiscoveryResponse200ApplicationJson build() => _build();

  _$UppushUnifiedpushDiscoveryResponse200ApplicationJson _build() {
    _$UppushUnifiedpushDiscoveryResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UppushUnifiedpushDiscoveryResponse200ApplicationJson._(unifiedpush: unifiedpush.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unifiedpush';
        unifiedpush.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UppushUnifiedpushDiscoveryResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UppushPushResponse201ApplicationJson extends UppushPushResponse201ApplicationJson {
  @override
  final bool success;

  factory _$UppushPushResponse201ApplicationJson(
          [void Function(UppushPushResponse201ApplicationJsonBuilder)? updates]) =>
      (UppushPushResponse201ApplicationJsonBuilder()..update(updates))._build();

  _$UppushPushResponse201ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushPushResponse201ApplicationJson', 'success');
  }

  @override
  UppushPushResponse201ApplicationJson rebuild(void Function(UppushPushResponse201ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushPushResponse201ApplicationJsonBuilder toBuilder() =>
      UppushPushResponse201ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushPushResponse201ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushPushResponse201ApplicationJson')..add('success', success)).toString();
  }
}

class UppushPushResponse201ApplicationJsonBuilder
    implements Builder<UppushPushResponse201ApplicationJson, UppushPushResponse201ApplicationJsonBuilder> {
  _$UppushPushResponse201ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UppushPushResponse201ApplicationJsonBuilder();

  UppushPushResponse201ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushPushResponse201ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushPushResponse201ApplicationJson;
  }

  @override
  void update(void Function(UppushPushResponse201ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushPushResponse201ApplicationJson build() => _build();

  _$UppushPushResponse201ApplicationJson _build() {
    final _$result = _$v ??
        _$UppushPushResponse201ApplicationJson._(
            success:
                BuiltValueNullFieldError.checkNotNull(success, r'UppushPushResponse201ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush
    extends UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush {
  @override
  final String gateway;

  factory _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush(
          [void Function(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)? updates]) =>
      (UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder()..update(updates))._build();

  _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush._({required this.gateway}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        gateway, r'UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush', 'gateway');
  }

  @override
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush rebuild(
          void Function(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder toBuilder() =>
      UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush && gateway == other.gateway;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, gateway.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush')
          ..add('gateway', gateway))
        .toString();
  }
}

class UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder
    implements
        Builder<UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush,
            UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush? _$v;

  String? _gateway;
  String? get gateway => _$this._gateway;
  set gateway(String? gateway) => _$this._gateway = gateway;

  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();

  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gateway = $v.gateway;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush;
  }

  @override
  void update(void Function(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush build() => _build();

  _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush _build() {
    final _$result = _$v ??
        _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush._(
            gateway: BuiltValueNullFieldError.checkNotNull(
                gateway, r'UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush', 'gateway'));
    replace(_$result);
    return _$result;
  }
}

class _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson
    extends UppushGatewayMatrixDiscoveryResponse200ApplicationJson {
  @override
  final UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush unifiedpush;

  factory _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson(
          [void Function(UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson._({required this.unifiedpush}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        unifiedpush, r'UppushGatewayMatrixDiscoveryResponse200ApplicationJson', 'unifiedpush');
  }

  @override
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson rebuild(
          void Function(UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder toBuilder() =>
      UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushGatewayMatrixDiscoveryResponse200ApplicationJson && unifiedpush == other.unifiedpush;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, unifiedpush.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushGatewayMatrixDiscoveryResponse200ApplicationJson')
          ..add('unifiedpush', unifiedpush))
        .toString();
  }
}

class UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder
    implements
        Builder<UppushGatewayMatrixDiscoveryResponse200ApplicationJson,
            UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder> {
  _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson? _$v;

  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder? _unifiedpush;
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder get unifiedpush =>
      _$this._unifiedpush ??= UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();
  set unifiedpush(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder? unifiedpush) =>
      _$this._unifiedpush = unifiedpush;

  UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder();

  UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unifiedpush = $v.unifiedpush.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushGatewayMatrixDiscoveryResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson build() => _build();

  _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson _build() {
    _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson._(unifiedpush: unifiedpush.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unifiedpush';
        unifiedpush.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UppushGatewayMatrixDiscoveryResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UppushGatewayMatrixResponse200ApplicationJson extends UppushGatewayMatrixResponse200ApplicationJson {
  @override
  final BuiltList<String> rejected;

  factory _$UppushGatewayMatrixResponse200ApplicationJson(
          [void Function(UppushGatewayMatrixResponse200ApplicationJsonBuilder)? updates]) =>
      (UppushGatewayMatrixResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UppushGatewayMatrixResponse200ApplicationJson._({required this.rejected}) : super._() {
    BuiltValueNullFieldError.checkNotNull(rejected, r'UppushGatewayMatrixResponse200ApplicationJson', 'rejected');
  }

  @override
  UppushGatewayMatrixResponse200ApplicationJson rebuild(
          void Function(UppushGatewayMatrixResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushGatewayMatrixResponse200ApplicationJsonBuilder toBuilder() =>
      UppushGatewayMatrixResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushGatewayMatrixResponse200ApplicationJson && rejected == other.rejected;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rejected.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UppushGatewayMatrixResponse200ApplicationJson')..add('rejected', rejected))
        .toString();
  }
}

class UppushGatewayMatrixResponse200ApplicationJsonBuilder
    implements
        Builder<UppushGatewayMatrixResponse200ApplicationJson, UppushGatewayMatrixResponse200ApplicationJsonBuilder> {
  _$UppushGatewayMatrixResponse200ApplicationJson? _$v;

  ListBuilder<String>? _rejected;
  ListBuilder<String> get rejected => _$this._rejected ??= ListBuilder<String>();
  set rejected(ListBuilder<String>? rejected) => _$this._rejected = rejected;

  UppushGatewayMatrixResponse200ApplicationJsonBuilder();

  UppushGatewayMatrixResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rejected = $v.rejected.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UppushGatewayMatrixResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushGatewayMatrixResponse200ApplicationJson;
  }

  @override
  void update(void Function(UppushGatewayMatrixResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushGatewayMatrixResponse200ApplicationJson build() => _build();

  _$UppushGatewayMatrixResponse200ApplicationJson _build() {
    _$UppushGatewayMatrixResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UppushGatewayMatrixResponse200ApplicationJson._(rejected: rejected.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rejected';
        rejected.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UppushGatewayMatrixResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
