// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$_serializers = (Serializers().toBuilder()..add(Account.serializer)).build();
Serializer<Account> _$accountSerializer = _$AccountSerializer();

class _$AccountSerializer implements StructuredSerializer<Account> {
  @override
  final Iterable<Type> types = const [Account, _$Account];
  @override
  final String wireName = 'Account';

  @override
  Iterable<Object?> serialize(Serializers serializers, Account object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'serverURL',
      serializers.serialize(object.serverURL, specifiedType: const FullType(Uri)),
      'username',
      serializers.serialize(object.username, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.userAgent;
    if (value != null) {
      result
        ..add('userAgent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Account deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AccountBuilder();

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
        case 'password':
          result.password = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'userAgent':
          result.userAgent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Account extends Account {
  @override
  final Uri serverURL;
  @override
  final String username;
  @override
  final String? password;
  @override
  final String? userAgent;
  @override
  final Client? httpClient;
  NextcloudClient? __client;
  String? __id;
  String? __humanReadableID;

  factory _$Account([void Function(AccountBuilder)? updates]) => (AccountBuilder()..update(updates))._build();

  _$Account._({required this.serverURL, required this.username, this.password, this.userAgent, this.httpClient})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(serverURL, r'Account', 'serverURL');
    BuiltValueNullFieldError.checkNotNull(username, r'Account', 'username');
  }

  @override
  NextcloudClient get client => __client ??= super.client;

  @override
  String get id => __id ??= super.id;

  @override
  String get humanReadableID => __humanReadableID ??= super.humanReadableID;

  @override
  Account rebuild(void Function(AccountBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AccountBuilder toBuilder() => AccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Account &&
        serverURL == other.serverURL &&
        username == other.username &&
        password == other.password &&
        userAgent == other.userAgent &&
        httpClient == other.httpClient;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serverURL.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, userAgent.hashCode);
    _$hash = $jc(_$hash, httpClient.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Account')
          ..add('serverURL', serverURL)
          ..add('username', username)
          ..add('password', password)
          ..add('userAgent', userAgent)
          ..add('httpClient', httpClient))
        .toString();
  }
}

class AccountBuilder implements Builder<Account, AccountBuilder> {
  _$Account? _$v;

  Uri? _serverURL;
  Uri? get serverURL => _$this._serverURL;
  set serverURL(Uri? serverURL) => _$this._serverURL = serverURL;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _userAgent;
  String? get userAgent => _$this._userAgent;
  set userAgent(String? userAgent) => _$this._userAgent = userAgent;

  Client? _httpClient;
  Client? get httpClient => _$this._httpClient;
  set httpClient(Client? httpClient) => _$this._httpClient = httpClient;

  AccountBuilder();

  AccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serverURL = $v.serverURL;
      _username = $v.username;
      _password = $v.password;
      _userAgent = $v.userAgent;
      _httpClient = $v.httpClient;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Account other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Account;
  }

  @override
  void update(void Function(AccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Account build() => _build();

  _$Account _build() {
    final _$result = _$v ??
        _$Account._(
            serverURL: BuiltValueNullFieldError.checkNotNull(serverURL, r'Account', 'serverURL'),
            username: BuiltValueNullFieldError.checkNotNull(username, r'Account', 'username'),
            password: password,
            userAgent: userAgent,
            httpClient: httpClient);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
