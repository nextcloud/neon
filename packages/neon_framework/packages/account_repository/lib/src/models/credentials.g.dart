// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Credentials> _$credentialsSerializer = _$CredentialsSerializer();

class _$CredentialsSerializer implements StructuredSerializer<Credentials> {
  @override
  final Iterable<Type> types = const [Credentials, _$Credentials];
  @override
  final String wireName = 'Credentials';

  @override
  Iterable<Object?> serialize(Serializers serializers, Credentials object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'serverURL',
      serializers.serialize(object.serverURL, specifiedType: const FullType(Uri)),
      'username',
      serializers.serialize(object.username, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.appPassword;
    if (value != null) {
      result
        ..add('appPassword')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Credentials deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CredentialsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'serverURL':
          result.serverURL = serializers.deserialize(value, specifiedType: const FullType(Uri))! as Uri;
          break;
        case 'username':
          result.username = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'appPassword':
          result.appPassword = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Credentials extends Credentials {
  @override
  final Uri serverURL;
  @override
  final String username;
  @override
  final String? appPassword;
  String? __id;
  String? __humanReadableID;

  factory _$Credentials([void Function(CredentialsBuilder)? updates]) =>
      (CredentialsBuilder()..update(updates))._build();

  _$Credentials._({required this.serverURL, required this.username, this.appPassword}) : super._() {
    BuiltValueNullFieldError.checkNotNull(serverURL, r'Credentials', 'serverURL');
    BuiltValueNullFieldError.checkNotNull(username, r'Credentials', 'username');
  }

  @override
  String get id => __id ??= super.id;

  @override
  String get humanReadableID => __humanReadableID ??= super.humanReadableID;

  @override
  Credentials rebuild(void Function(CredentialsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CredentialsBuilder toBuilder() => CredentialsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Credentials &&
        serverURL == other.serverURL &&
        username == other.username &&
        appPassword == other.appPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serverURL.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, appPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Credentials')
          ..add('serverURL', serverURL)
          ..add('username', username)
          ..add('appPassword', appPassword))
        .toString();
  }
}

class CredentialsBuilder implements Builder<Credentials, CredentialsBuilder> {
  _$Credentials? _$v;

  Uri? _serverURL;
  Uri? get serverURL => _$this._serverURL;
  set serverURL(Uri? serverURL) => _$this._serverURL = serverURL;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _appPassword;
  String? get appPassword => _$this._appPassword;
  set appPassword(String? appPassword) => _$this._appPassword = appPassword;

  CredentialsBuilder();

  CredentialsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serverURL = $v.serverURL;
      _username = $v.username;
      _appPassword = $v.appPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Credentials other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Credentials;
  }

  @override
  void update(void Function(CredentialsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Credentials build() => _build();

  _$Credentials _build() {
    final _$result = _$v ??
        _$Credentials._(
            serverURL: BuiltValueNullFieldError.checkNotNull(serverURL, r'Credentials', 'serverURL'),
            username: BuiltValueNullFieldError.checkNotNull(username, r'Credentials', 'username'),
            appPassword: appPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
