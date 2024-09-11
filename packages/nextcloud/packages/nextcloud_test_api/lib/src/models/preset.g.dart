// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Preset> _$presetSerializer = new _$PresetSerializer();

class _$PresetSerializer implements StructuredSerializer<Preset> {
  @override
  final Iterable<Type> types = const [Preset, _$Preset];
  @override
  final String wireName = 'Preset';

  @override
  Iterable<Object?> serialize(Serializers serializers, Preset object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'groupName',
      serializers.serialize(object.groupName,
          specifiedType: const FullType(String)),
      'appName',
      serializers.serialize(object.appName,
          specifiedType: const FullType(String)),
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(Version)),
    ];
    Object? value;
    value = object.platform;
    if (value != null) {
      result
        ..add('platform')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Preset deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PresetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'groupName':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'appName':
          result.appName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(Version))! as Version;
          break;
        case 'platform':
          result.platform = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Preset extends Preset {
  @override
  final String groupName;
  @override
  final String appName;
  @override
  final Version version;
  @override
  final String? platform;
  String? __imageTag;

  factory _$Preset([void Function(PresetBuilder)? updates]) =>
      (new PresetBuilder()..update(updates))._build();

  _$Preset._(
      {required this.groupName,
      required this.appName,
      required this.version,
      this.platform})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(groupName, r'Preset', 'groupName');
    BuiltValueNullFieldError.checkNotNull(appName, r'Preset', 'appName');
    BuiltValueNullFieldError.checkNotNull(version, r'Preset', 'version');
  }

  @override
  String get imageTag => __imageTag ??= super.imageTag;

  @override
  Preset rebuild(void Function(PresetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PresetBuilder toBuilder() => new PresetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Preset &&
        groupName == other.groupName &&
        appName == other.appName &&
        version == other.version &&
        platform == other.platform;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, groupName.hashCode);
    _$hash = $jc(_$hash, appName.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Preset')
          ..add('groupName', groupName)
          ..add('appName', appName)
          ..add('version', version)
          ..add('platform', platform))
        .toString();
  }
}

class PresetBuilder implements Builder<Preset, PresetBuilder> {
  _$Preset? _$v;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  String? _appName;
  String? get appName => _$this._appName;
  set appName(String? appName) => _$this._appName = appName;

  Version? _version;
  Version? get version => _$this._version;
  set version(Version? version) => _$this._version = version;

  String? _platform;
  String? get platform => _$this._platform;
  set platform(String? platform) => _$this._platform = platform;

  PresetBuilder();

  PresetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupName = $v.groupName;
      _appName = $v.appName;
      _version = $v.version;
      _platform = $v.platform;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Preset other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Preset;
  }

  @override
  void update(void Function(PresetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Preset build() => _build();

  _$Preset _build() {
    final _$result = _$v ??
        new _$Preset._(
            groupName: BuiltValueNullFieldError.checkNotNull(
                groupName, r'Preset', 'groupName'),
            appName: BuiltValueNullFieldError.checkNotNull(
                appName, r'Preset', 'appName'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'Preset', 'version'),
            platform: platform);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
