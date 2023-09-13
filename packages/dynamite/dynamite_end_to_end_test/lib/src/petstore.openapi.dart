// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'petstore.openapi.g.dart';

class SwaggerPetstoreOpenAPI30Response<T, U> extends DynamiteResponse<T, U> {
  SwaggerPetstoreOpenAPI30Response(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'SwaggerPetstoreOpenAPI30Response(data: $data, headers: $headers)';
}

class SwaggerPetstoreOpenAPI30ApiException extends DynamiteApiException {
  SwaggerPetstoreOpenAPI30ApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<SwaggerPetstoreOpenAPI30ApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return SwaggerPetstoreOpenAPI30ApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'SwaggerPetstoreOpenAPI30ApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class SwaggerPetstoreOpenAPI30Client extends DynamiteClient {
  SwaggerPetstoreOpenAPI30Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  SwaggerPetstoreOpenAPI30Client.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  SwaggerPetstoreOpenAPI30PetClient get pet => SwaggerPetstoreOpenAPI30PetClient(this);
  SwaggerPetstoreOpenAPI30StoreClient get store => SwaggerPetstoreOpenAPI30StoreClient(this);
  SwaggerPetstoreOpenAPI30UserClient get user => SwaggerPetstoreOpenAPI30UserClient(this);
}

/// Everything about your Pets
class SwaggerPetstoreOpenAPI30PetClient {
  SwaggerPetstoreOpenAPI30PetClient(this._rootClient);

  final SwaggerPetstoreOpenAPI30Client _rootClient;

  /// Update an existing pet
  ///
  /// Update an existing pet by Id
  Future<SwaggerPetstoreOpenAPI30Pet> updatePet({required final SwaggerPetstoreOpenAPI30Pet pet}) async {
    const path = '/pet';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'oauth2' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'oauth2' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for petstore_auth');
    }
    // coverage:ignore-end
    headers['Content-Type'] = 'application/json';
    body = utf8.encode(
      json.encode(_jsonSerializers.serialize(pet, specifiedType: const FullType(SwaggerPetstoreOpenAPI30Pet))),
    ) as Uint8List;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(SwaggerPetstoreOpenAPI30Pet),
      )! as SwaggerPetstoreOpenAPI30Pet;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Add a new pet to the store
  ///
  /// Add a new pet to the store
  Future<SwaggerPetstoreOpenAPI30Pet> addPet({required final SwaggerPetstoreOpenAPI30Pet pet}) async {
    const path = '/pet';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'oauth2' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'oauth2' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for petstore_auth');
    }
    // coverage:ignore-end
    headers['Content-Type'] = 'application/json';
    body = utf8.encode(
      json.encode(_jsonSerializers.serialize(pet, specifiedType: const FullType(SwaggerPetstoreOpenAPI30Pet))),
    ) as Uint8List;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(SwaggerPetstoreOpenAPI30Pet),
      )! as SwaggerPetstoreOpenAPI30Pet;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Finds Pets by status
  ///
  /// Multiple status values can be provided with comma separated strings
  Future<BuiltList<SwaggerPetstoreOpenAPI30Pet>> findPetsByStatus({
    final SwaggerPetstoreOpenAPI30FindPetsByStatusStatus status =
        SwaggerPetstoreOpenAPI30FindPetsByStatusStatus.available,
  }) async {
    const path = '/pet/findByStatus';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'oauth2' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'oauth2' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for petstore_auth');
    }
    // coverage:ignore-end
    if (status != SwaggerPetstoreOpenAPI30FindPetsByStatusStatus.available) {
      queryParameters['status'] = status.name;
    }
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Pet)]),
      )! as BuiltList<SwaggerPetstoreOpenAPI30Pet>;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Finds Pets by tags
  ///
  /// Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
  Future<BuiltList<SwaggerPetstoreOpenAPI30Pet>> findPetsByTags({final List<String>? tags}) async {
    const path = '/pet/findByTags';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'oauth2' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'oauth2' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for petstore_auth');
    }
    // coverage:ignore-end
    if (tags != null) {
      queryParameters['tags'] = tags.map((final e) => e);
    }
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Pet)]),
      )! as BuiltList<SwaggerPetstoreOpenAPI30Pet>;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Find pet by ID
  ///
  /// Returns a single pet
  Future<SwaggerPetstoreOpenAPI30Pet> getPetById({required final int petId}) async {
    var path = '/pet/{petId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'apiKey' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'apiKey' && a.scheme == 'null').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'oauth2' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'oauth2' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for api_key or petstore_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{petId}', Uri.encodeQueryComponent(petId.toString()));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(SwaggerPetstoreOpenAPI30Pet),
      )! as SwaggerPetstoreOpenAPI30Pet;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Updates a pet in the store with form data
  Future<void> updatePetWithForm({
    required final int petId,
    final String? name,
    final String? status,
  }) async {
    var path = '/pet/{petId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'oauth2' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'oauth2' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for petstore_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{petId}', Uri.encodeQueryComponent(petId.toString()));
    if (name != null) {
      queryParameters['name'] = name;
    }
    if (status != null) {
      queryParameters['status'] = status;
    }
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 405) {
      return;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Deletes a pet
  Future<void> deletePet({
    required final int petId,
    final String? apiKey,
  }) async {
    var path = '/pet/{petId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'oauth2' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'oauth2' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for petstore_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{petId}', Uri.encodeQueryComponent(petId.toString()));
    if (apiKey != null) {
      headers['api_key'] = apiKey;
    }
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 400) {
      return;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// uploads an image
  Future<SwaggerPetstoreOpenAPI30ApiResponse> uploadFile({
    required final int petId,
    final String? additionalMetadata,
    final String? string,
  }) async {
    var path = '/pet/{petId}/uploadImage';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'oauth2' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'oauth2' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for petstore_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{petId}', Uri.encodeQueryComponent(petId.toString()));
    if (additionalMetadata != null) {
      queryParameters['additionalMetadata'] = additionalMetadata;
    }
    headers['Content-Type'] = 'application/octet-stream';
    if (string != null) {
      body = utf8.encode(string) as Uint8List;
    }
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(SwaggerPetstoreOpenAPI30ApiResponse),
      )! as SwaggerPetstoreOpenAPI30ApiResponse;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }
}

