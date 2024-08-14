import 'package:account_repository/src/models/models.dart';
import 'package:built_value/built_value.dart';
import 'package:nextcloud/nextcloud.dart';

part 'account.g.dart';

/// Account data.
abstract class Account implements Built<Account, AccountBuilder> {
  /// Creates a new Account.
  factory Account([void Function(AccountBuilder)? updates]) = _$Account;
  const Account._();

  /// The login and server credentials of the account.
  Credentials get credentials;

  /// Url of the server.
  Uri get serverURL => credentials.serverURL;

  /// The user id.
  String get username => credentials.username;

  /// App password.
  String? get password => credentials.password;

  /// The unique ID of the account.
  ///
  /// Implemented in a primitive way hashing the [username] and [serverURL].
  String get id => credentials.id;

  /// A human readable representation of [username] and [serverURL].
  String get humanReadableID => credentials.humanReadableID;

  /// An authenticated API client.
  @BuiltValueField(compare: false, serialize: false)
  NextcloudClient get client;
}
