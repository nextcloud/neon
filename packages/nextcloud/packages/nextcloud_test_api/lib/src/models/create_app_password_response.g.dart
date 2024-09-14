// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_app_password_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateAppPasswordResponse> _$createAppPasswordResponseSerializer =
    new _$CreateAppPasswordResponseSerializer();

class _$CreateAppPasswordResponseSerializer
    implements StructuredSerializer<CreateAppPasswordResponse> {
  @override
  final Iterable<Type> types = const [
    CreateAppPasswordResponse,
    _$CreateAppPasswordResponse
  ];
  @override
  final String wireName = 'CreateAppPasswordResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreateAppPasswordResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'appPassword',
      serializers.serialize(object.appPassword,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CreateAppPasswordResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreateAppPasswordResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'appPassword':
          result.appPassword = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CreateAppPasswordResponse extends CreateAppPasswordResponse {
  @override
  final String appPassword;

  factory _$CreateAppPasswordResponse(
          [void Function(CreateAppPasswordResponseBuilder)? updates]) =>
      (new CreateAppPasswordResponseBuilder()..update(updates))._build();

  _$CreateAppPasswordResponse._({required this.appPassword}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        appPassword, r'CreateAppPasswordResponse', 'appPassword');
  }

  @override
  CreateAppPasswordResponse rebuild(
          void Function(CreateAppPasswordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAppPasswordResponseBuilder toBuilder() =>
      new CreateAppPasswordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAppPasswordResponse &&
        appPassword == other.appPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAppPasswordResponse')
          ..add('appPassword', appPassword))
        .toString();
  }
}

class CreateAppPasswordResponseBuilder
    implements
        Builder<CreateAppPasswordResponse, CreateAppPasswordResponseBuilder> {
  _$CreateAppPasswordResponse? _$v;

  String? _appPassword;
  String? get appPassword => _$this._appPassword;
  set appPassword(String? appPassword) => _$this._appPassword = appPassword;

  CreateAppPasswordResponseBuilder();

  CreateAppPasswordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appPassword = $v.appPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAppPasswordResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAppPasswordResponse;
  }

  @override
  void update(void Function(CreateAppPasswordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAppPasswordResponse build() => _build();

  _$CreateAppPasswordResponse _build() {
    final _$result = _$v ??
        new _$CreateAppPasswordResponse._(
            appPassword: BuiltValueNullFieldError.checkNotNull(
                appPassword, r'CreateAppPasswordResponse', 'appPassword'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
