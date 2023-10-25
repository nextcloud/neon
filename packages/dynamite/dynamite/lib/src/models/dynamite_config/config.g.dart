// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$_serializers = (Serializers().toBuilder()
      ..add(DynamiteConfig.serializer)
      ..addBuilderFactory(const FullType(BuiltSet, [FullType(String)]), () => SetBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltSet, [FullType(String)]), () => SetBuilder<String>()))
    .build();
Serializer<DynamiteConfig> _$dynamiteConfigSerializer = _$DynamiteConfigSerializer();

class _$DynamiteConfigSerializer implements StructuredSerializer<DynamiteConfig> {
  @override
  final Iterable<Type> types = const [DynamiteConfig, _$DynamiteConfig];
  @override
  final String wireName = 'DynamiteConfig';

  @override
  Iterable<Object?> serialize(Serializers serializers, DynamiteConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.analyzerIgnores;
    if (value != null) {
      result
        ..add('analyzer_ignores')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltSet, [FullType(String)])));
    }
    value = object.coverageIgnores;
    if (value != null) {
      result
        ..add('coverage_ignores')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltSet, [FullType(String)])));
    }
    return result;
  }

  @override
  DynamiteConfig deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DynamiteConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'analyzer_ignores':
          result.analyzerIgnores.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSet, [FullType(String)]))! as BuiltSet<Object?>);
          break;
        case 'coverage_ignores':
          result.coverageIgnores.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSet, [FullType(String)]))! as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DynamiteConfig extends DynamiteConfig {
  @override
  final BuiltSet<String>? analyzerIgnores;
  @override
  final BuiltSet<String>? coverageIgnores;

  factory _$DynamiteConfig([void Function(DynamiteConfigBuilder)? updates]) =>
      (DynamiteConfigBuilder()..update(updates))._build();

  _$DynamiteConfig._({this.analyzerIgnores, this.coverageIgnores}) : super._();

  @override
  DynamiteConfig rebuild(void Function(DynamiteConfigBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  DynamiteConfigBuilder toBuilder() => DynamiteConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DynamiteConfig &&
        analyzerIgnores == other.analyzerIgnores &&
        coverageIgnores == other.coverageIgnores;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, analyzerIgnores.hashCode);
    _$hash = $jc(_$hash, coverageIgnores.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DynamiteConfig')
          ..add('analyzerIgnores', analyzerIgnores)
          ..add('coverageIgnores', coverageIgnores))
        .toString();
  }
}

class DynamiteConfigBuilder implements Builder<DynamiteConfig, DynamiteConfigBuilder> {
  _$DynamiteConfig? _$v;

  SetBuilder<String>? _analyzerIgnores;
  SetBuilder<String> get analyzerIgnores => _$this._analyzerIgnores ??= SetBuilder<String>();
  set analyzerIgnores(SetBuilder<String>? analyzerIgnores) => _$this._analyzerIgnores = analyzerIgnores;

  SetBuilder<String>? _coverageIgnores;
  SetBuilder<String> get coverageIgnores => _$this._coverageIgnores ??= SetBuilder<String>();
  set coverageIgnores(SetBuilder<String>? coverageIgnores) => _$this._coverageIgnores = coverageIgnores;

  DynamiteConfigBuilder();

  DynamiteConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _analyzerIgnores = $v.analyzerIgnores?.toBuilder();
      _coverageIgnores = $v.coverageIgnores?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DynamiteConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DynamiteConfig;
  }

  @override
  void update(void Function(DynamiteConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DynamiteConfig build() => _build();

  _$DynamiteConfig _build() {
    _$DynamiteConfig _$result;
    try {
      _$result = _$v ??
          _$DynamiteConfig._(analyzerIgnores: _analyzerIgnores?.build(), coverageIgnores: _coverageIgnores?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'analyzerIgnores';
        _analyzerIgnores?.build();
        _$failedField = 'coverageIgnores';
        _coverageIgnores?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DynamiteConfig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
