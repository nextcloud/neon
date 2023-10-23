// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';

part 'sharebymail.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Sharebymail_UploadFilesDropInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        Capabilities_FilesSharing_Sharebymail_UploadFilesDropInterface,
        Built<Capabilities_FilesSharing_Sharebymail_UploadFilesDrop,
            Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  factory Capabilities_FilesSharing_Sharebymail_UploadFilesDrop([
    final void Function(Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Sharebymail_UploadFilesDrop;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Sharebymail_UploadFilesDrop._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      _$capabilitiesFilesSharingSharebymailUploadFilesDropSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Sharebymail_PasswordInterface {
  bool get enabled;
  bool get enforced;
}

abstract class Capabilities_FilesSharing_Sharebymail_Password
    implements
        Capabilities_FilesSharing_Sharebymail_PasswordInterface,
        Built<Capabilities_FilesSharing_Sharebymail_Password, Capabilities_FilesSharing_Sharebymail_PasswordBuilder> {
  factory Capabilities_FilesSharing_Sharebymail_Password([
    final void Function(Capabilities_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Sharebymail_Password;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Sharebymail_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Sharebymail_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Sharebymail_Password> get serializer =>
      _$capabilitiesFilesSharingSharebymailPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Sharebymail_ExpireDateInterface {
  bool get enabled;
  bool get enforced;
}

abstract class Capabilities_FilesSharing_Sharebymail_ExpireDate
    implements
        Capabilities_FilesSharing_Sharebymail_ExpireDateInterface,
        Built<Capabilities_FilesSharing_Sharebymail_ExpireDate,
            Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory Capabilities_FilesSharing_Sharebymail_ExpireDate([
    final void Function(Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Sharebymail_ExpireDate;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Sharebymail_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      _$capabilitiesFilesSharingSharebymailExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_SharebymailInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  Capabilities_FilesSharing_Sharebymail_UploadFilesDrop get uploadFilesDrop;
  Capabilities_FilesSharing_Sharebymail_Password get password;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities_FilesSharing_Sharebymail_ExpireDate get expireDate;
}

abstract class Capabilities_FilesSharing_Sharebymail
    implements
        Capabilities_FilesSharing_SharebymailInterface,
        Built<Capabilities_FilesSharing_Sharebymail, Capabilities_FilesSharing_SharebymailBuilder> {
  factory Capabilities_FilesSharing_Sharebymail([
    final void Function(Capabilities_FilesSharing_SharebymailBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Sharebymail;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Sharebymail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Sharebymail.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Sharebymail> get serializer =>
      _$capabilitiesFilesSharingSharebymailSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharingInterface {
  Capabilities_FilesSharing_Sharebymail get sharebymail;
}

abstract class Capabilities_FilesSharing
    implements Capabilities_FilesSharingInterface, Built<Capabilities_FilesSharing, Capabilities_FilesSharingBuilder> {
  factory Capabilities_FilesSharing([final void Function(Capabilities_FilesSharingBuilder)? b]) =
      _$Capabilities_FilesSharing;

  // coverage:ignore-start
  const Capabilities_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing> get serializer => _$capabilitiesFilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  @BuiltValueField(wireName: 'files_sharing')
  Capabilities_FilesSharing get filesSharing;
}

abstract class Capabilities implements CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([final void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing), Capabilities_FilesSharing.new)
      ..add(Capabilities_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Sharebymail),
        Capabilities_FilesSharing_Sharebymail.new,
      )
      ..add(Capabilities_FilesSharing_Sharebymail.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Sharebymail_UploadFilesDrop),
        Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.new,
      )
      ..add(Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Sharebymail_Password),
        Capabilities_FilesSharing_Sharebymail_Password.new,
      )
      ..add(Capabilities_FilesSharing_Sharebymail_Password.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Sharebymail_ExpireDate),
        Capabilities_FilesSharing_Sharebymail_ExpireDate.new,
      )
      ..add(Capabilities_FilesSharing_Sharebymail_ExpireDate.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