/// Access to Petstore orders
class SwaggerPetstoreOpenAPI30StoreClient {
  SwaggerPetstoreOpenAPI30StoreClient(this._rootClient);

  final SwaggerPetstoreOpenAPI30Client _rootClient;

  /// Returns pet inventories by status
  ///
  /// Returns a map of status codes to quantities
  Future<BuiltMap<String, int>> getInventory() async {
    const path = '/store/inventory';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'apiKey' && a.scheme == 'null').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'apiKey' && a.scheme == 'null').headers,
      );
    } else {
      throw Exception('Missing authentication for api_key');
    }
    // coverage:ignore-end
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(int)]),
      )! as BuiltMap<String, int>;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Place an order for a pet
  ///
  /// Place a new order in the store
  Future<SwaggerPetstoreOpenAPI30Order> placeOrder({final SwaggerPetstoreOpenAPI30Order? order}) async {
    const path = '/store/order';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    headers['Content-Type'] = 'application/json';
    if (order != null) {
      body = utf8.encode(
        json.encode(_jsonSerializers.serialize(order, specifiedType: const FullType(SwaggerPetstoreOpenAPI30Order))),
      ) as Uint8List;
    }
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(SwaggerPetstoreOpenAPI30Order),
      )! as SwaggerPetstoreOpenAPI30Order;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Find purchase order by ID
  ///
  /// For valid response try integer IDs with value <= 5 or > 10. Other values will generate exceptions.
  Future<SwaggerPetstoreOpenAPI30Order> getOrderById({required final int orderId}) async {
    var path = '/store/order/{orderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    path = path.replaceAll('{orderId}', Uri.encodeQueryComponent(orderId.toString()));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(SwaggerPetstoreOpenAPI30Order),
      )! as SwaggerPetstoreOpenAPI30Order;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete purchase order by ID
  ///
  /// For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
  Future<void> deleteOrder({required final int orderId}) async {
    var path = '/store/order/{orderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    path = path.replaceAll('{orderId}', Uri.encodeQueryComponent(orderId.toString()));
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 400 || response.statusCode == 404) {
      return;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }
}

/// Operations about user
class SwaggerPetstoreOpenAPI30UserClient {
  SwaggerPetstoreOpenAPI30UserClient(this._rootClient);

  final SwaggerPetstoreOpenAPI30Client _rootClient;

  /// Create user
  ///
  /// This can only be done by the logged in user.
  Future<void> createUser({final SwaggerPetstoreOpenAPI30User? user}) async {
    const path = '/user';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    headers['Content-Type'] = 'application/json';
    if (user != null) {
      body = utf8.encode(
        json.encode(
          _jsonSerializers.serialize(user, specifiedType: const FullType(SwaggerPetstoreOpenAPI30User)),
        ),
      ) as Uint8List;
    }
    await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
  }

