// coverage:ignore-file

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:crypto/crypto.dart';
import 'package:crypton/crypton.dart';

part 'notifications.g.dart';

/// Generates the push token hash which is just sha512
String generatePushTokenHash(String pushToken) => sha512.convert(utf8.encode(pushToken)).toString();

/// Decrypted version of the encrypted push notification received from the server.
abstract class DecryptedSubject implements Built<DecryptedSubject, DecryptedSubjectBuilder> {
  // ignore: public_member_api_docs
  factory DecryptedSubject([void Function(DecryptedSubjectBuilder)? updates]) = _$DecryptedSubject;

  const DecryptedSubject._();

  /// Decrypts the subject of a push notification
  factory DecryptedSubject.fromEncrypted(RSAPrivateKey privateKey, String subject) => DecryptedSubject.fromJson(
        json.decode(privateKey.decrypt(subject)) as Map<String, dynamic>,
      );

  // ignore: public_member_api_docs
  factory DecryptedSubject.fromJson(Map<String, dynamic> json) => _serializers.deserializeWith(serializer, json)!;

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() => _serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  // ignore: public_member_api_docs
  static Serializer<DecryptedSubject> get serializer => _$decryptedSubjectSerializer;

  /// ID if the notification
  int? get nid;

  /// App that sent the notification
  String? get app;

  /// Subject of the notification
  String? get subject;

  /// Type of the notification
  String? get type;

  /// ID of the notification
  String? get id;

  /// Delete the notification
  bool? get delete;

  /// Delete all notifications
  @BuiltValueField(wireName: 'delete-all')
  bool? get deleteAll;
}

@SerializersFor([DecryptedSubject])
final Serializers _serializers = (_$_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
