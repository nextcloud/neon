// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
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
abstract interface class Capabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface {
  bool get enabled;
}

abstract class Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        Capabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      const _$Capabilities0_FilesSharing_Sharebymail_UploadFilesDropSerializer();
}

class _$Capabilities0_FilesSharing_Sharebymail_UploadFilesDropSerializer
    implements StructuredSerializer<Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop> {
  const _$Capabilities0_FilesSharing_Sharebymail_UploadFilesDropSerializer();

  @override
  Iterable<Type> get types => const [
        Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
        _$Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
      ];

  @override
  String get wireName => 'Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities0_FilesSharing_Sharebymail_PasswordInterface {
  bool get enabled;
  bool get enforced;
}

abstract class Capabilities0_FilesSharing_Sharebymail_Password
    implements
        Capabilities0_FilesSharing_Sharebymail_PasswordInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities0_FilesSharing_Sharebymail_Password> get serializer =>
      const _$Capabilities0_FilesSharing_Sharebymail_PasswordSerializer();
}

class _$Capabilities0_FilesSharing_Sharebymail_PasswordSerializer
    implements StructuredSerializer<Capabilities0_FilesSharing_Sharebymail_Password> {
  const _$Capabilities0_FilesSharing_Sharebymail_PasswordSerializer();

  @override
  Iterable<Type> get types =>
      const [Capabilities0_FilesSharing_Sharebymail_Password, _$Capabilities0_FilesSharing_Sharebymail_Password];

  @override
  String get wireName => 'Capabilities0_FilesSharing_Sharebymail_Password';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities0_FilesSharing_Sharebymail_Password object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'enforced',
      serializers.serialize(object.enforced, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities0_FilesSharing_Sharebymail_Password deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities0_FilesSharing_Sharebymail_PasswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities0_FilesSharing_Sharebymail_ExpireDateInterface {
  bool get enabled;
  bool get enforced;
}

abstract class Capabilities0_FilesSharing_Sharebymail_ExpireDate
    implements
        Capabilities0_FilesSharing_Sharebymail_ExpireDateInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities0_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      const _$Capabilities0_FilesSharing_Sharebymail_ExpireDateSerializer();
}

class _$Capabilities0_FilesSharing_Sharebymail_ExpireDateSerializer
    implements StructuredSerializer<Capabilities0_FilesSharing_Sharebymail_ExpireDate> {
  const _$Capabilities0_FilesSharing_Sharebymail_ExpireDateSerializer();

  @override
  Iterable<Type> get types =>
      const [Capabilities0_FilesSharing_Sharebymail_ExpireDate, _$Capabilities0_FilesSharing_Sharebymail_ExpireDate];

  @override
  String get wireName => 'Capabilities0_FilesSharing_Sharebymail_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities0_FilesSharing_Sharebymail_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'enforced',
      serializers.serialize(object.enforced, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities0_FilesSharing_Sharebymail_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities0_FilesSharing_Sharebymail_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities0_FilesSharing_SharebymailInterface {
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
        Capabilities0_FilesSharing_SharebymailInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities0_FilesSharing_Sharebymail> get serializer =>
      const _$Capabilities0_FilesSharing_SharebymailSerializer();
}

class _$Capabilities0_FilesSharing_SharebymailSerializer
    implements StructuredSerializer<Capabilities0_FilesSharing_Sharebymail> {
  const _$Capabilities0_FilesSharing_SharebymailSerializer();

  @override
  Iterable<Type> get types => const [Capabilities0_FilesSharing_Sharebymail, _$Capabilities0_FilesSharing_Sharebymail];

  @override
  String get wireName => 'Capabilities0_FilesSharing_Sharebymail';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities0_FilesSharing_Sharebymail object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'send_password_by_mail',
      serializers.serialize(object.sendPasswordByMail, specifiedType: const FullType(bool)),
      'upload_files_drop',
      serializers.serialize(
        object.uploadFilesDrop,
        specifiedType: const FullType(Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop),
      ),
      'password',
      serializers.serialize(
        object.password,
        specifiedType: const FullType(Capabilities0_FilesSharing_Sharebymail_Password),
      ),
      'expire_date',
      serializers.serialize(
        object.expireDate,
        specifiedType: const FullType(Capabilities0_FilesSharing_Sharebymail_ExpireDate),
      ),
    ];
    return result;
  }

  @override
  Capabilities0_FilesSharing_Sharebymail deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities0_FilesSharing_SharebymailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'send_password_by_mail':
          result.sendPasswordByMail = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'upload_files_drop':
          result.uploadFilesDrop.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop),
            )! as Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
          );
        case 'password':
          result.password.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(Capabilities0_FilesSharing_Sharebymail_Password),
            )! as Capabilities0_FilesSharing_Sharebymail_Password,
          );
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(Capabilities0_FilesSharing_Sharebymail_ExpireDate),
            )! as Capabilities0_FilesSharing_Sharebymail_ExpireDate,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities0_FilesSharingInterface {
  Capabilities0_FilesSharing_Sharebymail get sharebymail;
}

