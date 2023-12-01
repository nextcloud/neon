// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;

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
abstract interface class $Capabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface {
  bool get enabled;
}

abstract class Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        $Capabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface,
        Built<Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
            Capabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  factory Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop([
    final void Function(Capabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder)? b,
  ]) = _$Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop;

  // coverage:ignore-start
  const Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      _$capabilities0FilesSharingSharebymailUploadFilesDropSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities0_FilesSharing_Sharebymail_PasswordInterface {
  bool get enabled;
  bool get enforced;
}

abstract class Capabilities0_FilesSharing_Sharebymail_Password
    implements
        $Capabilities0_FilesSharing_Sharebymail_PasswordInterface,
        Built<Capabilities0_FilesSharing_Sharebymail_Password, Capabilities0_FilesSharing_Sharebymail_PasswordBuilder> {
  factory Capabilities0_FilesSharing_Sharebymail_Password([
    final void Function(Capabilities0_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$Capabilities0_FilesSharing_Sharebymail_Password;

  // coverage:ignore-start
  const Capabilities0_FilesSharing_Sharebymail_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing_Sharebymail_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities0_FilesSharing_Sharebymail_Password> get serializer =>
      _$capabilities0FilesSharingSharebymailPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities0_FilesSharing_Sharebymail_ExpireDateInterface {
  bool get enabled;
  bool get enforced;
}

abstract class Capabilities0_FilesSharing_Sharebymail_ExpireDate
    implements
        $Capabilities0_FilesSharing_Sharebymail_ExpireDateInterface,
        Built<Capabilities0_FilesSharing_Sharebymail_ExpireDate,
            Capabilities0_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory Capabilities0_FilesSharing_Sharebymail_ExpireDate([
    final void Function(Capabilities0_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$Capabilities0_FilesSharing_Sharebymail_ExpireDate;

  // coverage:ignore-start
  const Capabilities0_FilesSharing_Sharebymail_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing_Sharebymail_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities0_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      _$capabilities0FilesSharingSharebymailExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities0_FilesSharing_SharebymailInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop get uploadFilesDrop;
  Capabilities0_FilesSharing_Sharebymail_Password get password;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities0_FilesSharing_Sharebymail_ExpireDate get expireDate;
}

abstract class Capabilities0_FilesSharing_Sharebymail
    implements
        $Capabilities0_FilesSharing_SharebymailInterface,
        Built<Capabilities0_FilesSharing_Sharebymail, Capabilities0_FilesSharing_SharebymailBuilder> {
  factory Capabilities0_FilesSharing_Sharebymail([
    final void Function(Capabilities0_FilesSharing_SharebymailBuilder)? b,
  ]) = _$Capabilities0_FilesSharing_Sharebymail;

  // coverage:ignore-start
  const Capabilities0_FilesSharing_Sharebymail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing_Sharebymail.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities0_FilesSharing_Sharebymail> get serializer =>
      _$capabilities0FilesSharingSharebymailSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities0_FilesSharingInterface {
  Capabilities0_FilesSharing_Sharebymail get sharebymail;
}

abstract class Capabilities0_FilesSharing
    implements
        $Capabilities0_FilesSharingInterface,
        Built<Capabilities0_FilesSharing, Capabilities0_FilesSharingBuilder> {
  factory Capabilities0_FilesSharing([final void Function(Capabilities0_FilesSharingBuilder)? b]) =
      _$Capabilities0_FilesSharing;

  // coverage:ignore-start
  const Capabilities0_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities0_FilesSharing> get serializer => _$capabilities0FilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities0Interface {
  @BuiltValueField(wireName: 'files_sharing')
  Capabilities0_FilesSharing get filesSharing;
}

abstract class Capabilities0 implements $Capabilities0Interface, Built<Capabilities0, Capabilities0Builder> {
  factory Capabilities0([final void Function(Capabilities0Builder)? b]) = _$Capabilities0;

  // coverage:ignore-start
  const Capabilities0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities0> get serializer => _$capabilities0Serializer;
}

typedef Capabilities = ({BuiltList<JsonObject>? builtListJsonObject, Capabilities0? capabilities0});

typedef $BuiltListCapabilities0 = ({BuiltList<JsonObject>? builtListJsonObject, Capabilities0? capabilities0});

extension $BuiltListCapabilities0Extension on $BuiltListCapabilities0 {
  List<dynamic> get _values => [builtListJsonObject, capabilities0];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListCapabilities0> get serializer => const _$BuiltListCapabilities0Serializer();
  static $BuiltListCapabilities0 fromJson(final Object? json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListCapabilities0Serializer implements PrimitiveSerializer<$BuiltListCapabilities0> {
  const _$BuiltListCapabilities0Serializer();

  @override
  Iterable<Type> get types => const [$BuiltListCapabilities0];

  @override
  String get wireName => r'$BuiltListCapabilities0';

  @override
  Object serialize(
    final Serializers serializers,
    final $BuiltListCapabilities0 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListJsonObject;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))!;
    }
    value = object.capabilities0;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(Capabilities0))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListCapabilities0 deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<JsonObject>? builtListJsonObject;
    try {
      builtListJsonObject = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>;
    } catch (_) {}
    Capabilities0? capabilities0;
    try {
      capabilities0 =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(Capabilities0))! as Capabilities0;
    } catch (_) {}
    return (builtListJsonObject: builtListJsonObject, capabilities0: capabilities0);
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Capabilities0), Capabilities0Builder.new)
      ..add(Capabilities0.serializer)
      ..addBuilderFactory(const FullType(Capabilities0_FilesSharing), Capabilities0_FilesSharingBuilder.new)
      ..add(Capabilities0_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities0_FilesSharing_Sharebymail),
        Capabilities0_FilesSharing_SharebymailBuilder.new,
      )
      ..add(Capabilities0_FilesSharing_Sharebymail.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop),
        Capabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder.new,
      )
      ..add(Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities0_FilesSharing_Sharebymail_Password),
        Capabilities0_FilesSharing_Sharebymail_PasswordBuilder.new,
      )
      ..add(Capabilities0_FilesSharing_Sharebymail_Password.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities0_FilesSharing_Sharebymail_ExpireDate),
        Capabilities0_FilesSharing_Sharebymail_ExpireDateBuilder.new,
      )
      ..add(Capabilities0_FilesSharing_Sharebymail_ExpireDate.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..add($BuiltListCapabilities0Extension.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
