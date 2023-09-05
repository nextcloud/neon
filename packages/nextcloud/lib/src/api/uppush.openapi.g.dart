// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uppush.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UppushCheckResponseApplicationJson> _$uppushCheckResponseApplicationJsonSerializer =
    _$UppushCheckResponseApplicationJsonSerializer();
Serializer<UppushSetKeepaliveResponseApplicationJson> _$uppushSetKeepaliveResponseApplicationJsonSerializer =
    _$UppushSetKeepaliveResponseApplicationJsonSerializer();
Serializer<UppushCreateDeviceResponseApplicationJson> _$uppushCreateDeviceResponseApplicationJsonSerializer =
    _$UppushCreateDeviceResponseApplicationJsonSerializer();
Serializer<UppushSyncDeviceResponseApplicationJson> _$uppushSyncDeviceResponseApplicationJsonSerializer =
    _$UppushSyncDeviceResponseApplicationJsonSerializer();
Serializer<UppushDeleteDeviceResponseApplicationJson> _$uppushDeleteDeviceResponseApplicationJsonSerializer =
    _$UppushDeleteDeviceResponseApplicationJsonSerializer();
Serializer<UppushCreateAppResponseApplicationJson> _$uppushCreateAppResponseApplicationJsonSerializer =
    _$UppushCreateAppResponseApplicationJsonSerializer();
Serializer<UppushDeleteAppResponseApplicationJson> _$uppushDeleteAppResponseApplicationJsonSerializer =
    _$UppushDeleteAppResponseApplicationJsonSerializer();
Serializer<UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush>
    _$uppushUnifiedpushDiscoveryResponseApplicationJsonUnifiedpushSerializer =
    _$UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushSerializer();
Serializer<UppushUnifiedpushDiscoveryResponseApplicationJson>
    _$uppushUnifiedpushDiscoveryResponseApplicationJsonSerializer =
    _$UppushUnifiedpushDiscoveryResponseApplicationJsonSerializer();
Serializer<UppushPushResponseApplicationJson> _$uppushPushResponseApplicationJsonSerializer =
    _$UppushPushResponseApplicationJsonSerializer();
Serializer<UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush>
    _$uppushGatewayMatrixDiscoveryResponseApplicationJsonUnifiedpushSerializer =
    _$UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushSerializer();
Serializer<UppushGatewayMatrixDiscoveryResponseApplicationJson>
    _$uppushGatewayMatrixDiscoveryResponseApplicationJsonSerializer =
    _$UppushGatewayMatrixDiscoveryResponseApplicationJsonSerializer();
Serializer<UppushGatewayMatrixResponseApplicationJson> _$uppushGatewayMatrixResponseApplicationJsonSerializer =
    _$UppushGatewayMatrixResponseApplicationJsonSerializer();

class _$UppushCheckResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushCheckResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [UppushCheckResponseApplicationJson, _$UppushCheckResponseApplicationJson];
  @override
  final String wireName = 'UppushCheckResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushCheckResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushCheckResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushCheckResponseApplicationJsonBuilder();

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

class _$UppushSetKeepaliveResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushSetKeepaliveResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushSetKeepaliveResponseApplicationJson,
    _$UppushSetKeepaliveResponseApplicationJson
  ];
  @override
  final String wireName = 'UppushSetKeepaliveResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushSetKeepaliveResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushSetKeepaliveResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushSetKeepaliveResponseApplicationJsonBuilder();

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

class _$UppushCreateDeviceResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushCreateDeviceResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushCreateDeviceResponseApplicationJson,
    _$UppushCreateDeviceResponseApplicationJson
  ];
  @override
  final String wireName = 'UppushCreateDeviceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushCreateDeviceResponseApplicationJson object,
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
  UppushCreateDeviceResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushCreateDeviceResponseApplicationJsonBuilder();

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

class _$UppushSyncDeviceResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushSyncDeviceResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushSyncDeviceResponseApplicationJson,
    _$UppushSyncDeviceResponseApplicationJson
  ];
  @override
  final String wireName = 'UppushSyncDeviceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushSyncDeviceResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushSyncDeviceResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushSyncDeviceResponseApplicationJsonBuilder();

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