abstract class Capabilities0_FilesSharing
    implements
        Capabilities0_FilesSharingInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities0_FilesSharing> get serializer => const _$Capabilities0_FilesSharingSerializer();
}

class _$Capabilities0_FilesSharingSerializer implements StructuredSerializer<Capabilities0_FilesSharing> {
  const _$Capabilities0_FilesSharingSerializer();

  @override
  Iterable<Type> get types => const [Capabilities0_FilesSharing, _$Capabilities0_FilesSharing];

  @override
  String get wireName => 'Capabilities0_FilesSharing';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities0_FilesSharing object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'sharebymail',
      serializers.serialize(object.sharebymail, specifiedType: const FullType(Capabilities0_FilesSharing_Sharebymail)),
    ];
    return result;
  }

  @override
  Capabilities0_FilesSharing deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities0_FilesSharingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'sharebymail':
          result.sharebymail.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities0_FilesSharing_Sharebymail))!
                as Capabilities0_FilesSharing_Sharebymail,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities0Interface {
  @BuiltValueField(wireName: 'files_sharing')
  Capabilities0_FilesSharing get filesSharing;
}

abstract class Capabilities0 implements Capabilities0Interface, Built<Capabilities0, Capabilities0Builder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities0> get serializer => const _$Capabilities0Serializer();
}

class _$Capabilities0Serializer implements StructuredSerializer<Capabilities0> {
  const _$Capabilities0Serializer();

  @override
  Iterable<Type> get types => const [Capabilities0, _$Capabilities0];

  @override
  String get wireName => 'Capabilities0';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities0 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'files_sharing',
      serializers.serialize(object.filesSharing, specifiedType: const FullType(Capabilities0_FilesSharing)),
    ];
    return result;
  }

  @override
  Capabilities0 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'files_sharing':
          result.filesSharing.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities0_FilesSharing))!
                as Capabilities0_FilesSharing,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  Capabilities0? get capabilities0;
  BuiltList<JsonObject>? get builtListJsonObject;
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities> get serializer => _$CapabilitiesSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final CapabilitiesBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._capabilities0, b._builtListJsonObject].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of 'capabilities0', 'builtListJsonObject' for ${b._data}");
    }
  }
}

class _$CapabilitiesSerializer implements PrimitiveSerializer<Capabilities> {
  @override
  final Iterable<Type> types = const [Capabilities, _$Capabilities];

  @override
  final String wireName = 'Capabilities';

  @override
  Object serialize(
    final Serializers serializers,
    final Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  Capabilities deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CapabilitiesBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(Capabilities0))! as Capabilities0;
      result.capabilities0.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>;
      result.builtListJsonObject.replace(value);
    } catch (_) {}
    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities0), Capabilities0.new)
      ..add(Capabilities0.serializer)
      ..addBuilderFactory(const FullType(Capabilities0_FilesSharing), Capabilities0_FilesSharing.new)
      ..add(Capabilities0_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities0_FilesSharing_Sharebymail),
        Capabilities0_FilesSharing_Sharebymail.new,
      )
      ..add(Capabilities0_FilesSharing_Sharebymail.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop),
        Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop.new,
      )
      ..add(Capabilities0_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities0_FilesSharing_Sharebymail_Password),
        Capabilities0_FilesSharing_Sharebymail_Password.new,
      )
      ..add(Capabilities0_FilesSharing_Sharebymail_Password.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities0_FilesSharing_Sharebymail_ExpireDate),
        Capabilities0_FilesSharing_Sharebymail_ExpireDate.new,
      )
      ..add(Capabilities0_FilesSharing_Sharebymail_ExpireDate.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
