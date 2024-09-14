// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_presets_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetPresetsResponse> _$getPresetsResponseSerializer =
    new _$GetPresetsResponseSerializer();

class _$GetPresetsResponseSerializer
    implements StructuredSerializer<GetPresetsResponse> {
  @override
  final Iterable<Type> types = const [GetPresetsResponse, _$GetPresetsResponse];
  @override
  final String wireName = 'GetPresetsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetPresetsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'presets',
      serializers.serialize(object.presets,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(Version)])),
    ];

    return result;
  }

  @override
  GetPresetsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetPresetsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'presets':
          result.presets.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(Version)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetPresetsResponse extends GetPresetsResponse {
  @override
  final BuiltSet<Version> presets;

  factory _$GetPresetsResponse(
          [void Function(GetPresetsResponseBuilder)? updates]) =>
      (new GetPresetsResponseBuilder()..update(updates))._build();

  _$GetPresetsResponse._({required this.presets}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        presets, r'GetPresetsResponse', 'presets');
  }

  @override
  GetPresetsResponse rebuild(
          void Function(GetPresetsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetPresetsResponseBuilder toBuilder() =>
      new GetPresetsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetPresetsResponse && presets == other.presets;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, presets.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetPresetsResponse')
          ..add('presets', presets))
        .toString();
  }
}

class GetPresetsResponseBuilder
    implements Builder<GetPresetsResponse, GetPresetsResponseBuilder> {
  _$GetPresetsResponse? _$v;

  SetBuilder<Version>? _presets;
  SetBuilder<Version> get presets =>
      _$this._presets ??= new SetBuilder<Version>();
  set presets(SetBuilder<Version>? presets) => _$this._presets = presets;

  GetPresetsResponseBuilder();

  GetPresetsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _presets = $v.presets.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetPresetsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetPresetsResponse;
  }

  @override
  void update(void Function(GetPresetsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetPresetsResponse build() => _build();

  _$GetPresetsResponse _build() {
    _$GetPresetsResponse _$result;
    try {
      _$result = _$v ?? new _$GetPresetsResponse._(presets: presets.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'presets';
        presets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetPresetsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
