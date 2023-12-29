// ignore_for_file: camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: public_member_api_docs, unreachable_switch_case

library petstore_openapi;

import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'petstore.openapi.g.dart';

class $Client extends DynamiteClient {
  /// Creates a new [DynamiteClient] for untagged requests.
  $Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
  });

  /// Creates a new [$Client] from another [client].
  $Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  /// Returns all pets from the system that the user has access to.
  /// Nam sed condimentum est. Maecenas tempor sagittis sapien, nec rhoncus sem sagittis sit amet. Aenean at gravida augue, ac iaculis sem. Curabitur odio lorem, ornare eget elementum nec, cursus id lectus. Duis mi turpis, pulvinar ac eros ac, tincidunt varius justo. In hac habitasse platea dictumst. Integer at adipiscing ante, a sagittis ligula. Aenean pharetra tempor ante molestie imperdiet. Vivamus id aliquam diam. Cras quis velit non tortor eleifend sagittis. Praesent at enim pharetra urna volutpat venenatis eget eget mauris. In eleifend fermentum facilisis. Praesent enim enim, gravida ac sodales sed, placerat id erat. Suspendisse lacus dolor, consectetur non augue vel, vehicula interdum libero. Morbi euismod sagittis libero sed lacinia.
  ///
  /// Sed tempus felis lobortis leo pulvinar rutrum. Nam mattis velit nisl, eu condimentum ligula luctus nec. Phasellus semper velit eget aliquet faucibus. In a mattis elit. Phasellus vel urna viverra, condimentum lorem id, rhoncus nibh. Ut pellentesque posuere elementum. Sed a varius odio. Morbi rhoncus ligula libero, vel eleifend nunc tristique vitae. Fusce et sem dui. Aenean nec scelerisque tortor. Fusce malesuada accumsan magna vel tempus. Quisque mollis felis eu dolor tristique, sit amet auctor felis gravida. Sed libero lorem, molestie sed nisl in, accumsan tempor nisi. Fusce sollicitudin massa ut lacinia mattis. Sed vel eleifend lorem. Pellentesque vitae felis pretium, pulvinar elit eu, euismod sapien.
  ///
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [tags] tags to filter by.
  ///   * [limit] maximum number of results to return.
  ///
  /// Status codes:
  ///   * 200: pet response
  ///   * default: unexpected error
  ///
  /// See:
  ///  * [findPetsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BuiltList<Pet>, void>> findPets({
    BuiltList<String>? tags,
    int? limit,
  }) async {
    final rawResponse = findPetsRaw(
      tags: tags,
      limit: limit,
    );

    return rawResponse.future;
  }

  /// Returns all pets from the system that the user has access to.
  /// Nam sed condimentum est. Maecenas tempor sagittis sapien, nec rhoncus sem sagittis sit amet. Aenean at gravida augue, ac iaculis sem. Curabitur odio lorem, ornare eget elementum nec, cursus id lectus. Duis mi turpis, pulvinar ac eros ac, tincidunt varius justo. In hac habitasse platea dictumst. Integer at adipiscing ante, a sagittis ligula. Aenean pharetra tempor ante molestie imperdiet. Vivamus id aliquam diam. Cras quis velit non tortor eleifend sagittis. Praesent at enim pharetra urna volutpat venenatis eget eget mauris. In eleifend fermentum facilisis. Praesent enim enim, gravida ac sodales sed, placerat id erat. Suspendisse lacus dolor, consectetur non augue vel, vehicula interdum libero. Morbi euismod sagittis libero sed lacinia.
  ///
  /// Sed tempus felis lobortis leo pulvinar rutrum. Nam mattis velit nisl, eu condimentum ligula luctus nec. Phasellus semper velit eget aliquet faucibus. In a mattis elit. Phasellus vel urna viverra, condimentum lorem id, rhoncus nibh. Ut pellentesque posuere elementum. Sed a varius odio. Morbi rhoncus ligula libero, vel eleifend nunc tristique vitae. Fusce et sem dui. Aenean nec scelerisque tortor. Fusce malesuada accumsan magna vel tempus. Quisque mollis felis eu dolor tristique, sit amet auctor felis gravida. Sed libero lorem, molestie sed nisl in, accumsan tempor nisi. Fusce sollicitudin massa ut lacinia mattis. Sed vel eleifend lorem. Pellentesque vitae felis pretium, pulvinar elit eu, euismod sapien.
  ///
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [tags] tags to filter by.
  ///   * [limit] maximum number of results to return.
  ///
  /// Status codes:
  ///   * 200: pet response
  ///   * default: unexpected error
  ///
  /// See:
  ///  * [findPets] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BuiltList<Pet>, void> findPetsRaw({
    BuiltList<String>? tags,
    int? limit,
  }) {
    final _parameters = <String, dynamic>{};
    const _headers = <String, String>{
      'Accept': 'application/json',
    };

    final $tags = jsonSerializers.serialize(tags, specifiedType: const FullType(BuiltList, [FullType(String)]));
    _parameters['tags'] = $tags;

    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    _parameters['limit'] = $limit;

    final _path = UriTemplate('/pets{?tags*,limit*}').expand(_parameters);
    return DynamiteRawResponse<BuiltList<Pet>, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BuiltList, [FullType(Pet)]),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Creates a new pet in the store. Duplicates are allowed.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: pet response
  ///   * default: unexpected error
  ///
  /// See:
  ///  * [addPetRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Pet, void>> addPet({required NewPet newPet}) async {
    final rawResponse = addPetRaw(
      newPet: newPet,
    );

    return rawResponse.future;
  }

  /// Creates a new pet in the store. Duplicates are allowed.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: pet response
  ///   * default: unexpected error
  ///
  /// See:
  ///  * [addPet] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Pet, void> addPetRaw({required NewPet newPet}) {
    const _headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? _body;

    _headers['Content-Type'] = 'application/json';
    _body = utf8.encode(json.encode(jsonSerializers.serialize(newPet, specifiedType: const FullType(NewPet))));
    const _path = '/pets';
    return DynamiteRawResponse<Pet, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        _body,
        const {200},
      ),
      bodyType: const FullType(Pet),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a user based on a single ID, if the user does not have access to the pet.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of pet to fetch.
  ///
  /// Status codes:
  ///   * 200: pet response
  ///   * default: unexpected error
  ///
  /// See:
  ///  * [findPetByIdRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Pet, void>> findPetById({required int id}) async {
    final rawResponse = findPetByIdRaw(
      id: id,
    );

    return rawResponse.future;
  }

  /// Returns a user based on a single ID, if the user does not have access to the pet.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of pet to fetch.
  ///
  /// Status codes:
  ///   * 200: pet response
  ///   * default: unexpected error
  ///
  /// See:
  ///  * [findPetById] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Pet, void> findPetByIdRaw({required int id}) {
    final _parameters = <String, dynamic>{};
    const _headers = <String, String>{
      'Accept': 'application/json',
    };

    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    final _path = UriTemplate('/pets/{id}').expand(_parameters);
    return DynamiteRawResponse<Pet, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Pet),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// deletes a single pet based on the ID supplied.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of pet to delete.
  ///
  /// Status codes:
  ///   * 204: pet deleted
  ///   * default: unexpected error
  ///
  /// See:
  ///  * [deletePetRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> deletePet({required int id}) async {
    final rawResponse = deletePetRaw(
      id: id,
    );

    return rawResponse.future;
  }

  /// deletes a single pet based on the ID supplied.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of pet to delete.
  ///
  /// Status codes:
  ///   * 204: pet deleted
  ///   * default: unexpected error
  ///
  /// See:
  ///  * [deletePet] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> deletePetRaw({required int id}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    final _path = UriTemplate('/pets/{id}').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {204},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $NewPetInterface {
  String get name;
  String? get tag;
}

