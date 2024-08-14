// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Account extends Account {
  @override
  final Credentials credentials;
  @override
  final NextcloudClient client;

  factory _$Account([void Function(AccountBuilder)? updates]) => (AccountBuilder()..update(updates))._build();

  _$Account._({required this.credentials, required this.client}) : super._() {
    BuiltValueNullFieldError.checkNotNull(credentials, r'Account', 'credentials');
    BuiltValueNullFieldError.checkNotNull(client, r'Account', 'client');
  }

  @override
  Account rebuild(void Function(AccountBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AccountBuilder toBuilder() => AccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Account && credentials == other.credentials;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, credentials.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Account')
          ..add('credentials', credentials)
          ..add('client', client))
        .toString();
  }
}

class AccountBuilder implements Builder<Account, AccountBuilder> {
  _$Account? _$v;

  CredentialsBuilder? _credentials;
  CredentialsBuilder get credentials => _$this._credentials ??= CredentialsBuilder();
  set credentials(CredentialsBuilder? credentials) => _$this._credentials = credentials;

  NextcloudClient? _client;
  NextcloudClient? get client => _$this._client;
  set client(NextcloudClient? client) => _$this._client = client;

  AccountBuilder();

  AccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _credentials = $v.credentials.toBuilder();
      _client = $v.client;
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
    _$Account _$result;
    try {
      _$result = _$v ??
          _$Account._(
              credentials: credentials.build(),
              client: BuiltValueNullFieldError.checkNotNull(client, r'Account', 'client'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'credentials';
        credentials.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Account', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