class _$UppushDeleteDeviceResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushDeleteDeviceResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushDeleteDeviceResponseApplicationJson,
    _$UppushDeleteDeviceResponseApplicationJson
  ];
  @override
  final String wireName = 'UppushDeleteDeviceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushDeleteDeviceResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushDeleteDeviceResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushDeleteDeviceResponseApplicationJsonBuilder();

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

class _$UppushCreateAppResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushCreateAppResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [UppushCreateAppResponseApplicationJson, _$UppushCreateAppResponseApplicationJson];
  @override
  final String wireName = 'UppushCreateAppResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushCreateAppResponseApplicationJson object,
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
  UppushCreateAppResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushCreateAppResponseApplicationJsonBuilder();

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

class _$UppushDeleteAppResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushDeleteAppResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [UppushDeleteAppResponseApplicationJson, _$UppushDeleteAppResponseApplicationJson];
  @override
  final String wireName = 'UppushDeleteAppResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushDeleteAppResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushDeleteAppResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushDeleteAppResponseApplicationJsonBuilder();

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

class _$UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushSerializer
    implements StructuredSerializer<UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush> {
  @override
  final Iterable<Type> types = const [
    UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush,
    _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush
  ];
  @override
  final String wireName = 'UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder();

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

class _$UppushUnifiedpushDiscoveryResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushUnifiedpushDiscoveryResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushUnifiedpushDiscoveryResponseApplicationJson,
    _$UppushUnifiedpushDiscoveryResponseApplicationJson
  ];
  @override
  final String wireName = 'UppushUnifiedpushDiscoveryResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushUnifiedpushDiscoveryResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unifiedpush',
      serializers.serialize(object.unifiedpush,
          specifiedType: const FullType(UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush)),
    ];

    return result;
  }

  @override
  UppushUnifiedpushDiscoveryResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unifiedpush':
          result.unifiedpush.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush))!
              as UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush);
          break;
      }
    }

    return result.build();
  }
}

class _$UppushPushResponseApplicationJsonSerializer implements StructuredSerializer<UppushPushResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [UppushPushResponseApplicationJson, _$UppushPushResponseApplicationJson];
  @override
  final String wireName = 'UppushPushResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushPushResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UppushPushResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushPushResponseApplicationJsonBuilder();

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

class _$UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushSerializer
    implements StructuredSerializer<UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush> {
  @override
  final Iterable<Type> types = const [
    UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush,
    _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush
  ];
  @override
  final String wireName = 'UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'gateway',
      serializers.serialize(object.gateway, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder();

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

class _$UppushGatewayMatrixDiscoveryResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushGatewayMatrixDiscoveryResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushGatewayMatrixDiscoveryResponseApplicationJson,
    _$UppushGatewayMatrixDiscoveryResponseApplicationJson
  ];
  @override
  final String wireName = 'UppushGatewayMatrixDiscoveryResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushGatewayMatrixDiscoveryResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unifiedpush',
      serializers.serialize(object.unifiedpush,
          specifiedType: const FullType(UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush)),
    ];

    return result;
  }

  @override
  UppushGatewayMatrixDiscoveryResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unifiedpush':
          result.unifiedpush.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush))!
              as UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush);
          break;
      }
    }

    return result.build();
  }
}

class _$UppushGatewayMatrixResponseApplicationJsonSerializer
    implements StructuredSerializer<UppushGatewayMatrixResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UppushGatewayMatrixResponseApplicationJson,
    _$UppushGatewayMatrixResponseApplicationJson
  ];
  @override
  final String wireName = 'UppushGatewayMatrixResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UppushGatewayMatrixResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'rejected',
      serializers.serialize(object.rejected, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];

    return result;
  }

  @override
  UppushGatewayMatrixResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UppushGatewayMatrixResponseApplicationJsonBuilder();

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

