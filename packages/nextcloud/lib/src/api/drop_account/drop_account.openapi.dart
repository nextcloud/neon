// Use of this source code is governed by a agpl license. It can be obtained at `https://spdx.org/licenses/AGPL-3.0-only.html`.

// OpenAPI client generated by Dynamite. Do not manually edit this file.

// ignore_for_file: camel_case_extensions, camel_case_types, cascade_invocations
// ignore_for_file: discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names, public_member_api_docs
// ignore_for_file: unreachable_switch_case

/// drop_account Version: 0.0.1.
///
/// An app to allow users to delete their accounts.
///
/// Use of this source code is governed by a agpl license.
/// It can be obtained at `https://spdx.org/licenses/AGPL-3.0-only.html`.
library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' as _i7;
import 'package:collection/collection.dart' as _i4;
import 'package:dynamite_runtime/built_value.dart' as _i6;
import 'package:dynamite_runtime/http_client.dart' as _i1;
import 'package:dynamite_runtime/utils.dart' as _i5;
import 'package:http/http.dart' as _i3;
import 'package:meta/meta.dart' as _i2;

part 'drop_account.openapi.g.dart';

class $Client extends _i1.DynamiteClient {
  /// Creates a new `DynamiteClient` for untagged requests.
  $Client(super.baseURL, {super.httpClient, super.authentications});

  /// Creates a new [$Client] from another [client].
  $Client.fromClient(_i1.DynamiteClient client)
      : super(client.baseURL, httpClient: client.httpClient, authentications: client.authentications);

  late final $ApiClient api = $ApiClient(this);
}

class $ApiClient {
  /// Creates a new `DynamiteClient` for api requests.
  $ApiClient(this._rootClient);

  final $Client _rootClient;

