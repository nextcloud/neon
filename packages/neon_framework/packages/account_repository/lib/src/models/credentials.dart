import 'dart:convert';

import 'package:account_repository/src/models/models.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crypto/crypto.dart';

part 'credentials.g.dart';

/// Credentials interface.
abstract class Credentials implements Built<Credentials, CredentialsBuilder> {
  /// Creates new credentials.
  factory Credentials([void Function(CredentialsBuilder) updates]) = _$Credentials;
  Credentials._();

  /// Deserializes the given `Map<String, dynamic>` into a [Credentials].
  factory Credentials.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Credentials.serializer, json)!;
  }

  /// Converts this [Credentials] into a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Credentials.serializer, this)! as Map<String, dynamic>;
  }

  /// The serializer that serializes this value.
  static Serializer<Credentials> get serializer => _$credentialsSerializer;

  /// Url of the server.
  Uri get serverURL;

  /// The user id.
  String get username;

  /// App password.
  String? get appPassword;

  /// The unique ID of the account.
  ///
  /// Implemented in a primitive way hashing the [username] and [serverURL].
  @memoized
  String get id => sha1.convert(utf8.encode('$username@$serverURL')).toString();

  /// A human readable representation of [username] and [serverURL].
  @memoized
  String get humanReadableID {
    // Maybe also show path if it is not '/' ?
    final buffer = StringBuffer()
      ..write(username)
      ..write('@')
      ..write(serverURL.host);

    if (serverURL.hasPort) {
      buffer
        ..write(':')
        ..write(serverURL.port);
    }

    return buffer.toString();
  }
}