  /// Creates list of users with given input array
  ///
  /// Creates list of users with given input array
  Future<SwaggerPetstoreOpenAPI30User> createUsersWithListInput({
    final BuiltList<SwaggerPetstoreOpenAPI30User>? builtListUser,
  }) async {
    const path = '/user/createWithList';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    headers['Content-Type'] = 'application/json';
    if (builtListUser != null) {
      body = utf8.encode(
        json.encode(
          _jsonSerializers.serialize(
            builtListUser,
            specifiedType: const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30User)]),
          ),
        ),
      ) as Uint8List;
    }
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(SwaggerPetstoreOpenAPI30User),
      )! as SwaggerPetstoreOpenAPI30User;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Logs user into the system
  Future<SwaggerPetstoreOpenAPI30Response<String, SwaggerPetstoreOpenAPI30UserLoginUserHeaders>> loginUser({
    final String? username,
    final String? password,
  }) async {
    const path = '/user/login';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    if (username != null) {
      queryParameters['username'] = username;
    }
    if (password != null) {
      queryParameters['password'] = password;
    }
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return SwaggerPetstoreOpenAPI30Response<String, SwaggerPetstoreOpenAPI30UserLoginUserHeaders>(
        await response.body,
        _jsonSerializers.deserialize(
          response.responseHeaders,
          specifiedType: const FullType(SwaggerPetstoreOpenAPI30UserLoginUserHeaders),
        )! as SwaggerPetstoreOpenAPI30UserLoginUserHeaders,
      );
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Logs out current logged in user session
  Future<void> logoutUser() async {
    const path = '/user/logout';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
  }

  /// Get user by user name
  Future<SwaggerPetstoreOpenAPI30User> getUserByName({required final String username}) async {
    var path = '/user/{username}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/xml,application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    path = path.replaceAll('{username}', Uri.encodeQueryComponent(username));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(SwaggerPetstoreOpenAPI30User),
      )! as SwaggerPetstoreOpenAPI30User;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update user
  ///
  /// This can only be done by the logged in user.
  Future<void> updateUser({
    required final String username,
    final SwaggerPetstoreOpenAPI30User? user,
  }) async {
    var path = '/user/{username}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    path = path.replaceAll('{username}', Uri.encodeQueryComponent(username));
    headers['Content-Type'] = 'application/json';
    if (user != null) {
      body = utf8.encode(
        json.encode(
          _jsonSerializers.serialize(user, specifiedType: const FullType(SwaggerPetstoreOpenAPI30User)),
        ),
      ) as Uint8List;
    }
    await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
  }

  /// Delete user
  ///
  /// This can only be done by the logged in user.
  Future<void> deleteUser({required final String username}) async {
    var path = '/user/{username}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    path = path.replaceAll('{username}', Uri.encodeQueryComponent(username));
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 400 || response.statusCode == 404) {
      return;
    }
    throw await SwaggerPetstoreOpenAPI30ApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30CategoryInterface {
  int? get id;
  String? get name;
  SwaggerPetstoreOpenAPI30CategoryInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30CategoryInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30CategoryInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30Category
    implements
        SwaggerPetstoreOpenAPI30CategoryInterface,
        Built<SwaggerPetstoreOpenAPI30Category, SwaggerPetstoreOpenAPI30CategoryBuilder> {
  factory SwaggerPetstoreOpenAPI30Category([final void Function(SwaggerPetstoreOpenAPI30CategoryBuilder)? b]) =
      _$SwaggerPetstoreOpenAPI30Category;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30Category._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30Category.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<SwaggerPetstoreOpenAPI30Category> get serializer => _$swaggerPetstoreOpenAPI30CategorySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30TagInterface {
  int? get id;
  String? get name;
  SwaggerPetstoreOpenAPI30TagInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30TagInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30TagInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30Tag
    implements
        SwaggerPetstoreOpenAPI30TagInterface,
        Built<SwaggerPetstoreOpenAPI30Tag, SwaggerPetstoreOpenAPI30TagBuilder> {
  factory SwaggerPetstoreOpenAPI30Tag([final void Function(SwaggerPetstoreOpenAPI30TagBuilder)? b]) =
      _$SwaggerPetstoreOpenAPI30Tag;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30Tag._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30Tag.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<SwaggerPetstoreOpenAPI30Tag> get serializer => _$swaggerPetstoreOpenAPI30TagSerializer;
}

class SwaggerPetstoreOpenAPI30Pet_Status extends EnumClass {
  const SwaggerPetstoreOpenAPI30Pet_Status._(super.name);

  static const SwaggerPetstoreOpenAPI30Pet_Status available = _$swaggerPetstoreOpenAPI30PetStatusAvailable;

  static const SwaggerPetstoreOpenAPI30Pet_Status pending = _$swaggerPetstoreOpenAPI30PetStatusPending;

  static const SwaggerPetstoreOpenAPI30Pet_Status sold = _$swaggerPetstoreOpenAPI30PetStatusSold;

  // coverage:ignore-start
  static BuiltSet<SwaggerPetstoreOpenAPI30Pet_Status> get values => _$swaggerPetstoreOpenAPI30PetStatusValues;
  // coverage:ignore-end
  static SwaggerPetstoreOpenAPI30Pet_Status valueOf(final String name) =>
      _$valueOfSwaggerPetstoreOpenAPI30Pet_Status(name);
  static Serializer<SwaggerPetstoreOpenAPI30Pet_Status> get serializer => _$swaggerPetstoreOpenAPI30PetStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30PetInterface {
  int? get id;
  String get name;
  SwaggerPetstoreOpenAPI30Category? get category;
  BuiltList<String> get photoUrls;
  BuiltList<SwaggerPetstoreOpenAPI30Tag>? get tags;

  /// pet status in the store
  SwaggerPetstoreOpenAPI30Pet_Status? get status;
  SwaggerPetstoreOpenAPI30PetInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30PetInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30PetInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30Pet
    implements
        SwaggerPetstoreOpenAPI30PetInterface,
        Built<SwaggerPetstoreOpenAPI30Pet, SwaggerPetstoreOpenAPI30PetBuilder> {
  factory SwaggerPetstoreOpenAPI30Pet([final void Function(SwaggerPetstoreOpenAPI30PetBuilder)? b]) =
      _$SwaggerPetstoreOpenAPI30Pet;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30Pet._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30Pet.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<SwaggerPetstoreOpenAPI30Pet> get serializer => _$swaggerPetstoreOpenAPI30PetSerializer;
}

class SwaggerPetstoreOpenAPI30FindPetsByStatusStatus extends EnumClass {
  const SwaggerPetstoreOpenAPI30FindPetsByStatusStatus._(super.name);

  static const SwaggerPetstoreOpenAPI30FindPetsByStatusStatus available =
      _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusAvailable;

  static const SwaggerPetstoreOpenAPI30FindPetsByStatusStatus pending =
      _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusPending;

  static const SwaggerPetstoreOpenAPI30FindPetsByStatusStatus sold =
      _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusSold;

  // coverage:ignore-start
  static BuiltSet<SwaggerPetstoreOpenAPI30FindPetsByStatusStatus> get values =>
      _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusValues;
  // coverage:ignore-end
  static SwaggerPetstoreOpenAPI30FindPetsByStatusStatus valueOf(final String name) =>
      _$valueOfSwaggerPetstoreOpenAPI30FindPetsByStatusStatus(name);
  static Serializer<SwaggerPetstoreOpenAPI30FindPetsByStatusStatus> get serializer =>
      _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30ApiResponseInterface {
  int? get code;
  String? get type;
  String? get message;
  SwaggerPetstoreOpenAPI30ApiResponseInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30ApiResponseInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30ApiResponseInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30ApiResponse
    implements
        SwaggerPetstoreOpenAPI30ApiResponseInterface,
        Built<SwaggerPetstoreOpenAPI30ApiResponse, SwaggerPetstoreOpenAPI30ApiResponseBuilder> {
  factory SwaggerPetstoreOpenAPI30ApiResponse([final void Function(SwaggerPetstoreOpenAPI30ApiResponseBuilder)? b]) =
      _$SwaggerPetstoreOpenAPI30ApiResponse;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30ApiResponse._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30ApiResponse.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<SwaggerPetstoreOpenAPI30ApiResponse> get serializer =>
      _$swaggerPetstoreOpenAPI30ApiResponseSerializer;
}

class SwaggerPetstoreOpenAPI30Order_Status extends EnumClass {
  const SwaggerPetstoreOpenAPI30Order_Status._(super.name);

  static const SwaggerPetstoreOpenAPI30Order_Status placed = _$swaggerPetstoreOpenAPI30OrderStatusPlaced;

  static const SwaggerPetstoreOpenAPI30Order_Status approved = _$swaggerPetstoreOpenAPI30OrderStatusApproved;

  static const SwaggerPetstoreOpenAPI30Order_Status delivered = _$swaggerPetstoreOpenAPI30OrderStatusDelivered;

  // coverage:ignore-start
  static BuiltSet<SwaggerPetstoreOpenAPI30Order_Status> get values => _$swaggerPetstoreOpenAPI30OrderStatusValues;
  // coverage:ignore-end
  static SwaggerPetstoreOpenAPI30Order_Status valueOf(final String name) =>
      _$valueOfSwaggerPetstoreOpenAPI30Order_Status(name);
  static Serializer<SwaggerPetstoreOpenAPI30Order_Status> get serializer =>
      _$swaggerPetstoreOpenAPI30OrderStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30OrderInterface {
  int? get id;
  int? get petId;
  int? get quantity;
  String? get shipDate;

  /// Order Status
  SwaggerPetstoreOpenAPI30Order_Status? get status;
  bool? get complete;
  SwaggerPetstoreOpenAPI30OrderInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30OrderInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30OrderInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30Order
    implements
        SwaggerPetstoreOpenAPI30OrderInterface,
        Built<SwaggerPetstoreOpenAPI30Order, SwaggerPetstoreOpenAPI30OrderBuilder> {
  factory SwaggerPetstoreOpenAPI30Order([final void Function(SwaggerPetstoreOpenAPI30OrderBuilder)? b]) =
      _$SwaggerPetstoreOpenAPI30Order;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30Order._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30Order.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<SwaggerPetstoreOpenAPI30Order> get serializer => _$swaggerPetstoreOpenAPI30OrderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30UserInterface {
  int? get id;
  String? get username;
  String? get firstName;
  String? get lastName;
  String? get email;
  String? get password;
  String? get phone;

  /// User Status
  int? get userStatus;
  SwaggerPetstoreOpenAPI30UserInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30UserInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30UserInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30User
    implements
        SwaggerPetstoreOpenAPI30UserInterface,
        Built<SwaggerPetstoreOpenAPI30User, SwaggerPetstoreOpenAPI30UserBuilder> {
  factory SwaggerPetstoreOpenAPI30User([final void Function(SwaggerPetstoreOpenAPI30UserBuilder)? b]) =
      _$SwaggerPetstoreOpenAPI30User;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30User._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30User.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<SwaggerPetstoreOpenAPI30User> get serializer => _$swaggerPetstoreOpenAPI30UserSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterface {
  @BuiltValueField(wireName: 'x-rate-limit')
  int? get xRateLimit;
  @BuiltValueField(wireName: 'x-expires-after')
  String? get xExpiresAfter;
  SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30UserLoginUserHeaders
    implements
        SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterface,
        Built<SwaggerPetstoreOpenAPI30UserLoginUserHeaders, SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder> {
  factory SwaggerPetstoreOpenAPI30UserLoginUserHeaders([
    final void Function(SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder)? b,
  ]) = _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30UserLoginUserHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30UserLoginUserHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<SwaggerPetstoreOpenAPI30UserLoginUserHeaders> get serializer =>
      _$SwaggerPetstoreOpenAPI30UserLoginUserHeadersSerializer();
}

class _$SwaggerPetstoreOpenAPI30UserLoginUserHeadersSerializer
    implements StructuredSerializer<SwaggerPetstoreOpenAPI30UserLoginUserHeaders> {
  @override
  final Iterable<Type> types = const [
    SwaggerPetstoreOpenAPI30UserLoginUserHeaders,
    _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders,
  ];

  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30UserLoginUserHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SwaggerPetstoreOpenAPI30UserLoginUserHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  SwaggerPetstoreOpenAPI30UserLoginUserHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'x-rate-limit':
          result.xRateLimit = int.parse(value);
        case 'x-expires-after':
          result.xExpiresAfter = value;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30AddressInterface {
  String? get street;
  String? get city;
  String? get state;
  String? get zip;
  SwaggerPetstoreOpenAPI30AddressInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30AddressInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30AddressInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30Address
    implements
        SwaggerPetstoreOpenAPI30AddressInterface,
        Built<SwaggerPetstoreOpenAPI30Address, SwaggerPetstoreOpenAPI30AddressBuilder> {
  factory SwaggerPetstoreOpenAPI30Address([final void Function(SwaggerPetstoreOpenAPI30AddressBuilder)? b]) =
      _$SwaggerPetstoreOpenAPI30Address;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30Address._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30Address.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<SwaggerPetstoreOpenAPI30Address> get serializer => _$swaggerPetstoreOpenAPI30AddressSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SwaggerPetstoreOpenAPI30CustomerInterface {
  int? get id;
  String? get username;
  BuiltList<SwaggerPetstoreOpenAPI30Address>? get address;
  SwaggerPetstoreOpenAPI30CustomerInterface rebuild(
    final void Function(SwaggerPetstoreOpenAPI30CustomerInterfaceBuilder) updates,
  );
  SwaggerPetstoreOpenAPI30CustomerInterfaceBuilder toBuilder();
}

abstract class SwaggerPetstoreOpenAPI30Customer
    implements
        SwaggerPetstoreOpenAPI30CustomerInterface,
        Built<SwaggerPetstoreOpenAPI30Customer, SwaggerPetstoreOpenAPI30CustomerBuilder> {
  factory SwaggerPetstoreOpenAPI30Customer([final void Function(SwaggerPetstoreOpenAPI30CustomerBuilder)? b]) =
      _$SwaggerPetstoreOpenAPI30Customer;

  // coverage:ignore-start
  const SwaggerPetstoreOpenAPI30Customer._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SwaggerPetstoreOpenAPI30Customer.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<SwaggerPetstoreOpenAPI30Customer> get serializer => _$swaggerPetstoreOpenAPI30CustomerSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(SwaggerPetstoreOpenAPI30Pet), SwaggerPetstoreOpenAPI30Pet.new)
      ..add(SwaggerPetstoreOpenAPI30Pet.serializer)
      ..addBuilderFactory(const FullType(SwaggerPetstoreOpenAPI30Category), SwaggerPetstoreOpenAPI30Category.new)
      ..add(SwaggerPetstoreOpenAPI30Category.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(SwaggerPetstoreOpenAPI30Tag), SwaggerPetstoreOpenAPI30Tag.new)
      ..add(SwaggerPetstoreOpenAPI30Tag.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Tag)]),
        ListBuilder<SwaggerPetstoreOpenAPI30Tag>.new,
      )
      ..add(SwaggerPetstoreOpenAPI30Pet_Status.serializer)
      ..add(SwaggerPetstoreOpenAPI30FindPetsByStatusStatus.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Pet)]),
        ListBuilder<SwaggerPetstoreOpenAPI30Pet>.new,
      )
      ..addBuilderFactory(const FullType(SwaggerPetstoreOpenAPI30ApiResponse), SwaggerPetstoreOpenAPI30ApiResponse.new)
      ..add(SwaggerPetstoreOpenAPI30ApiResponse.serializer)
      ..addBuilderFactory(const FullType(BuiltMap, [FullType(String), FullType(int)]), MapBuilder<String, int>.new)
      ..addBuilderFactory(const FullType(SwaggerPetstoreOpenAPI30Order), SwaggerPetstoreOpenAPI30Order.new)
      ..add(SwaggerPetstoreOpenAPI30Order.serializer)
      ..add(SwaggerPetstoreOpenAPI30Order_Status.serializer)
      ..addBuilderFactory(const FullType(SwaggerPetstoreOpenAPI30User), SwaggerPetstoreOpenAPI30User.new)
      ..add(SwaggerPetstoreOpenAPI30User.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30User)]),
        ListBuilder<SwaggerPetstoreOpenAPI30User>.new,
      )
      ..addBuilderFactory(
        const FullType(SwaggerPetstoreOpenAPI30UserLoginUserHeaders),
        SwaggerPetstoreOpenAPI30UserLoginUserHeaders.new,
      )
      ..add(SwaggerPetstoreOpenAPI30UserLoginUserHeaders.serializer)
      ..addBuilderFactory(const FullType(SwaggerPetstoreOpenAPI30Customer), SwaggerPetstoreOpenAPI30Customer.new)
      ..add(SwaggerPetstoreOpenAPI30Customer.serializer)
      ..addBuilderFactory(const FullType(SwaggerPetstoreOpenAPI30Address), SwaggerPetstoreOpenAPI30Address.new)
      ..add(SwaggerPetstoreOpenAPI30Address.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Address)]),
        ListBuilder<SwaggerPetstoreOpenAPI30Address>.new,
      ))
    .build();

Serializers get swaggerPetstoreOpenAPI30Serializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeSwaggerPetstoreOpenAPI30<T>(final Object data) =>
    _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeSwaggerPetstoreOpenAPI30<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
