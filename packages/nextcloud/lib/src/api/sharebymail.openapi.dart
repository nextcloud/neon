// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';

part 'sharebymail.openapi.g.dart';

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
    void Function(Capabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder)? b,
  ]) = _$Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop;

  // coverage:ignore-start
  const Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
    void Function(Capabilities0_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$Capabilities0_FilesSharing_Sharebymail_Password;

  // coverage:ignore-start
  const Capabilities0_FilesSharing_Sharebymail_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing_Sharebymail_Password.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
    void Function(Capabilities0_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$Capabilities0_FilesSharing_Sharebymail_ExpireDate;

  // coverage:ignore-start
  const Capabilities0_FilesSharing_Sharebymail_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing_Sharebymail_ExpireDate.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory Capabilities0_FilesSharing_Sharebymail([void Function(Capabilities0_FilesSharing_SharebymailBuilder)? b]) =
      _$Capabilities0_FilesSharing_Sharebymail;

  // coverage:ignore-start
  const Capabilities0_FilesSharing_Sharebymail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing_Sharebymail.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory Capabilities0_FilesSharing([void Function(Capabilities0_FilesSharingBuilder)? b]) =
      _$Capabilities0_FilesSharing;

  // coverage:ignore-start
  const Capabilities0_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0_FilesSharing.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities0_FilesSharing> get serializer => _$capabilities0FilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities0Interface {
  @BuiltValueField(wireName: 'files_sharing')
  Capabilities0_FilesSharing get filesSharing;
}

abstract class Capabilities0 implements $Capabilities0Interface, Built<Capabilities0, Capabilities0Builder> {
  factory Capabilities0([void Function(Capabilities0Builder)? b]) = _$Capabilities0;

  // coverage:ignore-start
  const Capabilities0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities0.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities0> get serializer => _$capabilities0Serializer;
}

typedef Capabilities = ({BuiltList<Never>? builtListNever, Capabilities0? capabilities0});

typedef $BuiltListCapabilities0 = ({BuiltList<Never>? builtListNever, Capabilities0? capabilities0});

extension $BuiltListCapabilities0Extension on $BuiltListCapabilities0 {
  List<dynamic> get _values => [builtListNever, capabilities0];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListCapabilities0> get serializer => const _$BuiltListCapabilities0Serializer();
  static $BuiltListCapabilities0 fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListCapabilities0Serializer implements PrimitiveSerializer<$BuiltListCapabilities0> {
  const _$BuiltListCapabilities0Serializer();

  @override
  Iterable<Type> get types => const [$BuiltListCapabilities0];

  @override
  String get wireName => r'$BuiltListCapabilities0';

  @override
  Object serialize(
    Serializers serializers,
    $BuiltListCapabilities0 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListNever;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Never)]))!;
    }
    value = object.capabilities0;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(Capabilities0))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListCapabilities0 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<Never>? builtListNever;
    try {
      builtListNever = serializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(Never)]))!
          as BuiltList<Never>;
    } catch (_) {}
    Capabilities0? capabilities0;
    try {
      capabilities0 = serializers.deserialize(data, specifiedType: const FullType(Capabilities0))! as Capabilities0;
    } catch (_) {}
    return (builtListNever: builtListNever, capabilities0: capabilities0);
  }
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
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
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Never)]), ListBuilder<Never>.new)
      ..add($BuiltListCapabilities0Extension.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