  /// Builds a serializer to parse the response of [$delete_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<ApiDeleteResponseApplicationJson, void> $delete_Serializer() => _i1.DynamiteSerializer(
        bodyType: const FullType(ApiDeleteResponseApplicationJson),
        headersType: null,
        serializers: _$jsonSerializers,
        validStatuses: const {201, 401, 400, 500},
      );

  /// Trigger the deletion of the current user account.
  ///
  /// This endpoint requires password confirmation.
  ///
  /// Returns a `DynamiteRequest` backing the [delete] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: A confirmation by email is required. An email has been sent to the user
  ///   * 202: The user has been marked for deletion
  ///   * 401: Unable to get user from session
  ///   * 403: The user was not allowed to be deleted
  ///   * 400: The user has no email set up in it's account to send the confirmation email to
  ///   * 500: An exception was thrown when sending the user a confirmation email
  ///
  /// See:
  ///  * [delete] for a method executing this request and parsing the response.
  ///  * [$delete_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $delete_Request({bool? oCSAPIRequest}) {
    const _path = '/ocs/v2.php/apps/drop_account/api/v1/account';
    final _uri = Uri.parse('${_rootClient.baseURL}$_path');
    final _request = _i3.Request('delete', _uri);
    _request.headers['Accept'] = 'application/json';
    // coverage:ignore-start
    final authentication = _i4.IterableExtension(_rootClient.authentications)?.firstWhereOrNull(
      (auth) => switch (auth) {
        _i1.DynamiteHttpBearerAuthentication() || _i1.DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _request.headers.addAll(authentication.headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

    // coverage:ignore-end
    var __oCSAPIRequest = _$jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    __oCSAPIRequest ??= true;
    _request.headers['OCS-APIRequest'] = const _i5.HeaderEncoder().convert(__oCSAPIRequest);

    return _request;
  }

  /// Trigger the deletion of the current user account.
  ///
  /// This endpoint requires password confirmation.
  ///
  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: A confirmation by email is required. An email has been sent to the user
  ///   * 202: The user has been marked for deletion
  ///   * 401: Unable to get user from session
  ///   * 403: The user was not allowed to be deleted
  ///   * 400: The user has no email set up in it's account to send the confirmation email to
  ///   * 500: An exception was thrown when sending the user a confirmation email
  ///
  /// See:
  ///  * [$delete_Request] for the request send by this method.
  ///  * [$delete_Serializer] for a converter to parse the `Response` from an executed request.
  Future<_i1.DynamiteResponse<ApiDeleteResponseApplicationJson, void>> delete({bool? oCSAPIRequest}) async {
    final _request = $delete_Request(oCSAPIRequest: oCSAPIRequest);
    final _streamedResponse = await _rootClient.httpClient.send(_request);
    final _response = await _i3.Response.fromStream(_streamedResponse);

    final _serializer = $delete_Serializer();
    return _i1.ResponseConverter<ApiDeleteResponseApplicationJson, void>(_serializer).convert(_response);
  }
}

@BuiltValue(instantiable: false)
sealed class $OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;

  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [$OCSMetaInterfaceBuilder].
  $OCSMetaInterface rebuild(void Function($OCSMetaInterfaceBuilder) updates);

  /// Converts the instance to a builder [$OCSMetaInterfaceBuilder].
  $OCSMetaInterfaceBuilder toBuilder();
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($OCSMetaInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($OCSMetaInterfaceBuilder b) {}
}

abstract class OCSMeta implements $OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  /// Creates a new OCSMeta object using the builder pattern.
  factory OCSMeta([void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory OCSMeta.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for OCSMeta.
  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OCSMetaBuilder b) {
    $OCSMetaInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OCSMetaBuilder b) {
    $OCSMetaInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
sealed class $ApiDeleteResponseApplicationJson_Ocs_DataInterface {
  String get message;

  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [$ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder].
  $ApiDeleteResponseApplicationJson_Ocs_DataInterface rebuild(
    void Function($ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );

  /// Converts the instance to a builder [$ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder].
  $ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder b) {}
}

abstract class ApiDeleteResponseApplicationJson_Ocs_Data
    implements
        $ApiDeleteResponseApplicationJson_Ocs_DataInterface,
        Built<ApiDeleteResponseApplicationJson_Ocs_Data, ApiDeleteResponseApplicationJson_Ocs_DataBuilder> {
  /// Creates a new ApiDeleteResponseApplicationJson_Ocs_Data object using the builder pattern.
  factory ApiDeleteResponseApplicationJson_Ocs_Data([
    void Function(ApiDeleteResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ApiDeleteResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ApiDeleteResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiDeleteResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiDeleteResponseApplicationJson_Ocs_Data.
  static Serializer<ApiDeleteResponseApplicationJson_Ocs_Data> get serializer =>
      _$apiDeleteResponseApplicationJsonOcsDataSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiDeleteResponseApplicationJson_Ocs_DataBuilder b) {
    $ApiDeleteResponseApplicationJson_Ocs_DataInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiDeleteResponseApplicationJson_Ocs_DataBuilder b) {
    $ApiDeleteResponseApplicationJson_Ocs_DataInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
sealed class $ApiDeleteResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ApiDeleteResponseApplicationJson_Ocs_Data get data;

  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [$ApiDeleteResponseApplicationJson_OcsInterfaceBuilder].
  $ApiDeleteResponseApplicationJson_OcsInterface rebuild(
    void Function($ApiDeleteResponseApplicationJson_OcsInterfaceBuilder) updates,
  );

  /// Converts the instance to a builder [$ApiDeleteResponseApplicationJson_OcsInterfaceBuilder].
  $ApiDeleteResponseApplicationJson_OcsInterfaceBuilder toBuilder();
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiDeleteResponseApplicationJson_OcsInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiDeleteResponseApplicationJson_OcsInterfaceBuilder b) {}
}

abstract class ApiDeleteResponseApplicationJson_Ocs
    implements
        $ApiDeleteResponseApplicationJson_OcsInterface,
        Built<ApiDeleteResponseApplicationJson_Ocs, ApiDeleteResponseApplicationJson_OcsBuilder> {
  /// Creates a new ApiDeleteResponseApplicationJson_Ocs object using the builder pattern.
  factory ApiDeleteResponseApplicationJson_Ocs([void Function(ApiDeleteResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiDeleteResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiDeleteResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiDeleteResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiDeleteResponseApplicationJson_Ocs.
  static Serializer<ApiDeleteResponseApplicationJson_Ocs> get serializer =>
      _$apiDeleteResponseApplicationJsonOcsSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiDeleteResponseApplicationJson_OcsBuilder b) {
    $ApiDeleteResponseApplicationJson_OcsInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiDeleteResponseApplicationJson_OcsBuilder b) {
    $ApiDeleteResponseApplicationJson_OcsInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
sealed class $ApiDeleteResponseApplicationJsonInterface {
  ApiDeleteResponseApplicationJson_Ocs get ocs;

  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [$ApiDeleteResponseApplicationJsonInterfaceBuilder].
  $ApiDeleteResponseApplicationJsonInterface rebuild(
    void Function($ApiDeleteResponseApplicationJsonInterfaceBuilder) updates,
  );

  /// Converts the instance to a builder [$ApiDeleteResponseApplicationJsonInterfaceBuilder].
  $ApiDeleteResponseApplicationJsonInterfaceBuilder toBuilder();
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiDeleteResponseApplicationJsonInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiDeleteResponseApplicationJsonInterfaceBuilder b) {}
}

abstract class ApiDeleteResponseApplicationJson
    implements
        $ApiDeleteResponseApplicationJsonInterface,
        Built<ApiDeleteResponseApplicationJson, ApiDeleteResponseApplicationJsonBuilder> {
  /// Creates a new ApiDeleteResponseApplicationJson object using the builder pattern.
  factory ApiDeleteResponseApplicationJson([void Function(ApiDeleteResponseApplicationJsonBuilder)? b]) =
      _$ApiDeleteResponseApplicationJson;

  // coverage:ignore-start
  const ApiDeleteResponseApplicationJson._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiDeleteResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiDeleteResponseApplicationJson.
  static Serializer<ApiDeleteResponseApplicationJson> get serializer => _$apiDeleteResponseApplicationJsonSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiDeleteResponseApplicationJsonBuilder b) {
    $ApiDeleteResponseApplicationJsonInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiDeleteResponseApplicationJsonBuilder b) {
    $ApiDeleteResponseApplicationJsonInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
sealed class $Capabilities_DropAccount_DelayInterface {
  bool get enabled;
  int get hours;

  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [$Capabilities_DropAccount_DelayInterfaceBuilder].
  $Capabilities_DropAccount_DelayInterface rebuild(
    void Function($Capabilities_DropAccount_DelayInterfaceBuilder) updates,
  );

  /// Converts the instance to a builder [$Capabilities_DropAccount_DelayInterfaceBuilder].
  $Capabilities_DropAccount_DelayInterfaceBuilder toBuilder();
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($Capabilities_DropAccount_DelayInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($Capabilities_DropAccount_DelayInterfaceBuilder b) {}
}

abstract class Capabilities_DropAccount_Delay
    implements
        $Capabilities_DropAccount_DelayInterface,
        Built<Capabilities_DropAccount_Delay, Capabilities_DropAccount_DelayBuilder> {
  /// Creates a new Capabilities_DropAccount_Delay object using the builder pattern.
  factory Capabilities_DropAccount_Delay([void Function(Capabilities_DropAccount_DelayBuilder)? b]) =
      _$Capabilities_DropAccount_Delay;

  // coverage:ignore-start
  const Capabilities_DropAccount_Delay._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory Capabilities_DropAccount_Delay.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for Capabilities_DropAccount_Delay.
  static Serializer<Capabilities_DropAccount_Delay> get serializer => _$capabilitiesDropAccountDelaySerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(Capabilities_DropAccount_DelayBuilder b) {
    $Capabilities_DropAccount_DelayInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(Capabilities_DropAccount_DelayBuilder b) {
    $Capabilities_DropAccount_DelayInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
sealed class $Capabilities_DropAccountInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'api-version')
  String get apiVersion;
  Capabilities_DropAccount_Delay get delay;
  String? get details;

  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [$Capabilities_DropAccountInterfaceBuilder].
  $Capabilities_DropAccountInterface rebuild(void Function($Capabilities_DropAccountInterfaceBuilder) updates);

  /// Converts the instance to a builder [$Capabilities_DropAccountInterfaceBuilder].
  $Capabilities_DropAccountInterfaceBuilder toBuilder();
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($Capabilities_DropAccountInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($Capabilities_DropAccountInterfaceBuilder b) {}
}

abstract class Capabilities_DropAccount
    implements $Capabilities_DropAccountInterface, Built<Capabilities_DropAccount, Capabilities_DropAccountBuilder> {
  /// Creates a new Capabilities_DropAccount object using the builder pattern.
  factory Capabilities_DropAccount([void Function(Capabilities_DropAccountBuilder)? b]) = _$Capabilities_DropAccount;

  // coverage:ignore-start
  const Capabilities_DropAccount._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory Capabilities_DropAccount.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for Capabilities_DropAccount.
  static Serializer<Capabilities_DropAccount> get serializer => _$capabilitiesDropAccountSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(Capabilities_DropAccountBuilder b) {
    $Capabilities_DropAccountInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(Capabilities_DropAccountBuilder b) {
    $Capabilities_DropAccountInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
sealed class $CapabilitiesInterface {
  @BuiltValueField(wireName: 'drop-account')
  Capabilities_DropAccount get dropAccount;

  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [$CapabilitiesInterfaceBuilder].
  $CapabilitiesInterface rebuild(void Function($CapabilitiesInterfaceBuilder) updates);

  /// Converts the instance to a builder [$CapabilitiesInterfaceBuilder].
  $CapabilitiesInterfaceBuilder toBuilder();
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($CapabilitiesInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($CapabilitiesInterfaceBuilder b) {}
}

abstract class Capabilities implements $CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  /// Creates a new Capabilities object using the builder pattern.
  factory Capabilities([void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory Capabilities.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for Capabilities.
  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CapabilitiesBuilder b) {
    $CapabilitiesInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(CapabilitiesBuilder b) {
    $CapabilitiesInterface._validate(b);
  }
}

// coverage:ignore-start
/// Serializer for all values in this library.
///
/// Serializes values into the `built_value` wire format.
/// See: [$jsonSerializers] for serializing into json.
@_i2.visibleForTesting
final Serializers $serializers = _$serializers;
final Serializers _$serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(ApiDeleteResponseApplicationJson),
        ApiDeleteResponseApplicationJsonBuilder.new,
      )
      ..add(ApiDeleteResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiDeleteResponseApplicationJson_Ocs),
        ApiDeleteResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiDeleteResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(ApiDeleteResponseApplicationJson_Ocs_Data),
        ApiDeleteResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(ApiDeleteResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(Capabilities), CapabilitiesBuilder.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_DropAccount), Capabilities_DropAccountBuilder.new)
      ..add(Capabilities_DropAccount.serializer)
      ..addBuilderFactory(const FullType(Capabilities_DropAccount_Delay), Capabilities_DropAccount_DelayBuilder.new)
      ..add(Capabilities_DropAccount_Delay.serializer))
    .build();

/// Serializer for all values in this library.
///
/// Serializes values into the json. Json serialization is more expensive than the built_value wire format.
/// See: [$serializers] for serializing into the `built_value` wire format.
@_i2.visibleForTesting
final Serializers $jsonSerializers = _$jsonSerializers;
final Serializers _$jsonSerializers = (_$serializers.toBuilder()
      ..add(_i6.DynamiteDoubleSerializer())
      ..addPlugin(_i7.StandardJsonPlugin())
      ..addPlugin(const _i6.HeaderPlugin())
      ..addPlugin(const _i6.ContentStringPlugin()))
    .build();
// coverage:ignore-end