abstract mixin class UppushCheckResponseApplicationJsonInterfaceBuilder {
  void replace(UppushCheckResponseApplicationJsonInterface other);
  void update(void Function(UppushCheckResponseApplicationJsonInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);
}

class _$UppushCheckResponseApplicationJson extends UppushCheckResponseApplicationJson {
  @override
  final bool success;

  factory _$UppushCheckResponseApplicationJson([void Function(UppushCheckResponseApplicationJsonBuilder)? updates]) =>
      (UppushCheckResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushCheckResponseApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushCheckResponseApplicationJson', 'success');
  }

  @override
  UppushCheckResponseApplicationJson rebuild(void Function(UppushCheckResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushCheckResponseApplicationJsonBuilder toBuilder() => UppushCheckResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushCheckResponseApplicationJson && success == other.success;
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
    return (newBuiltValueToStringHelper(r'UppushCheckResponseApplicationJson')..add('success', success)).toString();
  }
}

class UppushCheckResponseApplicationJsonBuilder
    implements
        Builder<UppushCheckResponseApplicationJson, UppushCheckResponseApplicationJsonBuilder>,
        UppushCheckResponseApplicationJsonInterfaceBuilder {
  _$UppushCheckResponseApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  UppushCheckResponseApplicationJsonBuilder();

  UppushCheckResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushCheckResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushCheckResponseApplicationJson;
  }

  @override
  void update(void Function(UppushCheckResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushCheckResponseApplicationJson build() => _build();

  _$UppushCheckResponseApplicationJson _build() {
    final _$result = _$v ??
        _$UppushCheckResponseApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(success, r'UppushCheckResponseApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushSetKeepaliveResponseApplicationJsonInterfaceBuilder {
  void replace(UppushSetKeepaliveResponseApplicationJsonInterface other);
  void update(void Function(UppushSetKeepaliveResponseApplicationJsonInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);
}

class _$UppushSetKeepaliveResponseApplicationJson extends UppushSetKeepaliveResponseApplicationJson {
  @override
  final bool success;

  factory _$UppushSetKeepaliveResponseApplicationJson(
          [void Function(UppushSetKeepaliveResponseApplicationJsonBuilder)? updates]) =>
      (UppushSetKeepaliveResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushSetKeepaliveResponseApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushSetKeepaliveResponseApplicationJson', 'success');
  }

  @override
  UppushSetKeepaliveResponseApplicationJson rebuild(
          void Function(UppushSetKeepaliveResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushSetKeepaliveResponseApplicationJsonBuilder toBuilder() =>
      UppushSetKeepaliveResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushSetKeepaliveResponseApplicationJson && success == other.success;
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
    return (newBuiltValueToStringHelper(r'UppushSetKeepaliveResponseApplicationJson')..add('success', success))
        .toString();
  }
}

class UppushSetKeepaliveResponseApplicationJsonBuilder
    implements
        Builder<UppushSetKeepaliveResponseApplicationJson, UppushSetKeepaliveResponseApplicationJsonBuilder>,
        UppushSetKeepaliveResponseApplicationJsonInterfaceBuilder {
  _$UppushSetKeepaliveResponseApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  UppushSetKeepaliveResponseApplicationJsonBuilder();

  UppushSetKeepaliveResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushSetKeepaliveResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushSetKeepaliveResponseApplicationJson;
  }

  @override
  void update(void Function(UppushSetKeepaliveResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushSetKeepaliveResponseApplicationJson build() => _build();

  _$UppushSetKeepaliveResponseApplicationJson _build() {
    final _$result = _$v ??
        _$UppushSetKeepaliveResponseApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'UppushSetKeepaliveResponseApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushCreateDeviceResponseApplicationJsonInterfaceBuilder {
  void replace(UppushCreateDeviceResponseApplicationJsonInterface other);
  void update(void Function(UppushCreateDeviceResponseApplicationJsonInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);

  String? get deviceId;
  set deviceId(String? deviceId);
}

class _$UppushCreateDeviceResponseApplicationJson extends UppushCreateDeviceResponseApplicationJson {
  @override
  final bool success;
  @override
  final String deviceId;

  factory _$UppushCreateDeviceResponseApplicationJson(
          [void Function(UppushCreateDeviceResponseApplicationJsonBuilder)? updates]) =>
      (UppushCreateDeviceResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushCreateDeviceResponseApplicationJson._({required this.success, required this.deviceId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushCreateDeviceResponseApplicationJson', 'success');
    BuiltValueNullFieldError.checkNotNull(deviceId, r'UppushCreateDeviceResponseApplicationJson', 'deviceId');
  }

  @override
  UppushCreateDeviceResponseApplicationJson rebuild(
          void Function(UppushCreateDeviceResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushCreateDeviceResponseApplicationJsonBuilder toBuilder() =>
      UppushCreateDeviceResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushCreateDeviceResponseApplicationJson && success == other.success && deviceId == other.deviceId;
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
    return (newBuiltValueToStringHelper(r'UppushCreateDeviceResponseApplicationJson')
          ..add('success', success)
          ..add('deviceId', deviceId))
        .toString();
  }
}

class UppushCreateDeviceResponseApplicationJsonBuilder
    implements
        Builder<UppushCreateDeviceResponseApplicationJson, UppushCreateDeviceResponseApplicationJsonBuilder>,
        UppushCreateDeviceResponseApplicationJsonInterfaceBuilder {
  _$UppushCreateDeviceResponseApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(covariant String? deviceId) => _$this._deviceId = deviceId;

  UppushCreateDeviceResponseApplicationJsonBuilder();

  UppushCreateDeviceResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _deviceId = $v.deviceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushCreateDeviceResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushCreateDeviceResponseApplicationJson;
  }

  @override
  void update(void Function(UppushCreateDeviceResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushCreateDeviceResponseApplicationJson build() => _build();

  _$UppushCreateDeviceResponseApplicationJson _build() {
    final _$result = _$v ??
        _$UppushCreateDeviceResponseApplicationJson._(
            success:
                BuiltValueNullFieldError.checkNotNull(success, r'UppushCreateDeviceResponseApplicationJson', 'success'),
            deviceId: BuiltValueNullFieldError.checkNotNull(
                deviceId, r'UppushCreateDeviceResponseApplicationJson', 'deviceId'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushSyncDeviceResponseApplicationJsonInterfaceBuilder {
  void replace(UppushSyncDeviceResponseApplicationJsonInterface other);
  void update(void Function(UppushSyncDeviceResponseApplicationJsonInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);
}

class _$UppushSyncDeviceResponseApplicationJson extends UppushSyncDeviceResponseApplicationJson {
  @override
  final bool success;

  factory _$UppushSyncDeviceResponseApplicationJson(
          [void Function(UppushSyncDeviceResponseApplicationJsonBuilder)? updates]) =>
      (UppushSyncDeviceResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushSyncDeviceResponseApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushSyncDeviceResponseApplicationJson', 'success');
  }

  @override
  UppushSyncDeviceResponseApplicationJson rebuild(
          void Function(UppushSyncDeviceResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushSyncDeviceResponseApplicationJsonBuilder toBuilder() =>
      UppushSyncDeviceResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushSyncDeviceResponseApplicationJson && success == other.success;
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
    return (newBuiltValueToStringHelper(r'UppushSyncDeviceResponseApplicationJson')..add('success', success))
        .toString();
  }
}

class UppushSyncDeviceResponseApplicationJsonBuilder
    implements
        Builder<UppushSyncDeviceResponseApplicationJson, UppushSyncDeviceResponseApplicationJsonBuilder>,
        UppushSyncDeviceResponseApplicationJsonInterfaceBuilder {
  _$UppushSyncDeviceResponseApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  UppushSyncDeviceResponseApplicationJsonBuilder();

  UppushSyncDeviceResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushSyncDeviceResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushSyncDeviceResponseApplicationJson;
  }

  @override
  void update(void Function(UppushSyncDeviceResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushSyncDeviceResponseApplicationJson build() => _build();

  _$UppushSyncDeviceResponseApplicationJson _build() {
    final _$result = _$v ??
        _$UppushSyncDeviceResponseApplicationJson._(
            success:
                BuiltValueNullFieldError.checkNotNull(success, r'UppushSyncDeviceResponseApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushDeleteDeviceResponseApplicationJsonInterfaceBuilder {
  void replace(UppushDeleteDeviceResponseApplicationJsonInterface other);
  void update(void Function(UppushDeleteDeviceResponseApplicationJsonInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);
}

class _$UppushDeleteDeviceResponseApplicationJson extends UppushDeleteDeviceResponseApplicationJson {
  @override
  final bool success;

  factory _$UppushDeleteDeviceResponseApplicationJson(
          [void Function(UppushDeleteDeviceResponseApplicationJsonBuilder)? updates]) =>
      (UppushDeleteDeviceResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushDeleteDeviceResponseApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushDeleteDeviceResponseApplicationJson', 'success');
  }

  @override
  UppushDeleteDeviceResponseApplicationJson rebuild(
          void Function(UppushDeleteDeviceResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushDeleteDeviceResponseApplicationJsonBuilder toBuilder() =>
      UppushDeleteDeviceResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushDeleteDeviceResponseApplicationJson && success == other.success;
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
    return (newBuiltValueToStringHelper(r'UppushDeleteDeviceResponseApplicationJson')..add('success', success))
        .toString();
  }
}

class UppushDeleteDeviceResponseApplicationJsonBuilder
    implements
        Builder<UppushDeleteDeviceResponseApplicationJson, UppushDeleteDeviceResponseApplicationJsonBuilder>,
        UppushDeleteDeviceResponseApplicationJsonInterfaceBuilder {
  _$UppushDeleteDeviceResponseApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  UppushDeleteDeviceResponseApplicationJsonBuilder();

  UppushDeleteDeviceResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushDeleteDeviceResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushDeleteDeviceResponseApplicationJson;
  }

  @override
  void update(void Function(UppushDeleteDeviceResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushDeleteDeviceResponseApplicationJson build() => _build();

  _$UppushDeleteDeviceResponseApplicationJson _build() {
    final _$result = _$v ??
        _$UppushDeleteDeviceResponseApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'UppushDeleteDeviceResponseApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushCreateAppResponseApplicationJsonInterfaceBuilder {
  void replace(UppushCreateAppResponseApplicationJsonInterface other);
  void update(void Function(UppushCreateAppResponseApplicationJsonInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);

  String? get token;
  set token(String? token);
}

class _$UppushCreateAppResponseApplicationJson extends UppushCreateAppResponseApplicationJson {
  @override
  final bool success;
  @override
  final String token;

  factory _$UppushCreateAppResponseApplicationJson(
          [void Function(UppushCreateAppResponseApplicationJsonBuilder)? updates]) =>
      (UppushCreateAppResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushCreateAppResponseApplicationJson._({required this.success, required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushCreateAppResponseApplicationJson', 'success');
    BuiltValueNullFieldError.checkNotNull(token, r'UppushCreateAppResponseApplicationJson', 'token');
  }

  @override
  UppushCreateAppResponseApplicationJson rebuild(
          void Function(UppushCreateAppResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushCreateAppResponseApplicationJsonBuilder toBuilder() =>
      UppushCreateAppResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushCreateAppResponseApplicationJson && success == other.success && token == other.token;
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
    return (newBuiltValueToStringHelper(r'UppushCreateAppResponseApplicationJson')
          ..add('success', success)
          ..add('token', token))
        .toString();
  }
}

class UppushCreateAppResponseApplicationJsonBuilder
    implements
        Builder<UppushCreateAppResponseApplicationJson, UppushCreateAppResponseApplicationJsonBuilder>,
        UppushCreateAppResponseApplicationJsonInterfaceBuilder {
  _$UppushCreateAppResponseApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  String? _token;
  String? get token => _$this._token;
  set token(covariant String? token) => _$this._token = token;

  UppushCreateAppResponseApplicationJsonBuilder();

  UppushCreateAppResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushCreateAppResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushCreateAppResponseApplicationJson;
  }

  @override
  void update(void Function(UppushCreateAppResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushCreateAppResponseApplicationJson build() => _build();

  _$UppushCreateAppResponseApplicationJson _build() {
    final _$result = _$v ??
        _$UppushCreateAppResponseApplicationJson._(
            success:
                BuiltValueNullFieldError.checkNotNull(success, r'UppushCreateAppResponseApplicationJson', 'success'),
            token: BuiltValueNullFieldError.checkNotNull(token, r'UppushCreateAppResponseApplicationJson', 'token'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushDeleteAppResponseApplicationJsonInterfaceBuilder {
  void replace(UppushDeleteAppResponseApplicationJsonInterface other);
  void update(void Function(UppushDeleteAppResponseApplicationJsonInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);
}

class _$UppushDeleteAppResponseApplicationJson extends UppushDeleteAppResponseApplicationJson {
  @override
  final bool success;

  factory _$UppushDeleteAppResponseApplicationJson(
          [void Function(UppushDeleteAppResponseApplicationJsonBuilder)? updates]) =>
      (UppushDeleteAppResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushDeleteAppResponseApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushDeleteAppResponseApplicationJson', 'success');
  }

  @override
  UppushDeleteAppResponseApplicationJson rebuild(
          void Function(UppushDeleteAppResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushDeleteAppResponseApplicationJsonBuilder toBuilder() =>
      UppushDeleteAppResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushDeleteAppResponseApplicationJson && success == other.success;
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
    return (newBuiltValueToStringHelper(r'UppushDeleteAppResponseApplicationJson')..add('success', success)).toString();
  }
}

class UppushDeleteAppResponseApplicationJsonBuilder
    implements
        Builder<UppushDeleteAppResponseApplicationJson, UppushDeleteAppResponseApplicationJsonBuilder>,
        UppushDeleteAppResponseApplicationJsonInterfaceBuilder {
  _$UppushDeleteAppResponseApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  UppushDeleteAppResponseApplicationJsonBuilder();

  UppushDeleteAppResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushDeleteAppResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushDeleteAppResponseApplicationJson;
  }

  @override
  void update(void Function(UppushDeleteAppResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushDeleteAppResponseApplicationJson build() => _build();

  _$UppushDeleteAppResponseApplicationJson _build() {
    final _$result = _$v ??
        _$UppushDeleteAppResponseApplicationJson._(
            success:
                BuiltValueNullFieldError.checkNotNull(success, r'UppushDeleteAppResponseApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder {
  void replace(UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterface other);
  void update(void Function(UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder) updates);
  int? get version;
  set version(int? version);
}

class _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush
    extends UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush {
  @override
  final int version;

  factory _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush(
          [void Function(UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder)? updates]) =>
      (UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder()..update(updates))._build();

  _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush._({required this.version}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        version, r'UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush', 'version');
  }

  @override
  UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush rebuild(
          void Function(UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder toBuilder() =>
      UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush && version == other.version;
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
    return (newBuiltValueToStringHelper(r'UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush')
          ..add('version', version))
        .toString();
  }
}

class UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder
    implements
        Builder<UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush,
            UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder>,
        UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder {
  _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush? _$v;

  int? _version;
  int? get version => _$this._version;
  set version(covariant int? version) => _$this._version = version;

  UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder();

  UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush;
  }

  @override
  void update(void Function(UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush build() => _build();

  _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush _build() {
    final _$result = _$v ??
        _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush._(
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush', 'version'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushUnifiedpushDiscoveryResponseApplicationJsonInterfaceBuilder {
  void replace(UppushUnifiedpushDiscoveryResponseApplicationJsonInterface other);
  void update(void Function(UppushUnifiedpushDiscoveryResponseApplicationJsonInterfaceBuilder) updates);
  UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder get unifiedpush;
  set unifiedpush(UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder? unifiedpush);
}

class _$UppushUnifiedpushDiscoveryResponseApplicationJson extends UppushUnifiedpushDiscoveryResponseApplicationJson {
  @override
  final UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush unifiedpush;

  factory _$UppushUnifiedpushDiscoveryResponseApplicationJson(
          [void Function(UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder)? updates]) =>
      (UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushUnifiedpushDiscoveryResponseApplicationJson._({required this.unifiedpush}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        unifiedpush, r'UppushUnifiedpushDiscoveryResponseApplicationJson', 'unifiedpush');
  }

  @override
  UppushUnifiedpushDiscoveryResponseApplicationJson rebuild(
          void Function(UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder toBuilder() =>
      UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushUnifiedpushDiscoveryResponseApplicationJson && unifiedpush == other.unifiedpush;
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
    return (newBuiltValueToStringHelper(r'UppushUnifiedpushDiscoveryResponseApplicationJson')
          ..add('unifiedpush', unifiedpush))
        .toString();
  }
}

class UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder
    implements
        Builder<UppushUnifiedpushDiscoveryResponseApplicationJson,
            UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder>,
        UppushUnifiedpushDiscoveryResponseApplicationJsonInterfaceBuilder {
  _$UppushUnifiedpushDiscoveryResponseApplicationJson? _$v;

  UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder? _unifiedpush;
  UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder get unifiedpush =>
      _$this._unifiedpush ??= UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder();
  set unifiedpush(covariant UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder? unifiedpush) =>
      _$this._unifiedpush = unifiedpush;

  UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder();

  UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unifiedpush = $v.unifiedpush.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushUnifiedpushDiscoveryResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushUnifiedpushDiscoveryResponseApplicationJson;
  }

  @override
  void update(void Function(UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushUnifiedpushDiscoveryResponseApplicationJson build() => _build();

  _$UppushUnifiedpushDiscoveryResponseApplicationJson _build() {
    _$UppushUnifiedpushDiscoveryResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UppushUnifiedpushDiscoveryResponseApplicationJson._(unifiedpush: unifiedpush.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unifiedpush';
        unifiedpush.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UppushUnifiedpushDiscoveryResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushPushResponseApplicationJsonInterfaceBuilder {
  void replace(UppushPushResponseApplicationJsonInterface other);
  void update(void Function(UppushPushResponseApplicationJsonInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);
}

class _$UppushPushResponseApplicationJson extends UppushPushResponseApplicationJson {
  @override
  final bool success;

  factory _$UppushPushResponseApplicationJson([void Function(UppushPushResponseApplicationJsonBuilder)? updates]) =>
      (UppushPushResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushPushResponseApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UppushPushResponseApplicationJson', 'success');
  }

  @override
  UppushPushResponseApplicationJson rebuild(void Function(UppushPushResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushPushResponseApplicationJsonBuilder toBuilder() => UppushPushResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushPushResponseApplicationJson && success == other.success;
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
    return (newBuiltValueToStringHelper(r'UppushPushResponseApplicationJson')..add('success', success)).toString();
  }
}

class UppushPushResponseApplicationJsonBuilder
    implements
        Builder<UppushPushResponseApplicationJson, UppushPushResponseApplicationJsonBuilder>,
        UppushPushResponseApplicationJsonInterfaceBuilder {
  _$UppushPushResponseApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  UppushPushResponseApplicationJsonBuilder();

  UppushPushResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushPushResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushPushResponseApplicationJson;
  }

  @override
  void update(void Function(UppushPushResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushPushResponseApplicationJson build() => _build();

  _$UppushPushResponseApplicationJson _build() {
    final _$result = _$v ??
        _$UppushPushResponseApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(success, r'UppushPushResponseApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder {
  void replace(UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterface other);
  void update(void Function(UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder) updates);
  String? get gateway;
  set gateway(String? gateway);
}

class _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush
    extends UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush {
  @override
  final String gateway;

  factory _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush(
          [void Function(UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder)? updates]) =>
      (UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder()..update(updates))._build();

  _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush._({required this.gateway}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        gateway, r'UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush', 'gateway');
  }

  @override
  UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush rebuild(
          void Function(UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder toBuilder() =>
      UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush && gateway == other.gateway;
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
    return (newBuiltValueToStringHelper(r'UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush')
          ..add('gateway', gateway))
        .toString();
  }
}

class UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder
    implements
        Builder<UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush,
            UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder>,
        UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder {
  _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush? _$v;

  String? _gateway;
  String? get gateway => _$this._gateway;
  set gateway(covariant String? gateway) => _$this._gateway = gateway;

  UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder();

  UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gateway = $v.gateway;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush;
  }

  @override
  void update(void Function(UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush build() => _build();

  _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush _build() {
    final _$result = _$v ??
        _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush._(
            gateway: BuiltValueNullFieldError.checkNotNull(
                gateway, r'UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush', 'gateway'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushGatewayMatrixDiscoveryResponseApplicationJsonInterfaceBuilder {
  void replace(UppushGatewayMatrixDiscoveryResponseApplicationJsonInterface other);
  void update(void Function(UppushGatewayMatrixDiscoveryResponseApplicationJsonInterfaceBuilder) updates);
  UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder get unifiedpush;
  set unifiedpush(UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder? unifiedpush);
}

class _$UppushGatewayMatrixDiscoveryResponseApplicationJson
    extends UppushGatewayMatrixDiscoveryResponseApplicationJson {
  @override
  final UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush unifiedpush;

  factory _$UppushGatewayMatrixDiscoveryResponseApplicationJson(
          [void Function(UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder)? updates]) =>
      (UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushGatewayMatrixDiscoveryResponseApplicationJson._({required this.unifiedpush}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        unifiedpush, r'UppushGatewayMatrixDiscoveryResponseApplicationJson', 'unifiedpush');
  }

  @override
  UppushGatewayMatrixDiscoveryResponseApplicationJson rebuild(
          void Function(UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder toBuilder() =>
      UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushGatewayMatrixDiscoveryResponseApplicationJson && unifiedpush == other.unifiedpush;
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
    return (newBuiltValueToStringHelper(r'UppushGatewayMatrixDiscoveryResponseApplicationJson')
          ..add('unifiedpush', unifiedpush))
        .toString();
  }
}

class UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder
    implements
        Builder<UppushGatewayMatrixDiscoveryResponseApplicationJson,
            UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder>,
        UppushGatewayMatrixDiscoveryResponseApplicationJsonInterfaceBuilder {
  _$UppushGatewayMatrixDiscoveryResponseApplicationJson? _$v;

  UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder? _unifiedpush;
  UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder get unifiedpush =>
      _$this._unifiedpush ??= UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder();
  set unifiedpush(covariant UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder? unifiedpush) =>
      _$this._unifiedpush = unifiedpush;

  UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder();

  UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unifiedpush = $v.unifiedpush.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushGatewayMatrixDiscoveryResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushGatewayMatrixDiscoveryResponseApplicationJson;
  }

  @override
  void update(void Function(UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushGatewayMatrixDiscoveryResponseApplicationJson build() => _build();

  _$UppushGatewayMatrixDiscoveryResponseApplicationJson _build() {
    _$UppushGatewayMatrixDiscoveryResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UppushGatewayMatrixDiscoveryResponseApplicationJson._(unifiedpush: unifiedpush.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unifiedpush';
        unifiedpush.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UppushGatewayMatrixDiscoveryResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UppushGatewayMatrixResponseApplicationJsonInterfaceBuilder {
  void replace(UppushGatewayMatrixResponseApplicationJsonInterface other);
  void update(void Function(UppushGatewayMatrixResponseApplicationJsonInterfaceBuilder) updates);
  ListBuilder<String> get rejected;
  set rejected(ListBuilder<String>? rejected);
}

class _$UppushGatewayMatrixResponseApplicationJson extends UppushGatewayMatrixResponseApplicationJson {
  @override
  final BuiltList<String> rejected;

  factory _$UppushGatewayMatrixResponseApplicationJson(
          [void Function(UppushGatewayMatrixResponseApplicationJsonBuilder)? updates]) =>
      (UppushGatewayMatrixResponseApplicationJsonBuilder()..update(updates))._build();

  _$UppushGatewayMatrixResponseApplicationJson._({required this.rejected}) : super._() {
    BuiltValueNullFieldError.checkNotNull(rejected, r'UppushGatewayMatrixResponseApplicationJson', 'rejected');
  }

  @override
  UppushGatewayMatrixResponseApplicationJson rebuild(
          void Function(UppushGatewayMatrixResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UppushGatewayMatrixResponseApplicationJsonBuilder toBuilder() =>
      UppushGatewayMatrixResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UppushGatewayMatrixResponseApplicationJson && rejected == other.rejected;
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
    return (newBuiltValueToStringHelper(r'UppushGatewayMatrixResponseApplicationJson')..add('rejected', rejected))
        .toString();
  }
}

class UppushGatewayMatrixResponseApplicationJsonBuilder
    implements
        Builder<UppushGatewayMatrixResponseApplicationJson, UppushGatewayMatrixResponseApplicationJsonBuilder>,
        UppushGatewayMatrixResponseApplicationJsonInterfaceBuilder {
  _$UppushGatewayMatrixResponseApplicationJson? _$v;

  ListBuilder<String>? _rejected;
  ListBuilder<String> get rejected => _$this._rejected ??= ListBuilder<String>();
  set rejected(covariant ListBuilder<String>? rejected) => _$this._rejected = rejected;

  UppushGatewayMatrixResponseApplicationJsonBuilder();

  UppushGatewayMatrixResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rejected = $v.rejected.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UppushGatewayMatrixResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UppushGatewayMatrixResponseApplicationJson;
  }

  @override
  void update(void Function(UppushGatewayMatrixResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UppushGatewayMatrixResponseApplicationJson build() => _build();

  _$UppushGatewayMatrixResponseApplicationJson _build() {
    _$UppushGatewayMatrixResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UppushGatewayMatrixResponseApplicationJson._(rejected: rejected.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rejected';
        rejected.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UppushGatewayMatrixResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
