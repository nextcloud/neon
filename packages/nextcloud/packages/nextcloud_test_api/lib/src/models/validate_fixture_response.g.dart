// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_fixture_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ValidateFixtureResponse> _$validateFixtureResponseSerializer =
    new _$ValidateFixtureResponseSerializer();

class _$ValidateFixtureResponseSerializer
    implements StructuredSerializer<ValidateFixtureResponse> {
  @override
  final Iterable<Type> types = const [
    ValidateFixtureResponse,
    _$ValidateFixtureResponse
  ];
  @override
  final String wireName = 'ValidateFixtureResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ValidateFixtureResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.fixture;
    if (value != null) {
      result
        ..add('fixture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ValidateFixtureResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValidateFixtureResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fixture':
          result.fixture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ValidateFixtureResponse extends ValidateFixtureResponse {
  @override
  final String? fixture;

  factory _$ValidateFixtureResponse(
          [void Function(ValidateFixtureResponseBuilder)? updates]) =>
      (new ValidateFixtureResponseBuilder()..update(updates))._build();

  _$ValidateFixtureResponse._({this.fixture}) : super._();

  @override
  ValidateFixtureResponse rebuild(
          void Function(ValidateFixtureResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValidateFixtureResponseBuilder toBuilder() =>
      new ValidateFixtureResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValidateFixtureResponse && fixture == other.fixture;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fixture.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValidateFixtureResponse')
          ..add('fixture', fixture))
        .toString();
  }
}

class ValidateFixtureResponseBuilder
    implements
        Builder<ValidateFixtureResponse, ValidateFixtureResponseBuilder> {
  _$ValidateFixtureResponse? _$v;

  String? _fixture;
  String? get fixture => _$this._fixture;
  set fixture(String? fixture) => _$this._fixture = fixture;

  ValidateFixtureResponseBuilder();

  ValidateFixtureResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fixture = $v.fixture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidateFixtureResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValidateFixtureResponse;
  }

  @override
  void update(void Function(ValidateFixtureResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValidateFixtureResponse build() => _build();

  _$ValidateFixtureResponse _build() {
    final _$result = _$v ?? new _$ValidateFixtureResponse._(fixture: fixture);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