abstract class NewPet implements $NewPetInterface, Built<NewPet, NewPetBuilder> {
  factory NewPet([void Function(NewPetBuilder)? b]) = _$NewPet;

  // coverage:ignore-start
  const NewPet._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewPet.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewPet> get serializer => _$newPetSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Pet_1Interface {
  int get id;
}

@BuiltValue(instantiable: false)
abstract interface class $PetInterface implements $NewPetInterface, $Pet_1Interface {}

abstract class Pet implements $PetInterface, Built<Pet, PetBuilder> {
  factory Pet([void Function(PetBuilder)? b]) = _$Pet;

  // coverage:ignore-start
  const Pet._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Pet.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Pet> get serializer => _$petSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ErrorInterface {
  int get code;
  String get message;
}

abstract class Error implements $ErrorInterface, Built<Error, ErrorBuilder> {
  factory Error([void Function(ErrorBuilder)? b]) = _$Error;

  // coverage:ignore-start
  const Error._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Error.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Error> get serializer => _$errorSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(Pet), PetBuilder.new)
      ..add(Pet.serializer)
      ..addBuilderFactory(const FullType(NewPet), NewPetBuilder.new)
      ..add(NewPet.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Pet)]), ListBuilder<Pet>.new)
      ..addBuilderFactory(const FullType(Error), ErrorBuilder.new)
      ..add(Error.serializer))
    .build();
@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
