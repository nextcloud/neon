// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SetupResponse> _$setupResponseSerializer =
    new _$SetupResponseSerializer();

class _$SetupResponseSerializer implements StructuredSerializer<SetupResponse> {
  @override
  final Iterable<Type> types = const [SetupResponse, _$SetupResponse];
  @override
  final String wireName = 'SetupResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, SetupResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hostURL',
      serializers.serialize(object.hostURL, specifiedType: const FullType(Uri)),
      'targetURL',
      serializers.serialize(object.targetURL,
          specifiedType: const FullType(Uri)),
    ];

    return result;
  }

  @override
  SetupResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SetupResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hostURL':
          result.hostURL = serializers.deserialize(value,
              specifiedType: const FullType(Uri))! as Uri;
          break;
        case 'targetURL':
          result.targetURL = serializers.deserialize(value,
              specifiedType: const FullType(Uri))! as Uri;
          break;
      }
    }

    return result.build();
  }
}

class _$SetupResponse extends SetupResponse {
  @override
  final Uri hostURL;
  @override
  final Uri targetURL;

  factory _$SetupResponse([void Function(SetupResponseBuilder)? updates]) =>
      (new SetupResponseBuilder()..update(updates))._build();

  _$SetupResponse._({required this.hostURL, required this.targetURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(hostURL, r'SetupResponse', 'hostURL');
    BuiltValueNullFieldError.checkNotNull(
        targetURL, r'SetupResponse', 'targetURL');
  }

  @override
  SetupResponse rebuild(void Function(SetupResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetupResponseBuilder toBuilder() => new SetupResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetupResponse &&
        hostURL == other.hostURL &&
        targetURL == other.targetURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hostURL.hashCode);
    _$hash = $jc(_$hash, targetURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetupResponse')
          ..add('hostURL', hostURL)
          ..add('targetURL', targetURL))
        .toString();
  }
}

class SetupResponseBuilder
    implements Builder<SetupResponse, SetupResponseBuilder> {
  _$SetupResponse? _$v;

  Uri? _hostURL;
  Uri? get hostURL => _$this._hostURL;
  set hostURL(Uri? hostURL) => _$this._hostURL = hostURL;

  Uri? _targetURL;
  Uri? get targetURL => _$this._targetURL;
  set targetURL(Uri? targetURL) => _$this._targetURL = targetURL;

  SetupResponseBuilder();

  SetupResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hostURL = $v.hostURL;
      _targetURL = $v.targetURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetupResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetupResponse;
  }

  @override
  void update(void Function(SetupResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetupResponse build() => _build();

  _$SetupResponse _build() {
    final _$result = _$v ??
        new _$SetupResponse._(
            hostURL: BuiltValueNullFieldError.checkNotNull(
                hostURL, r'SetupResponse', 'hostURL'),
            targetURL: BuiltValueNullFieldError.checkNotNull(
                targetURL, r'SetupResponse', 'targetURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
