// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'systemtags.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Capabilities_Systemtags_Enabled _$capabilitiesSystemtagsEnabled$true =
    Capabilities_Systemtags_Enabled._('\$true');

Capabilities_Systemtags_Enabled _$valueOfCapabilities_Systemtags_Enabled(String name) {
  switch (name) {
    case '\$true':
      return _$capabilitiesSystemtagsEnabled$true;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<Capabilities_Systemtags_Enabled> _$capabilitiesSystemtagsEnabledValues =
    BuiltSet<Capabilities_Systemtags_Enabled>(const <Capabilities_Systemtags_Enabled>[
  _$capabilitiesSystemtagsEnabled$true,
]);

Serializer<Capabilities_Systemtags> _$capabilitiesSystemtagsSerializer = _$Capabilities_SystemtagsSerializer();
Serializer<Capabilities> _$capabilitiesSerializer = _$CapabilitiesSerializer();

class _$Capabilities_SystemtagsSerializer implements StructuredSerializer<Capabilities_Systemtags> {
  @override
  final Iterable<Type> types = const [Capabilities_Systemtags, _$Capabilities_Systemtags];
  @override
  final String wireName = 'Capabilities_Systemtags';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities_Systemtags object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(Capabilities_Systemtags_Enabled)),
    ];

    return result;
  }

  @override
  Capabilities_Systemtags deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Capabilities_SystemtagsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(Capabilities_Systemtags_Enabled))! as Capabilities_Systemtags_Enabled;
          break;
      }
    }

    return result.build();
  }
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  @override
  final Iterable<Type> types = const [Capabilities, _$Capabilities];
  @override
  final String wireName = 'Capabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'systemtags',
      serializers.serialize(object.systemtags, specifiedType: const FullType(Capabilities_Systemtags)),
    ];

    return result;
  }

  @override
  Capabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'systemtags':
          result.systemtags.replace(serializers.deserialize(value,
              specifiedType: const FullType(Capabilities_Systemtags))! as Capabilities_Systemtags);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $Capabilities_SystemtagsInterfaceBuilder {
  void replace($Capabilities_SystemtagsInterface other);
  void update(void Function($Capabilities_SystemtagsInterfaceBuilder) updates);
  Capabilities_Systemtags_Enabled? get enabled;
  set enabled(Capabilities_Systemtags_Enabled? enabled);
}

class _$Capabilities_Systemtags extends Capabilities_Systemtags {
  @override
  final Capabilities_Systemtags_Enabled enabled;

  factory _$Capabilities_Systemtags([void Function(Capabilities_SystemtagsBuilder)? updates]) =>
      (Capabilities_SystemtagsBuilder()..update(updates))._build();

  _$Capabilities_Systemtags._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_Systemtags', 'enabled');
  }

  @override
  Capabilities_Systemtags rebuild(void Function(Capabilities_SystemtagsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_SystemtagsBuilder toBuilder() => Capabilities_SystemtagsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_Systemtags && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_Systemtags')..add('enabled', enabled)).toString();
  }
}

class Capabilities_SystemtagsBuilder
    implements
        Builder<Capabilities_Systemtags, Capabilities_SystemtagsBuilder>,
        $Capabilities_SystemtagsInterfaceBuilder {
  _$Capabilities_Systemtags? _$v;

  Capabilities_Systemtags_Enabled? _enabled;
  Capabilities_Systemtags_Enabled? get enabled => _$this._enabled;
  set enabled(covariant Capabilities_Systemtags_Enabled? enabled) => _$this._enabled = enabled;

  Capabilities_SystemtagsBuilder();

  Capabilities_SystemtagsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_Systemtags other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_Systemtags;
  }

  @override
  void update(void Function(Capabilities_SystemtagsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_Systemtags build() => _build();

  _$Capabilities_Systemtags _build() {
    final _$result = _$v ??
        _$Capabilities_Systemtags._(
            enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_Systemtags', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $CapabilitiesInterfaceBuilder {
  void replace($CapabilitiesInterface other);
  void update(void Function($CapabilitiesInterfaceBuilder) updates);
  Capabilities_SystemtagsBuilder get systemtags;
  set systemtags(Capabilities_SystemtagsBuilder? systemtags);
}

class _$Capabilities extends Capabilities {
  @override
  final Capabilities_Systemtags systemtags;

  factory _$Capabilities([void Function(CapabilitiesBuilder)? updates]) =>
      (CapabilitiesBuilder()..update(updates))._build();

  _$Capabilities._({required this.systemtags}) : super._() {
    BuiltValueNullFieldError.checkNotNull(systemtags, r'Capabilities', 'systemtags');
  }

  @override
  Capabilities rebuild(void Function(CapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CapabilitiesBuilder toBuilder() => CapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities && systemtags == other.systemtags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, systemtags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities')..add('systemtags', systemtags)).toString();
  }
}

class CapabilitiesBuilder implements Builder<Capabilities, CapabilitiesBuilder>, $CapabilitiesInterfaceBuilder {
  _$Capabilities? _$v;

  Capabilities_SystemtagsBuilder? _systemtags;
  Capabilities_SystemtagsBuilder get systemtags => _$this._systemtags ??= Capabilities_SystemtagsBuilder();
  set systemtags(covariant Capabilities_SystemtagsBuilder? systemtags) => _$this._systemtags = systemtags;

  CapabilitiesBuilder();

  CapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _systemtags = $v.systemtags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities;
  }

  @override
  void update(void Function(CapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities build() => _build();

  _$Capabilities _build() {
    _$Capabilities _$result;
    try {
      _$result = _$v ?? _$Capabilities._(systemtags: systemtags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'systemtags';
        systemtags.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Capabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
