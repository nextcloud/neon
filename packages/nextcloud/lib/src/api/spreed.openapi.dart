// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/models.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'spreed.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  AvatarClient get avatar => AvatarClient(this);

  BotClient get bot => BotClient(this);

  BreakoutRoomClient get breakoutRoom => BreakoutRoomClient(this);

  CallClient get call => CallClient(this);

  CertificateClient get certificate => CertificateClient(this);

  ChatClient get chat => ChatClient(this);

  FederationClient get federation => FederationClient(this);

  FilesIntegrationClient get filesIntegration => FilesIntegrationClient(this);

  GuestClient get guest => GuestClient(this);

  HostedSignalingServerClient get hostedSignalingServer => HostedSignalingServerClient(this);

  MatterbridgeClient get matterbridge => MatterbridgeClient(this);

  MatterbridgeSettingsClient get matterbridgeSettings => MatterbridgeSettingsClient(this);

  PollClient get poll => PollClient(this);

  PublicShareAuthClient get publicShareAuth => PublicShareAuthClient(this);

  ReactionClient get reaction => ReactionClient(this);

  RecordingClient get recording => RecordingClient(this);

  RoomClient get room => RoomClient(this);

  SettingsClient get settings => SettingsClient(this);

  SignalingClient get signaling => SignalingClient(this);

  TempAvatarClient get tempAvatar => TempAvatarClient(this);
}

class AvatarClient {
  AvatarClient(this._rootClient);

  final Client _rootClient;

  /// Get the avatar of a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [darkTheme] Theme used for background. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room avatar returned
  ///
  /// See:
  ///  * [getAvatarRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getAvatar({
    required String token,
    int? darkTheme,
    AvatarGetAvatarApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getAvatarRaw(
      token: token,
      darkTheme: darkTheme,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the avatar of a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [darkTheme] Theme used for background. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room avatar returned
  ///
  /// See:
  ///  * [getAvatar] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getAvatarRaw({
    required String token,
    int? darkTheme,
    AvatarGetAvatarApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $darkTheme = jsonSerializers.serialize(darkTheme, specifiedType: const FullType(int));
    $darkTheme ??= 0;
    _parameters['darkTheme'] = $darkTheme;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(AvatarGetAvatarApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/avatar{?darkTheme*}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Upload an avatar for a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar uploaded successfully
  ///   * 400: Avatar invalid
  ///
  /// See:
  ///  * [uploadAvatarRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AvatarUploadAvatarResponseApplicationJson, void>> uploadAvatar({
    required String token,
    AvatarUploadAvatarApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = uploadAvatarRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Upload an avatar for a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar uploaded successfully
  ///   * 400: Avatar invalid
  ///
  /// See:
  ///  * [uploadAvatar] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AvatarUploadAvatarResponseApplicationJson, void> uploadAvatarRaw({
    required String token,
    AvatarUploadAvatarApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(AvatarUploadAvatarApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/avatar').expand(_parameters);
    return DynamiteRawResponse<AvatarUploadAvatarResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(AvatarUploadAvatarResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete the avatar of a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar removed successfully
  ///
  /// See:
  ///  * [deleteAvatarRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AvatarDeleteAvatarResponseApplicationJson, void>> deleteAvatar({
    required String token,
    AvatarDeleteAvatarApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteAvatarRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete the avatar of a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar removed successfully
  ///
  /// See:
  ///  * [deleteAvatar] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AvatarDeleteAvatarResponseApplicationJson, void> deleteAvatarRaw({
    required String token,
    AvatarDeleteAvatarApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(AvatarDeleteAvatarApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/avatar').expand(_parameters);
    return DynamiteRawResponse<AvatarDeleteAvatarResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(AvatarDeleteAvatarResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set an emoji as avatar.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [emoji] Emoji.
  ///   * [color] Color of the emoji.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar set successfully
  ///   * 400: Setting emoji avatar is not possible
  ///
  /// See:
  ///  * [emojiAvatarRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AvatarEmojiAvatarResponseApplicationJson, void>> emojiAvatar({
    required String emoji,
    required String token,
    String? color,
    AvatarEmojiAvatarApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = emojiAvatarRaw(
      emoji: emoji,
      token: token,
      color: color,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set an emoji as avatar.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [emoji] Emoji.
  ///   * [color] Color of the emoji.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar set successfully
  ///   * 400: Setting emoji avatar is not possible
  ///
  /// See:
  ///  * [emojiAvatar] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AvatarEmojiAvatarResponseApplicationJson, void> emojiAvatarRaw({
    required String emoji,
    required String token,
    String? color,
    AvatarEmojiAvatarApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $emoji = jsonSerializers.serialize(emoji, specifiedType: const FullType(String));
    _parameters['emoji'] = $emoji;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $color = jsonSerializers.serialize(color, specifiedType: const FullType(String));
    _parameters['color'] = $color;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(AvatarEmojiAvatarApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/avatar/emoji{?emoji*,color*}')
        .expand(_parameters);
    return DynamiteRawResponse<AvatarEmojiAvatarResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(AvatarEmojiAvatarResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the dark mode avatar of a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room avatar returned
  ///
  /// See:
  ///  * [getAvatarDarkRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getAvatarDark({
    required String token,
    AvatarGetAvatarDarkApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getAvatarDarkRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the dark mode avatar of a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room avatar returned
  ///
  /// See:
  ///  * [getAvatarDark] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getAvatarDarkRaw({
    required String token,
    AvatarGetAvatarDarkApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(AvatarGetAvatarDarkApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/avatar/dark').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class BotClient {
  BotClient(this._rootClient);

  final Client _rootClient;

  /// Sends a new chat message to the given room.
  ///
  /// The author and timestamp are automatically set to the current user/guest and time.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [message] The message to send.
  ///   * [referenceId] For the message to be able to later identify it again. Defaults to `''`.
  ///   * [replyTo] Parent id which this message is a reply to. Defaults to `0`.
  ///   * [silent] If sent silent the chat message will not create any notifications. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token] Conversation token.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Message sent successfully
  ///   * 400: Sending message is not possible
  ///   * 401: Sending message is not allowed
  ///   * 413: Message too long
  ///
  /// See:
  ///  * [sendMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BotSendMessageResponseApplicationJson, void>> sendMessage({
    required String message,
    required String token,
    String? referenceId,
    int? replyTo,
    int? silent,
    BotSendMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = sendMessageRaw(
      message: message,
      token: token,
      referenceId: referenceId,
      replyTo: replyTo,
      silent: silent,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Sends a new chat message to the given room.
  ///
  /// The author and timestamp are automatically set to the current user/guest and time.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [message] The message to send.
  ///   * [referenceId] For the message to be able to later identify it again. Defaults to `''`.
  ///   * [replyTo] Parent id which this message is a reply to. Defaults to `0`.
  ///   * [silent] If sent silent the chat message will not create any notifications. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token] Conversation token.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Message sent successfully
  ///   * 400: Sending message is not possible
  ///   * 401: Sending message is not allowed
  ///   * 413: Message too long
  ///
  /// See:
  ///  * [sendMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BotSendMessageResponseApplicationJson, void> sendMessageRaw({
    required String message,
    required String token,
    String? referenceId,
    int? replyTo,
    int? silent,
    BotSendMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $message = jsonSerializers.serialize(message, specifiedType: const FullType(String));
    _parameters['message'] = $message;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $referenceId = jsonSerializers.serialize(referenceId, specifiedType: const FullType(String));
    $referenceId ??= '';
    _parameters['referenceId'] = $referenceId;

    var $replyTo = jsonSerializers.serialize(replyTo, specifiedType: const FullType(int));
    $replyTo ??= 0;
    _parameters['replyTo'] = $replyTo;

    var $silent = jsonSerializers.serialize(silent, specifiedType: const FullType(int));
    $silent ??= 0;
    _parameters['silent'] = $silent;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BotSendMessageApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/bot/{token}/message{?message*,referenceId*,replyTo*,silent*}',
    ).expand(_parameters);
    return DynamiteRawResponse<BotSendMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201, 400, 401, 413},
      ),
      bodyType: const FullType(BotSendMessageResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Adds a reaction to a chat message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Reaction to add.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token] Conversation token.
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reaction already exists
  ///   * 201: Reacted successfully
  ///   * 400: Reacting is not possible
  ///   * 401: Reacting is not allowed
  ///   * 404: Reaction not found
  ///
  /// See:
  ///  * [reactRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BotReactResponseApplicationJson, void>> react({
    required String reaction,
    required String token,
    required int messageId,
    BotReactApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = reactRaw(
      reaction: reaction,
      token: token,
      messageId: messageId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Adds a reaction to a chat message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Reaction to add.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token] Conversation token.
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reaction already exists
  ///   * 201: Reacted successfully
  ///   * 400: Reacting is not possible
  ///   * 401: Reacting is not allowed
  ///   * 404: Reaction not found
  ///
  /// See:
  ///  * [react] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BotReactResponseApplicationJson, void> reactRaw({
    required String reaction,
    required String token,
    required int messageId,
    BotReactApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $reaction = jsonSerializers.serialize(reaction, specifiedType: const FullType(String));
    _parameters['reaction'] = $reaction;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BotReactApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bot/{token}/reaction/{messageId}{?reaction*}')
        .expand(_parameters);
    return DynamiteRawResponse<BotReactResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 201, 400, 401, 404},
      ),
      bodyType: const FullType(BotReactResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Deletes a reaction from a chat message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Reaction to delete.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token] Conversation token.
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reaction deleted successfully
  ///   * 400: Reacting is not possible
  ///   * 404: Reaction not found
  ///   * 401: Reacting is not allowed
  ///
  /// See:
  ///  * [deleteReactionRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BotDeleteReactionResponseApplicationJson, void>> deleteReaction({
    required String reaction,
    required String token,
    required int messageId,
    BotDeleteReactionApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteReactionRaw(
      reaction: reaction,
      token: token,
      messageId: messageId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Deletes a reaction from a chat message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Reaction to delete.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token] Conversation token.
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reaction deleted successfully
  ///   * 400: Reacting is not possible
  ///   * 404: Reaction not found
  ///   * 401: Reacting is not allowed
  ///
  /// See:
  ///  * [deleteReaction] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BotDeleteReactionResponseApplicationJson, void> deleteReactionRaw({
    required String reaction,
    required String token,
    required int messageId,
    BotDeleteReactionApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $reaction = jsonSerializers.serialize(reaction, specifiedType: const FullType(String));
    _parameters['reaction'] = $reaction;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BotDeleteReactionApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bot/{token}/reaction/{messageId}{?reaction*}')
        .expand(_parameters);
    return DynamiteRawResponse<BotDeleteReactionResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 400, 404, 401},
      ),
      bodyType: const FullType(BotDeleteReactionResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// List admin bots.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bot list returned
  ///
  /// See:
  ///  * [adminListBotsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BotAdminListBotsResponseApplicationJson, void>> adminListBots({
    BotAdminListBotsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = adminListBotsRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// List admin bots.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bot list returned
  ///
  /// See:
  ///  * [adminListBots] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BotAdminListBotsResponseApplicationJson, void> adminListBotsRaw({
    BotAdminListBotsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BotAdminListBotsApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bot/admin').expand(_parameters);
    return DynamiteRawResponse<BotAdminListBotsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BotAdminListBotsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// List bots.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bot list returned
  ///
  /// See:
  ///  * [listBotsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BotListBotsResponseApplicationJson, void>> listBots({
    required String token,
    BotListBotsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = listBotsRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// List bots.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bot list returned
  ///
  /// See:
  ///  * [listBots] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BotListBotsResponseApplicationJson, void> listBotsRaw({
    required String token,
    BotListBotsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BotListBotsApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bot/{token}').expand(_parameters);
    return DynamiteRawResponse<BotListBotsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BotListBotsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Enables a bot.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [botId] ID of the bot.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bot already enabled
  ///   * 201: Bot enabled successfully
  ///   * 400: Enabling bot errored
  ///
  /// See:
  ///  * [enableBotRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BotEnableBotResponseApplicationJson, void>> enableBot({
    required String token,
    required int botId,
    BotEnableBotApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = enableBotRaw(
      token: token,
      botId: botId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Enables a bot.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [botId] ID of the bot.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bot already enabled
  ///   * 201: Bot enabled successfully
  ///   * 400: Enabling bot errored
  ///
  /// See:
  ///  * [enableBot] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BotEnableBotResponseApplicationJson, void> enableBotRaw({
    required String token,
    required int botId,
    BotEnableBotApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $botId = jsonSerializers.serialize(botId, specifiedType: const FullType(int));
    _parameters['botId'] = $botId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BotEnableBotApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bot/{token}/{botId}').expand(_parameters);
    return DynamiteRawResponse<BotEnableBotResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 201},
      ),
      bodyType: const FullType(BotEnableBotResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Disables a bot.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [botId] ID of the bot.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bot disabled successfully
  ///   * 400: Disabling bot errored
  ///
  /// See:
  ///  * [disableBotRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BotDisableBotResponseApplicationJson, void>> disableBot({
    required String token,
    required int botId,
    BotDisableBotApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = disableBotRaw(
      token: token,
      botId: botId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Disables a bot.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [botId] ID of the bot.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bot disabled successfully
  ///   * 400: Disabling bot errored
  ///
  /// See:
  ///  * [disableBot] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BotDisableBotResponseApplicationJson, void> disableBotRaw({
    required String token,
    required int botId,
    BotDisableBotApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $botId = jsonSerializers.serialize(botId, specifiedType: const FullType(int));
    _parameters['botId'] = $botId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BotDisableBotApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bot/{token}/{botId}').expand(_parameters);
    return DynamiteRawResponse<BotDisableBotResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BotDisableBotResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class BreakoutRoomClient {
  BreakoutRoomClient(this._rootClient);

  final Client _rootClient;

  /// Configure the breakout rooms.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [mode] Mode of the breakout rooms.
  ///   * [amount] Number of breakout rooms.
  ///   * [attendeeMap] Mapping of the attendees to breakout rooms. Defaults to `[]`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms configured successfully
  ///   * 400: Configuring breakout rooms errored
  ///
  /// See:
  ///  * [configureBreakoutRoomsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson, void>> configureBreakoutRooms({
    required int mode,
    required int amount,
    required String token,
    String? attendeeMap,
    BreakoutRoomConfigureBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = configureBreakoutRoomsRaw(
      mode: mode,
      amount: amount,
      token: token,
      attendeeMap: attendeeMap,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Configure the breakout rooms.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [mode] Mode of the breakout rooms.
  ///   * [amount] Number of breakout rooms.
  ///   * [attendeeMap] Mapping of the attendees to breakout rooms. Defaults to `[]`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms configured successfully
  ///   * 400: Configuring breakout rooms errored
  ///
  /// See:
  ///  * [configureBreakoutRooms] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson, void> configureBreakoutRoomsRaw({
    required int mode,
    required int amount,
    required String token,
    String? attendeeMap,
    BreakoutRoomConfigureBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $mode = jsonSerializers.serialize(mode, specifiedType: const FullType(int));
    _parameters['mode'] = $mode;

    final $amount = jsonSerializers.serialize(amount, specifiedType: const FullType(int));
    _parameters['amount'] = $amount;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $attendeeMap = jsonSerializers.serialize(attendeeMap, specifiedType: const FullType(String));
    $attendeeMap ??= '[]';
    _parameters['attendeeMap'] = $attendeeMap;

    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(BreakoutRoomConfigureBreakoutRoomsApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}{?mode*,amount*,attendeeMap*}')
            .expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Remove the breakout rooms.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms removed successfully
  ///
  /// See:
  ///  * [removeBreakoutRoomsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson, void>> removeBreakoutRooms({
    required String token,
    BreakoutRoomRemoveBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = removeBreakoutRoomsRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove the breakout rooms.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms removed successfully
  ///
  /// See:
  ///  * [removeBreakoutRooms] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson, void> removeBreakoutRoomsRaw({
    required String token,
    BreakoutRoomRemoveBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BreakoutRoomRemoveBreakoutRoomsApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}').expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Broadcast a chat message to all breakout rooms.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [message] Message to broadcast.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Chat message broadcasted successfully
  ///   * 400: Broadcasting chat message is not possible
  ///   * 413: Chat message too long
  ///
  /// See:
  ///  * [broadcastChatMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomBroadcastChatMessageResponseApplicationJson, void>> broadcastChatMessage({
    required String message,
    required String token,
    BreakoutRoomBroadcastChatMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = broadcastChatMessageRaw(
      message: message,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Broadcast a chat message to all breakout rooms.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [message] Message to broadcast.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Chat message broadcasted successfully
  ///   * 400: Broadcasting chat message is not possible
  ///   * 413: Chat message too long
  ///
  /// See:
  ///  * [broadcastChatMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomBroadcastChatMessageResponseApplicationJson, void> broadcastChatMessageRaw({
    required String message,
    required String token,
    BreakoutRoomBroadcastChatMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $message = jsonSerializers.serialize(message, specifiedType: const FullType(String));
    _parameters['message'] = $message;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(BreakoutRoomBroadcastChatMessageApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}/broadcast{?message*}')
        .expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomBroadcastChatMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201},
      ),
      bodyType: const FullType(BreakoutRoomBroadcastChatMessageResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Apply an attendee map to the breakout rooms.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeMap] JSON encoded mapping of the attendees to breakout rooms `array<int, int>`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee map applied successfully
  ///   * 400: Applying attendee map is not possible
  ///
  /// See:
  ///  * [applyAttendeeMapRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomApplyAttendeeMapResponseApplicationJson, void>> applyAttendeeMap({
    required String attendeeMap,
    required String token,
    BreakoutRoomApplyAttendeeMapApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = applyAttendeeMapRaw(
      attendeeMap: attendeeMap,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Apply an attendee map to the breakout rooms.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeMap] JSON encoded mapping of the attendees to breakout rooms `array<int, int>`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee map applied successfully
  ///   * 400: Applying attendee map is not possible
  ///
  /// See:
  ///  * [applyAttendeeMap] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomApplyAttendeeMapResponseApplicationJson, void> applyAttendeeMapRaw({
    required String attendeeMap,
    required String token,
    BreakoutRoomApplyAttendeeMapApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $attendeeMap = jsonSerializers.serialize(attendeeMap, specifiedType: const FullType(String));
    _parameters['attendeeMap'] = $attendeeMap;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BreakoutRoomApplyAttendeeMapApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}/attendees{?attendeeMap*}')
            .expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomApplyAttendeeMapResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BreakoutRoomApplyAttendeeMapResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Request assistance.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Assistance requested successfully
  ///   * 400: Requesting assistance is not possible
  ///
  /// See:
  ///  * [requestAssistanceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomRequestAssistanceResponseApplicationJson, void>> requestAssistance({
    required String token,
    BreakoutRoomRequestAssistanceApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = requestAssistanceRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Request assistance.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Assistance requested successfully
  ///   * 400: Requesting assistance is not possible
  ///
  /// See:
  ///  * [requestAssistance] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomRequestAssistanceResponseApplicationJson, void> requestAssistanceRaw({
    required String token,
    BreakoutRoomRequestAssistanceApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BreakoutRoomRequestAssistanceApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}/request-assistance')
        .expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomRequestAssistanceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BreakoutRoomRequestAssistanceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Reset the request for assistance.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Request for assistance reset successfully
  ///   * 400: Resetting the request for assistance is not possible
  ///
  /// See:
  ///  * [resetRequestForAssistanceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomResetRequestForAssistanceResponseApplicationJson, void>>
      resetRequestForAssistance({
    required String token,
    BreakoutRoomResetRequestForAssistanceApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = resetRequestForAssistanceRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Reset the request for assistance.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Request for assistance reset successfully
  ///   * 400: Resetting the request for assistance is not possible
  ///
  /// See:
  ///  * [resetRequestForAssistance] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomResetRequestForAssistanceResponseApplicationJson, void> resetRequestForAssistanceRaw({
    required String token,
    BreakoutRoomResetRequestForAssistanceApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(BreakoutRoomResetRequestForAssistanceApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}/request-assistance')
        .expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomResetRequestForAssistanceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BreakoutRoomResetRequestForAssistanceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Start the breakout rooms.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms started successfully
  ///   * 400: Starting breakout rooms is not possible
  ///
  /// See:
  ///  * [startBreakoutRoomsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomStartBreakoutRoomsResponseApplicationJson, void>> startBreakoutRooms({
    required String token,
    BreakoutRoomStartBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = startBreakoutRoomsRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Start the breakout rooms.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms started successfully
  ///   * 400: Starting breakout rooms is not possible
  ///
  /// See:
  ///  * [startBreakoutRooms] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomStartBreakoutRoomsResponseApplicationJson, void> startBreakoutRoomsRaw({
    required String token,
    BreakoutRoomStartBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BreakoutRoomStartBreakoutRoomsApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}/rooms').expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomStartBreakoutRoomsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BreakoutRoomStartBreakoutRoomsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Stop the breakout rooms.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms stopped successfully
  ///   * 400: Stopping breakout rooms is not possible
  ///
  /// See:
  ///  * [stopBreakoutRoomsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomStopBreakoutRoomsResponseApplicationJson, void>> stopBreakoutRooms({
    required String token,
    BreakoutRoomStopBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = stopBreakoutRoomsRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Stop the breakout rooms.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms stopped successfully
  ///   * 400: Stopping breakout rooms is not possible
  ///
  /// See:
  ///  * [stopBreakoutRooms] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomStopBreakoutRoomsResponseApplicationJson, void> stopBreakoutRoomsRaw({
    required String token,
    BreakoutRoomStopBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BreakoutRoomStopBreakoutRoomsApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}/rooms').expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomStopBreakoutRoomsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BreakoutRoomStopBreakoutRoomsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Switch to another breakout room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [target] Target breakout room.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Switched to breakout room successfully
  ///   * 400: Switching to breakout room is not possible
  ///
  /// See:
  ///  * [switchBreakoutRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BreakoutRoomSwitchBreakoutRoomResponseApplicationJson, void>> switchBreakoutRoom({
    required String target,
    required String token,
    BreakoutRoomSwitchBreakoutRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = switchBreakoutRoomRaw(
      target: target,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Switch to another breakout room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [target] Target breakout room.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Switched to breakout room successfully
  ///   * 400: Switching to breakout room is not possible
  ///
  /// See:
  ///  * [switchBreakoutRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BreakoutRoomSwitchBreakoutRoomResponseApplicationJson, void> switchBreakoutRoomRaw({
    required String target,
    required String token,
    BreakoutRoomSwitchBreakoutRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $target = jsonSerializers.serialize(target, specifiedType: const FullType(String));
    _parameters['target'] = $target;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(BreakoutRoomSwitchBreakoutRoomApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/breakout-rooms/{token}/switch{?target*}')
        .expand(_parameters);
    return DynamiteRawResponse<BreakoutRoomSwitchBreakoutRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(BreakoutRoomSwitchBreakoutRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class CallClient {
  CallClient(this._rootClient);

  final Client _rootClient;

  /// Get the peers for a call.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: List of peers in the call returned
  ///
  /// See:
  ///  * [getPeersForCallRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CallGetPeersForCallResponseApplicationJson, void>> getPeersForCall({
    required String token,
    CallGetPeersForCallApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getPeersForCallRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the peers for a call.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: List of peers in the call returned
  ///
  /// See:
  ///  * [getPeersForCall] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CallGetPeersForCallResponseApplicationJson, void> getPeersForCallRaw({
    required String token,
    CallGetPeersForCallApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(CallGetPeersForCallApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/call/{token}').expand(_parameters);
    return DynamiteRawResponse<CallGetPeersForCallResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CallGetPeersForCallResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update the in-call flags.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [flags] New flags.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: In-call flags updated successfully
  ///   * 400: Updating in-call flags is not possible
  ///   * 404: Call session not found
  ///
  /// See:
  ///  * [updateCallFlagsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CallUpdateCallFlagsResponseApplicationJson, void>> updateCallFlags({
    required int flags,
    required String token,
    CallUpdateCallFlagsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = updateCallFlagsRaw(
      flags: flags,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the in-call flags.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [flags] New flags.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: In-call flags updated successfully
  ///   * 400: Updating in-call flags is not possible
  ///   * 404: Call session not found
  ///
  /// See:
  ///  * [updateCallFlags] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CallUpdateCallFlagsResponseApplicationJson, void> updateCallFlagsRaw({
    required int flags,
    required String token,
    CallUpdateCallFlagsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $flags = jsonSerializers.serialize(flags, specifiedType: const FullType(int));
    _parameters['flags'] = $flags;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(CallUpdateCallFlagsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/call/{token}{?flags*}').expand(_parameters);
    return DynamiteRawResponse<CallUpdateCallFlagsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200, 400, 404},
      ),
      bodyType: const FullType(CallUpdateCallFlagsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Join a call.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [flags] In-Call flags.
  ///   * [forcePermissions] In-call permissions.
  ///   * [silent] Join the call silently. Defaults to `0`.
  ///   * [recordingConsent] When the user ticked a checkbox and agreed with being recorded (Only needed when the `config => call => recording-consent` capability is set to {@see RecordingService::CONSENT_REQUIRED_YES} or the capability is {@see RecordingService::CONSENT_REQUIRED_OPTIONAL} and the conversation `recordingConsent` value is {@see RecordingService::CONSENT_REQUIRED_YES} ). Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Call joined successfully
  ///   * 404: Call not found
  ///   * 400: No recording consent was given
  ///
  /// See:
  ///  * [joinCallRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CallJoinCallResponseApplicationJson, void>> joinCall({
    required String token,
    int? flags,
    int? forcePermissions,
    int? silent,
    int? recordingConsent,
    CallJoinCallApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = joinCallRaw(
      token: token,
      flags: flags,
      forcePermissions: forcePermissions,
      silent: silent,
      recordingConsent: recordingConsent,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Join a call.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [flags] In-Call flags.
  ///   * [forcePermissions] In-call permissions.
  ///   * [silent] Join the call silently. Defaults to `0`.
  ///   * [recordingConsent] When the user ticked a checkbox and agreed with being recorded (Only needed when the `config => call => recording-consent` capability is set to {@see RecordingService::CONSENT_REQUIRED_YES} or the capability is {@see RecordingService::CONSENT_REQUIRED_OPTIONAL} and the conversation `recordingConsent` value is {@see RecordingService::CONSENT_REQUIRED_YES} ). Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Call joined successfully
  ///   * 404: Call not found
  ///   * 400: No recording consent was given
  ///
  /// See:
  ///  * [joinCall] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CallJoinCallResponseApplicationJson, void> joinCallRaw({
    required String token,
    int? flags,
    int? forcePermissions,
    int? silent,
    int? recordingConsent,
    CallJoinCallApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $flags = jsonSerializers.serialize(flags, specifiedType: const FullType(int));
    _parameters['flags'] = $flags;

    final $forcePermissions = jsonSerializers.serialize(forcePermissions, specifiedType: const FullType(int));
    _parameters['forcePermissions'] = $forcePermissions;

    var $silent = jsonSerializers.serialize(silent, specifiedType: const FullType(int));
    $silent ??= 0;
    _parameters['silent'] = $silent;

    var $recordingConsent = jsonSerializers.serialize(recordingConsent, specifiedType: const FullType(int));
    $recordingConsent ??= 0;
    _parameters['recordingConsent'] = $recordingConsent;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(CallJoinCallApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/call/{token}{?flags*,forcePermissions*,silent*,recordingConsent*}',
    ).expand(_parameters);
    return DynamiteRawResponse<CallJoinCallResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 404},
      ),
      bodyType: const FullType(CallJoinCallResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Leave a call.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [all] whether to also terminate the call for all participants. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Call left successfully
  ///   * 404: Call session not found
  ///
  /// See:
  ///  * [leaveCallRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CallLeaveCallResponseApplicationJson, void>> leaveCall({
    required String token,
    int? all,
    CallLeaveCallApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = leaveCallRaw(
      token: token,
      all: all,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Leave a call.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [all] whether to also terminate the call for all participants. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Call left successfully
  ///   * 404: Call session not found
  ///
  /// See:
  ///  * [leaveCall] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CallLeaveCallResponseApplicationJson, void> leaveCallRaw({
    required String token,
    int? all,
    CallLeaveCallApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $all = jsonSerializers.serialize(all, specifiedType: const FullType(int));
    $all ??= 0;
    _parameters['all'] = $all;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(CallLeaveCallApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/call/{token}{?all*}').expand(_parameters);
    return DynamiteRawResponse<CallLeaveCallResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 404},
      ),
      bodyType: const FullType(CallLeaveCallResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Ring an attendee.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [attendeeId] ID of the attendee to ring.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee rang successfully
  ///   * 400: Ringing attendee is not possible
  ///
  /// See:
  ///  * [ringAttendeeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CallRingAttendeeResponseApplicationJson, void>> ringAttendee({
    required String token,
    required int attendeeId,
    CallRingAttendeeApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = ringAttendeeRaw(
      token: token,
      attendeeId: attendeeId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Ring an attendee.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [attendeeId] ID of the attendee to ring.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee rang successfully
  ///   * 400: Ringing attendee is not possible
  ///
  /// See:
  ///  * [ringAttendee] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CallRingAttendeeResponseApplicationJson, void> ringAttendeeRaw({
    required String token,
    required int attendeeId,
    CallRingAttendeeApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $attendeeId = jsonSerializers.serialize(attendeeId, specifiedType: const FullType(int));
    _parameters['attendeeId'] = $attendeeId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(CallRingAttendeeApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/call/{token}/ring/{attendeeId}').expand(_parameters);
    return DynamiteRawResponse<CallRingAttendeeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(CallRingAttendeeResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Call a SIP dial-out attendee.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [attendeeId] ID of the attendee to call.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Dial-out initiated successfully
  ///   * 400: SIP dial-out not possible
  ///   * 404: Participant could not be found or is a wrong type
  ///   * 501: SIP dial-out is not configured on the server
  ///
  /// See:
  ///  * [sipDialOutRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CallSipDialOutResponseApplicationJson, void>> sipDialOut({
    required String token,
    required int attendeeId,
    CallSipDialOutApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = sipDialOutRaw(
      token: token,
      attendeeId: attendeeId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Call a SIP dial-out attendee.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [attendeeId] ID of the attendee to call.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Dial-out initiated successfully
  ///   * 400: SIP dial-out not possible
  ///   * 404: Participant could not be found or is a wrong type
  ///   * 501: SIP dial-out is not configured on the server
  ///
  /// See:
  ///  * [sipDialOut] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CallSipDialOutResponseApplicationJson, void> sipDialOutRaw({
    required String token,
    required int attendeeId,
    CallSipDialOutApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $attendeeId = jsonSerializers.serialize(attendeeId, specifiedType: const FullType(int));
    _parameters['attendeeId'] = $attendeeId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(CallSipDialOutApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/call/{token}/dialout/{attendeeId}').expand(_parameters);
    return DynamiteRawResponse<CallSipDialOutResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201, 400, 404, 501},
      ),
      bodyType: const FullType(CallSipDialOutResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class CertificateClient {
  CertificateClient(this._rootClient);

  final Client _rootClient;

  /// Get the certificate expiration for a host.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [host] Host to check.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Certificate expiration returned
  ///   * 400: Getting certificate expiration is not possible
  ///
  /// See:
  ///  * [getCertificateExpirationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CertificateGetCertificateExpirationResponseApplicationJson, void>> getCertificateExpiration({
    required String host,
    CertificateGetCertificateExpirationApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getCertificateExpirationRaw(
      host: host,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the certificate expiration for a host.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [host] Host to check.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Certificate expiration returned
  ///   * 400: Getting certificate expiration is not possible
  ///
  /// See:
  ///  * [getCertificateExpiration] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CertificateGetCertificateExpirationResponseApplicationJson, void> getCertificateExpirationRaw({
    required String host,
    CertificateGetCertificateExpirationApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $host = jsonSerializers.serialize(host, specifiedType: const FullType(String));
    _parameters['host'] = $host;

    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(CertificateGetCertificateExpirationApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/certificate/expiration{?host*}').expand(_parameters);
    return DynamiteRawResponse<CertificateGetCertificateExpirationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CertificateGetCertificateExpirationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class ChatClient {
  ChatClient(this._rootClient);

  final Client _rootClient;

  /// Receives chat messages from the given room.
  ///
  /// - Receiving the history ($lookIntoFuture=0): The next $limit messages after $lastKnownMessageId will be returned. The new $lastKnownMessageId for the follow up query is available as `X-Chat-Last-Given` header.
  /// - Looking into the future ($lookIntoFuture=1): If there are currently no messages the response will not be sent immediately. Instead, HTTP connection will be kept open waiting for new messages to arrive and, when they do, then the response will be sent. The connection will not be kept open indefinitely, though; the number of seconds to wait for new messages to arrive can be set using the timeout parameter; the default timeout is 30 seconds, maximum timeout is 60 seconds. If the timeout ends a successful but empty response will be sent. If messages have been returned (status=200) the new $lastKnownMessageId for the follow up query is available as `X-Chat-Last-Given` header.
  /// The limit specifies the maximum number of messages that will be returned, although the actual number of returned messages could be lower if some messages are not visible to the participant. Note that if none of the messages are visible to the participant the returned number of messages will be 0, yet the status will still be 200. Also note that `X-Chat-Last-Given` may reference a message not visible and thus not returned, but it should be used nevertheless as the $lastKnownMessageId for the follow-up query.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [lookIntoFuture] Polling for new messages (1) or getting the history of the chat (0).
  ///   * [limit] Number of chat messages to receive (100 by default, 200 at most). Defaults to `100`.
  ///   * [lastKnownMessageId] The last known message (serves as offset). Defaults to `0`.
  ///   * [lastCommonReadId] The last known common read message (so the response is 200 instead of 304 when it changes even when there are no messages). Defaults to `0`.
  ///   * [timeout] Number of seconds to wait for new messages (30 by default, 30 at most). Defaults to `30`.
  ///   * [setReadMarker] Automatically set the last read marker when 1, if your client does this itself via chat/{token}/read set to 0. Defaults to `1`.
  ///   * [includeLastKnown] Include the $lastKnownMessageId in the messages when 1 (default 0). Defaults to `0`.
  ///   * [noStatusUpdate] When the user status should not be automatically set to online set to 1 (default 0). Defaults to `0`.
  ///   * [markNotificationsAsRead] Set to 0 when notifications should not be marked as read (default 1). Defaults to `1`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Messages returned
  ///   * 304: No messages
  ///
  /// See:
  ///  * [receiveMessagesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatReceiveMessagesResponseApplicationJson, ChatChatReceiveMessagesHeaders>> receiveMessages({
    required int lookIntoFuture,
    required String token,
    int? limit,
    int? lastKnownMessageId,
    int? lastCommonReadId,
    int? timeout,
    int? setReadMarker,
    int? includeLastKnown,
    int? noStatusUpdate,
    int? markNotificationsAsRead,
    ChatReceiveMessagesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = receiveMessagesRaw(
      lookIntoFuture: lookIntoFuture,
      token: token,
      limit: limit,
      lastKnownMessageId: lastKnownMessageId,
      lastCommonReadId: lastCommonReadId,
      timeout: timeout,
      setReadMarker: setReadMarker,
      includeLastKnown: includeLastKnown,
      noStatusUpdate: noStatusUpdate,
      markNotificationsAsRead: markNotificationsAsRead,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Receives chat messages from the given room.
  ///
  /// - Receiving the history ($lookIntoFuture=0): The next $limit messages after $lastKnownMessageId will be returned. The new $lastKnownMessageId for the follow up query is available as `X-Chat-Last-Given` header.
  /// - Looking into the future ($lookIntoFuture=1): If there are currently no messages the response will not be sent immediately. Instead, HTTP connection will be kept open waiting for new messages to arrive and, when they do, then the response will be sent. The connection will not be kept open indefinitely, though; the number of seconds to wait for new messages to arrive can be set using the timeout parameter; the default timeout is 30 seconds, maximum timeout is 60 seconds. If the timeout ends a successful but empty response will be sent. If messages have been returned (status=200) the new $lastKnownMessageId for the follow up query is available as `X-Chat-Last-Given` header.
  /// The limit specifies the maximum number of messages that will be returned, although the actual number of returned messages could be lower if some messages are not visible to the participant. Note that if none of the messages are visible to the participant the returned number of messages will be 0, yet the status will still be 200. Also note that `X-Chat-Last-Given` may reference a message not visible and thus not returned, but it should be used nevertheless as the $lastKnownMessageId for the follow-up query.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [lookIntoFuture] Polling for new messages (1) or getting the history of the chat (0).
  ///   * [limit] Number of chat messages to receive (100 by default, 200 at most). Defaults to `100`.
  ///   * [lastKnownMessageId] The last known message (serves as offset). Defaults to `0`.
  ///   * [lastCommonReadId] The last known common read message (so the response is 200 instead of 304 when it changes even when there are no messages). Defaults to `0`.
  ///   * [timeout] Number of seconds to wait for new messages (30 by default, 30 at most). Defaults to `30`.
  ///   * [setReadMarker] Automatically set the last read marker when 1, if your client does this itself via chat/{token}/read set to 0. Defaults to `1`.
  ///   * [includeLastKnown] Include the $lastKnownMessageId in the messages when 1 (default 0). Defaults to `0`.
  ///   * [noStatusUpdate] When the user status should not be automatically set to online set to 1 (default 0). Defaults to `0`.
  ///   * [markNotificationsAsRead] Set to 0 when notifications should not be marked as read (default 1). Defaults to `1`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Messages returned
  ///   * 304: No messages
  ///
  /// See:
  ///  * [receiveMessages] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatReceiveMessagesResponseApplicationJson, ChatChatReceiveMessagesHeaders> receiveMessagesRaw({
    required int lookIntoFuture,
    required String token,
    int? limit,
    int? lastKnownMessageId,
    int? lastCommonReadId,
    int? timeout,
    int? setReadMarker,
    int? includeLastKnown,
    int? noStatusUpdate,
    int? markNotificationsAsRead,
    ChatReceiveMessagesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $lookIntoFuture = jsonSerializers.serialize(lookIntoFuture, specifiedType: const FullType(int));
    _parameters['lookIntoFuture'] = $lookIntoFuture;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 100;
    _parameters['limit'] = $limit;

    var $lastKnownMessageId = jsonSerializers.serialize(lastKnownMessageId, specifiedType: const FullType(int));
    $lastKnownMessageId ??= 0;
    _parameters['lastKnownMessageId'] = $lastKnownMessageId;

    var $lastCommonReadId = jsonSerializers.serialize(lastCommonReadId, specifiedType: const FullType(int));
    $lastCommonReadId ??= 0;
    _parameters['lastCommonReadId'] = $lastCommonReadId;

    var $timeout = jsonSerializers.serialize(timeout, specifiedType: const FullType(int));
    $timeout ??= 30;
    _parameters['timeout'] = $timeout;

    var $setReadMarker = jsonSerializers.serialize(setReadMarker, specifiedType: const FullType(int));
    $setReadMarker ??= 1;
    _parameters['setReadMarker'] = $setReadMarker;

    var $includeLastKnown = jsonSerializers.serialize(includeLastKnown, specifiedType: const FullType(int));
    $includeLastKnown ??= 0;
    _parameters['includeLastKnown'] = $includeLastKnown;

    var $noStatusUpdate = jsonSerializers.serialize(noStatusUpdate, specifiedType: const FullType(int));
    $noStatusUpdate ??= 0;
    _parameters['noStatusUpdate'] = $noStatusUpdate;

    var $markNotificationsAsRead =
        jsonSerializers.serialize(markNotificationsAsRead, specifiedType: const FullType(int));
    $markNotificationsAsRead ??= 1;
    _parameters['markNotificationsAsRead'] = $markNotificationsAsRead;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatReceiveMessagesApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}{?lookIntoFuture*,limit*,lastKnownMessageId*,lastCommonReadId*,timeout*,setReadMarker*,includeLastKnown*,noStatusUpdate*,markNotificationsAsRead*}',
    ).expand(_parameters);
    return DynamiteRawResponse<ChatReceiveMessagesResponseApplicationJson, ChatChatReceiveMessagesHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200, 304},
      ),
      bodyType: const FullType(ChatReceiveMessagesResponseApplicationJson),
      headersType: const FullType(ChatChatReceiveMessagesHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Sends a new chat message to the given room.
  ///
  /// The author and timestamp are automatically set to the current user/guest and time.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [message] the message to send.
  ///   * [actorDisplayName] for guests. Defaults to `''`.
  ///   * [referenceId] for the message to be able to later identify it again. Defaults to `''`.
  ///   * [replyTo] Parent id which this message is a reply to. Defaults to `0`.
  ///   * [silent] If sent silent the chat message will not create any notifications. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Message sent successfully
  ///   * 400: Sending message is not possible
  ///   * 404: Actor not found
  ///   * 413: Message too long
  ///
  /// See:
  ///  * [sendMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatSendMessageResponseApplicationJson, ChatChatSendMessageHeaders>> sendMessage({
    required String message,
    required String token,
    String? actorDisplayName,
    String? referenceId,
    int? replyTo,
    int? silent,
    ChatSendMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = sendMessageRaw(
      message: message,
      token: token,
      actorDisplayName: actorDisplayName,
      referenceId: referenceId,
      replyTo: replyTo,
      silent: silent,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Sends a new chat message to the given room.
  ///
  /// The author and timestamp are automatically set to the current user/guest and time.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [message] the message to send.
  ///   * [actorDisplayName] for guests. Defaults to `''`.
  ///   * [referenceId] for the message to be able to later identify it again. Defaults to `''`.
  ///   * [replyTo] Parent id which this message is a reply to. Defaults to `0`.
  ///   * [silent] If sent silent the chat message will not create any notifications. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Message sent successfully
  ///   * 400: Sending message is not possible
  ///   * 404: Actor not found
  ///   * 413: Message too long
  ///
  /// See:
  ///  * [sendMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatSendMessageResponseApplicationJson, ChatChatSendMessageHeaders> sendMessageRaw({
    required String message,
    required String token,
    String? actorDisplayName,
    String? referenceId,
    int? replyTo,
    int? silent,
    ChatSendMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $message = jsonSerializers.serialize(message, specifiedType: const FullType(String));
    _parameters['message'] = $message;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $actorDisplayName = jsonSerializers.serialize(actorDisplayName, specifiedType: const FullType(String));
    $actorDisplayName ??= '';
    _parameters['actorDisplayName'] = $actorDisplayName;

    var $referenceId = jsonSerializers.serialize(referenceId, specifiedType: const FullType(String));
    $referenceId ??= '';
    _parameters['referenceId'] = $referenceId;

    var $replyTo = jsonSerializers.serialize(replyTo, specifiedType: const FullType(int));
    $replyTo ??= 0;
    _parameters['replyTo'] = $replyTo;

    var $silent = jsonSerializers.serialize(silent, specifiedType: const FullType(int));
    $silent ??= 0;
    _parameters['silent'] = $silent;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatSendMessageApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}{?message*,actorDisplayName*,referenceId*,replyTo*,silent*}',
    ).expand(_parameters);
    return DynamiteRawResponse<ChatSendMessageResponseApplicationJson, ChatChatSendMessageHeaders>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201},
      ),
      bodyType: const FullType(ChatSendMessageResponseApplicationJson),
      headersType: const FullType(ChatChatSendMessageHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Clear the chat history.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: History cleared successfully
  ///   * 202: History cleared successfully, but Matterbridge is configured, so the information can be replicated elsewhere
  ///   * 403: Missing permissions to clear history
  ///
  /// See:
  ///  * [clearHistoryRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatClearHistoryResponseApplicationJson, ChatChatClearHistoryHeaders>> clearHistory({
    required String token,
    ChatClearHistoryApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = clearHistoryRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Clear the chat history.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: History cleared successfully
  ///   * 202: History cleared successfully, but Matterbridge is configured, so the information can be replicated elsewhere
  ///   * 403: Missing permissions to clear history
  ///
  /// See:
  ///  * [clearHistory] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatClearHistoryResponseApplicationJson, ChatChatClearHistoryHeaders> clearHistoryRaw({
    required String token,
    ChatClearHistoryApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatClearHistoryApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}').expand(_parameters);
    return DynamiteRawResponse<ChatClearHistoryResponseApplicationJson, ChatChatClearHistoryHeaders>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 202},
      ),
      bodyType: const FullType(ChatClearHistoryResponseApplicationJson),
      headersType: const FullType(ChatChatClearHistoryHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Delete a chat message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Message deleted successfully
  ///   * 202: Message deleted successfully, but Matterbridge is configured, so the information can be replicated elsewhere
  ///   * 400: Deleting message is not possible
  ///   * 403: Missing permissions to delete message
  ///   * 404: Message not found
  ///   * 405: Deleting message is not allowed
  ///
  /// See:
  ///  * [deleteMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatDeleteMessageResponseApplicationJson, ChatChatDeleteMessageHeaders>> deleteMessage({
    required String token,
    required int messageId,
    ChatDeleteMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteMessageRaw(
      token: token,
      messageId: messageId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a chat message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Message deleted successfully
  ///   * 202: Message deleted successfully, but Matterbridge is configured, so the information can be replicated elsewhere
  ///   * 400: Deleting message is not possible
  ///   * 403: Missing permissions to delete message
  ///   * 404: Message not found
  ///   * 405: Deleting message is not allowed
  ///
  /// See:
  ///  * [deleteMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatDeleteMessageResponseApplicationJson, ChatChatDeleteMessageHeaders> deleteMessageRaw({
    required String token,
    required int messageId,
    ChatDeleteMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatDeleteMessageApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/{messageId}').expand(_parameters);
    return DynamiteRawResponse<ChatDeleteMessageResponseApplicationJson, ChatChatDeleteMessageHeaders>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 202},
      ),
      bodyType: const FullType(ChatDeleteMessageResponseApplicationJson),
      headersType: const FullType(ChatChatDeleteMessageHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Get the context of a message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Number of chat messages to receive in both directions (50 by default, 100 at most, might return 201 messages). Defaults to `50`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] The focused message which should be in the "middle" of the returned context.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Message context returned
  ///   * 304: No messages
  ///
  /// See:
  ///  * [getMessageContextRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatGetMessageContextResponseApplicationJson, ChatChatGetMessageContextHeaders>>
      getMessageContext({
    required String token,
    required int messageId,
    int? limit,
    ChatGetMessageContextApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getMessageContextRaw(
      token: token,
      messageId: messageId,
      limit: limit,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the context of a message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Number of chat messages to receive in both directions (50 by default, 100 at most, might return 201 messages). Defaults to `50`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] The focused message which should be in the "middle" of the returned context.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Message context returned
  ///   * 304: No messages
  ///
  /// See:
  ///  * [getMessageContext] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatGetMessageContextResponseApplicationJson, ChatChatGetMessageContextHeaders>
      getMessageContextRaw({
    required String token,
    required int messageId,
    int? limit,
    ChatGetMessageContextApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 50;
    _parameters['limit'] = $limit;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatGetMessageContextApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/{messageId}/context{?limit*}')
        .expand(_parameters);
    return DynamiteRawResponse<ChatGetMessageContextResponseApplicationJson, ChatChatGetMessageContextHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200, 304},
      ),
      bodyType: const FullType(ChatGetMessageContextResponseApplicationJson),
      headersType: const FullType(ChatChatGetMessageContextHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Get the reminder for a chat message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder returned
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [getReminderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatGetReminderResponseApplicationJson, void>> getReminder({
    required String token,
    required int messageId,
    ChatGetReminderApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getReminderRaw(
      token: token,
      messageId: messageId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the reminder for a chat message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder returned
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [getReminder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatGetReminderResponseApplicationJson, void> getReminderRaw({
    required String token,
    required int messageId,
    ChatGetReminderApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatGetReminderApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/{messageId}/reminder').expand(_parameters);
    return DynamiteRawResponse<ChatGetReminderResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ChatGetReminderResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set a reminder for a chat message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [timestamp] Timestamp of the reminder.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Reminder created successfully
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [setReminderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatSetReminderResponseApplicationJson, void>> setReminder({
    required int timestamp,
    required String token,
    required int messageId,
    ChatSetReminderApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setReminderRaw(
      timestamp: timestamp,
      token: token,
      messageId: messageId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set a reminder for a chat message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [timestamp] Timestamp of the reminder.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Reminder created successfully
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [setReminder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatSetReminderResponseApplicationJson, void> setReminderRaw({
    required int timestamp,
    required String token,
    required int messageId,
    ChatSetReminderApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $timestamp = jsonSerializers.serialize(timestamp, specifiedType: const FullType(int));
    _parameters['timestamp'] = $timestamp;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatSetReminderApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/{messageId}/reminder{?timestamp*}')
        .expand(_parameters);
    return DynamiteRawResponse<ChatSetReminderResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201},
      ),
      bodyType: const FullType(ChatSetReminderResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete a chat reminder.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder deleted successfully
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [deleteReminderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatDeleteReminderResponseApplicationJson, void>> deleteReminder({
    required String token,
    required int messageId,
    ChatDeleteReminderApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteReminderRaw(
      token: token,
      messageId: messageId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a chat reminder.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder deleted successfully
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [deleteReminder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatDeleteReminderResponseApplicationJson, void> deleteReminderRaw({
    required String token,
    required int messageId,
    ChatDeleteReminderApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatDeleteReminderApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/{messageId}/reminder').expand(_parameters);
    return DynamiteRawResponse<ChatDeleteReminderResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 404},
      ),
      bodyType: const FullType(ChatDeleteReminderResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set the read marker to a specific message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [lastReadMessage] ID if the last read message.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Read marker set successfully
  ///
  /// See:
  ///  * [setReadMarkerRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatSetReadMarkerResponseApplicationJson, ChatChatSetReadMarkerHeaders>> setReadMarker({
    required int lastReadMessage,
    required String token,
    ChatSetReadMarkerApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setReadMarkerRaw(
      lastReadMessage: lastReadMessage,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set the read marker to a specific message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [lastReadMessage] ID if the last read message.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Read marker set successfully
  ///
  /// See:
  ///  * [setReadMarker] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatSetReadMarkerResponseApplicationJson, ChatChatSetReadMarkerHeaders> setReadMarkerRaw({
    required int lastReadMessage,
    required String token,
    ChatSetReadMarkerApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $lastReadMessage = jsonSerializers.serialize(lastReadMessage, specifiedType: const FullType(int));
    _parameters['lastReadMessage'] = $lastReadMessage;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatSetReadMarkerApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/read{?lastReadMessage*}')
        .expand(_parameters);
    return DynamiteRawResponse<ChatSetReadMarkerResponseApplicationJson, ChatChatSetReadMarkerHeaders>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ChatSetReadMarkerResponseApplicationJson),
      headersType: const FullType(ChatChatSetReadMarkerHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Mark a chat as unread.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Read marker set successfully
  ///
  /// See:
  ///  * [markUnreadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatMarkUnreadResponseApplicationJson, ChatChatMarkUnreadHeaders>> markUnread({
    required String token,
    ChatMarkUnreadApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = markUnreadRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Mark a chat as unread.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Read marker set successfully
  ///
  /// See:
  ///  * [markUnread] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatMarkUnreadResponseApplicationJson, ChatChatMarkUnreadHeaders> markUnreadRaw({
    required String token,
    ChatMarkUnreadApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatMarkUnreadApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/read').expand(_parameters);
    return DynamiteRawResponse<ChatMarkUnreadResponseApplicationJson, ChatChatMarkUnreadHeaders>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ChatMarkUnreadResponseApplicationJson),
      headersType: const FullType(ChatChatMarkUnreadHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Search for mentions.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for.
  ///   * [limit] Maximum number of results. Defaults to `20`.
  ///   * [includeStatus] Include the user statuses. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: List of mention suggestions returned
  ///
  /// See:
  ///  * [mentionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatMentionsResponseApplicationJson, void>> mentions({
    required String search,
    required String token,
    int? limit,
    int? includeStatus,
    ChatMentionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = mentionsRaw(
      search: search,
      token: token,
      limit: limit,
      includeStatus: includeStatus,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Search for mentions.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for.
  ///   * [limit] Maximum number of results. Defaults to `20`.
  ///   * [includeStatus] Include the user statuses. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: List of mention suggestions returned
  ///
  /// See:
  ///  * [mentions] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatMentionsResponseApplicationJson, void> mentionsRaw({
    required String search,
    required String token,
    int? limit,
    int? includeStatus,
    ChatMentionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $search = jsonSerializers.serialize(search, specifiedType: const FullType(String));
    _parameters['search'] = $search;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 20;
    _parameters['limit'] = $limit;

    var $includeStatus = jsonSerializers.serialize(includeStatus, specifiedType: const FullType(int));
    $includeStatus ??= 0;
    _parameters['includeStatus'] = $includeStatus;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatMentionsApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/mentions{?search*,limit*,includeStatus*}')
            .expand(_parameters);
    return DynamiteRawResponse<ChatMentionsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ChatMentionsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get objects that are shared in the room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [objectType] Type of the objects.
  ///   * [lastKnownMessageId] ID of the last known message. Defaults to `0`.
  ///   * [limit] Maximum number of objects. Defaults to `100`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: List of shared objects messages returned
  ///
  /// See:
  ///  * [getObjectsSharedInRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatGetObjectsSharedInRoomResponseApplicationJson, ChatChatGetObjectsSharedInRoomHeaders>>
      getObjectsSharedInRoom({
    required String objectType,
    required String token,
    int? lastKnownMessageId,
    int? limit,
    ChatGetObjectsSharedInRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getObjectsSharedInRoomRaw(
      objectType: objectType,
      token: token,
      lastKnownMessageId: lastKnownMessageId,
      limit: limit,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get objects that are shared in the room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [objectType] Type of the objects.
  ///   * [lastKnownMessageId] ID of the last known message. Defaults to `0`.
  ///   * [limit] Maximum number of objects. Defaults to `100`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: List of shared objects messages returned
  ///
  /// See:
  ///  * [getObjectsSharedInRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatGetObjectsSharedInRoomResponseApplicationJson, ChatChatGetObjectsSharedInRoomHeaders>
      getObjectsSharedInRoomRaw({
    required String objectType,
    required String token,
    int? lastKnownMessageId,
    int? limit,
    ChatGetObjectsSharedInRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $objectType = jsonSerializers.serialize(objectType, specifiedType: const FullType(String));
    _parameters['objectType'] = $objectType;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $lastKnownMessageId = jsonSerializers.serialize(lastKnownMessageId, specifiedType: const FullType(int));
    $lastKnownMessageId ??= 0;
    _parameters['lastKnownMessageId'] = $lastKnownMessageId;

    var $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 100;
    _parameters['limit'] = $limit;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatGetObjectsSharedInRoomApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/share{?objectType*,lastKnownMessageId*,limit*}',
    ).expand(_parameters);
    return DynamiteRawResponse<ChatGetObjectsSharedInRoomResponseApplicationJson,
        ChatChatGetObjectsSharedInRoomHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ChatGetObjectsSharedInRoomResponseApplicationJson),
      headersType: const FullType(ChatChatGetObjectsSharedInRoomHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Sends a rich-object to the given room.
  ///
  /// The author and timestamp are automatically set to the current user/guest and time.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [objectType] Type of the object.
  ///   * [objectId] ID of the object.
  ///   * [metaData] Additional metadata. Defaults to `''`.
  ///   * [actorDisplayName] Guest name. Defaults to `''`.
  ///   * [referenceId] Reference ID. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Object shared successfully
  ///   * 400: Sharing object is not possible
  ///   * 404: Actor not found
  ///   * 413: Message too long
  ///
  /// See:
  ///  * [shareObjectToChatRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatShareObjectToChatResponseApplicationJson, ChatChatShareObjectToChatHeaders>>
      shareObjectToChat({
    required String objectType,
    required String objectId,
    required String token,
    String? metaData,
    String? actorDisplayName,
    String? referenceId,
    ChatShareObjectToChatApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = shareObjectToChatRaw(
      objectType: objectType,
      objectId: objectId,
      token: token,
      metaData: metaData,
      actorDisplayName: actorDisplayName,
      referenceId: referenceId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Sends a rich-object to the given room.
  ///
  /// The author and timestamp are automatically set to the current user/guest and time.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [objectType] Type of the object.
  ///   * [objectId] ID of the object.
  ///   * [metaData] Additional metadata. Defaults to `''`.
  ///   * [actorDisplayName] Guest name. Defaults to `''`.
  ///   * [referenceId] Reference ID. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Object shared successfully
  ///   * 400: Sharing object is not possible
  ///   * 404: Actor not found
  ///   * 413: Message too long
  ///
  /// See:
  ///  * [shareObjectToChat] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatShareObjectToChatResponseApplicationJson, ChatChatShareObjectToChatHeaders>
      shareObjectToChatRaw({
    required String objectType,
    required String objectId,
    required String token,
    String? metaData,
    String? actorDisplayName,
    String? referenceId,
    ChatShareObjectToChatApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $objectType = jsonSerializers.serialize(objectType, specifiedType: const FullType(String));
    _parameters['objectType'] = $objectType;

    final $objectId = jsonSerializers.serialize(objectId, specifiedType: const FullType(String));
    _parameters['objectId'] = $objectId;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $metaData = jsonSerializers.serialize(metaData, specifiedType: const FullType(String));
    $metaData ??= '';
    _parameters['metaData'] = $metaData;

    var $actorDisplayName = jsonSerializers.serialize(actorDisplayName, specifiedType: const FullType(String));
    $actorDisplayName ??= '';
    _parameters['actorDisplayName'] = $actorDisplayName;

    var $referenceId = jsonSerializers.serialize(referenceId, specifiedType: const FullType(String));
    $referenceId ??= '';
    _parameters['referenceId'] = $referenceId;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ChatShareObjectToChatApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/share{?objectType*,objectId*,metaData*,actorDisplayName*,referenceId*}',
    ).expand(_parameters);
    return DynamiteRawResponse<ChatShareObjectToChatResponseApplicationJson, ChatChatShareObjectToChatHeaders>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201},
      ),
      bodyType: const FullType(ChatShareObjectToChatResponseApplicationJson),
      headersType: const FullType(ChatChatShareObjectToChatHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Get objects that are shared in the room overview.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Maximum number of objects. Defaults to `7`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: List of shared objects messages of each type returned
  ///
  /// See:
  ///  * [getObjectsSharedInRoomOverviewRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ChatGetObjectsSharedInRoomOverviewResponseApplicationJson, void>>
      getObjectsSharedInRoomOverview({
    required String token,
    int? limit,
    ChatGetObjectsSharedInRoomOverviewApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getObjectsSharedInRoomOverviewRaw(
      token: token,
      limit: limit,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get objects that are shared in the room overview.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Maximum number of objects. Defaults to `7`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: List of shared objects messages of each type returned
  ///
  /// See:
  ///  * [getObjectsSharedInRoomOverview] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ChatGetObjectsSharedInRoomOverviewResponseApplicationJson, void>
      getObjectsSharedInRoomOverviewRaw({
    required String token,
    int? limit,
    ChatGetObjectsSharedInRoomOverviewApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 7;
    _parameters['limit'] = $limit;

    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(ChatGetObjectsSharedInRoomOverviewApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/chat/{token}/share/overview{?limit*}')
        .expand(_parameters);
    return DynamiteRawResponse<ChatGetObjectsSharedInRoomOverviewResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ChatGetObjectsSharedInRoomOverviewResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class FederationClient {
  FederationClient(this._rootClient);

  final Client _rootClient;

  /// Accept a federation invites.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Invite accepted successfully
  ///   * 500
  ///
  /// See:
  ///  * [acceptShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<FederationAcceptShareResponseApplicationJson, void>> acceptShare({
    required int id,
    FederationAcceptShareApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = acceptShareRaw(
      id: id,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Accept a federation invites.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Invite accepted successfully
  ///   * 500
  ///
  /// See:
  ///  * [acceptShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<FederationAcceptShareResponseApplicationJson, void> acceptShareRaw({
    required int id,
    FederationAcceptShareApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(FederationAcceptShareApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/federation/invitation/{id}').expand(_parameters);
    return DynamiteRawResponse<FederationAcceptShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(FederationAcceptShareResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Decline a federation invites.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Invite declined successfully
  ///   * 500
  ///
  /// See:
  ///  * [rejectShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<FederationRejectShareResponseApplicationJson, void>> rejectShare({
    required int id,
    FederationRejectShareApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = rejectShareRaw(
      id: id,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Decline a federation invites.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Invite declined successfully
  ///   * 500
  ///
  /// See:
  ///  * [rejectShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<FederationRejectShareResponseApplicationJson, void> rejectShareRaw({
    required int id,
    FederationRejectShareApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(FederationRejectShareApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/federation/invitation/{id}').expand(_parameters);
    return DynamiteRawResponse<FederationRejectShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(FederationRejectShareResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of federation invites.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Get list of received federation invites successfully
  ///
  /// See:
  ///  * [getSharesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<FederationGetSharesResponseApplicationJson, void>> getShares({
    FederationGetSharesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getSharesRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of federation invites.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Get list of received federation invites successfully
  ///
  /// See:
  ///  * [getShares] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<FederationGetSharesResponseApplicationJson, void> getSharesRaw({
    FederationGetSharesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(FederationGetSharesApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/federation/invitation').expand(_parameters);
    return DynamiteRawResponse<FederationGetSharesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(FederationGetSharesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class FilesIntegrationClient {
  FilesIntegrationClient(this._rootClient);

  final Client _rootClient;

  /// Get the token of the room associated to the given file id.
  ///
  /// This is the counterpart of self::getRoomByShareToken() for file ids instead of share tokens, although both return the same room token if the given file id and share token refer to the same file.
  /// If there is no room associated to the given file id a new room is created; the new room is a public room associated with a "file" object with the given file id. Unlike normal rooms in which the owner is the user that created the room these are special rooms without owner (although self joined users with direct access to the file become persistent participants automatically when they join until they explicitly leave or no longer have access to the file).
  /// In any case, to create or even get the token of the room, the file must be shared and the user must be the owner of a public share of the file (like a link share, for example) or have direct access to that file; an error is returned otherwise. A user has direct access to a file if she has access to it (or to an ancestor) through a user, group, circle or room share (but not through a link share, for example), or if she is the owner of such a file.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room token returned
  ///   * 400: Rooms not allowed for shares
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [getRoomByFileIdRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<FilesIntegrationGetRoomByFileIdResponseApplicationJson, void>> getRoomByFileId({
    required String fileId,
    FilesIntegrationGetRoomByFileIdApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getRoomByFileIdRaw(
      fileId: fileId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the token of the room associated to the given file id.
  ///
  /// This is the counterpart of self::getRoomByShareToken() for file ids instead of share tokens, although both return the same room token if the given file id and share token refer to the same file.
  /// If there is no room associated to the given file id a new room is created; the new room is a public room associated with a "file" object with the given file id. Unlike normal rooms in which the owner is the user that created the room these are special rooms without owner (although self joined users with direct access to the file become persistent participants automatically when they join until they explicitly leave or no longer have access to the file).
  /// In any case, to create or even get the token of the room, the file must be shared and the user must be the owner of a public share of the file (like a link share, for example) or have direct access to that file; an error is returned otherwise. A user has direct access to a file if she has access to it (or to an ancestor) through a user, group, circle or room share (but not through a link share, for example), or if she is the owner of such a file.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room token returned
  ///   * 400: Rooms not allowed for shares
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [getRoomByFileId] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<FilesIntegrationGetRoomByFileIdResponseApplicationJson, void> getRoomByFileIdRaw({
    required String fileId,
    FilesIntegrationGetRoomByFileIdApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $fileId = jsonSerializers.serialize(fileId, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($fileId as String?, RegExp(r'^.+$'), 'fileId');
    _parameters['fileId'] = $fileId;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(FilesIntegrationGetRoomByFileIdApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/file/{fileId}').expand(_parameters);
    return DynamiteRawResponse<FilesIntegrationGetRoomByFileIdResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(FilesIntegrationGetRoomByFileIdResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns the token of the room associated to the file id of the given share token.
  ///
  /// This is the counterpart of self::getRoomByFileId() for share tokens instead of file ids, although both return the same room token if the given file id and share token refer to the same file.
  /// If there is no room associated to the file id of the given share token a new room is created; the new room is a public room associated with a "file" object with the file id of the given share token. Unlike normal rooms in which the owner is the user that created the room these are special rooms without owner (although self joined users with direct access to the file become persistent participants automatically when they join until they explicitly leave or no longer have access to the file).
  /// In any case, to create or even get the token of the room, the file must be publicly shared (like a link share, for example); an error is returned otherwise.
  /// Besides the token of the room this also returns the current user ID and display name, if any; this is needed by the Talk sidebar to know the actual current user, as the public share page uses the incognito mode and thus logged-in users as seen as guests.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [shareToken] Token of the file share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room token and user info returned
  ///   * 400: Rooms not allowed for shares
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [getRoomByShareTokenRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<FilesIntegrationGetRoomByShareTokenResponseApplicationJson, void>> getRoomByShareToken({
    required String shareToken,
    FilesIntegrationGetRoomByShareTokenApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getRoomByShareTokenRaw(
      shareToken: shareToken,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Returns the token of the room associated to the file id of the given share token.
  ///
  /// This is the counterpart of self::getRoomByFileId() for share tokens instead of file ids, although both return the same room token if the given file id and share token refer to the same file.
  /// If there is no room associated to the file id of the given share token a new room is created; the new room is a public room associated with a "file" object with the file id of the given share token. Unlike normal rooms in which the owner is the user that created the room these are special rooms without owner (although self joined users with direct access to the file become persistent participants automatically when they join until they explicitly leave or no longer have access to the file).
  /// In any case, to create or even get the token of the room, the file must be publicly shared (like a link share, for example); an error is returned otherwise.
  /// Besides the token of the room this also returns the current user ID and display name, if any; this is needed by the Talk sidebar to know the actual current user, as the public share page uses the incognito mode and thus logged-in users as seen as guests.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [shareToken] Token of the file share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room token and user info returned
  ///   * 400: Rooms not allowed for shares
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [getRoomByShareToken] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<FilesIntegrationGetRoomByShareTokenResponseApplicationJson, void> getRoomByShareTokenRaw({
    required String shareToken,
    FilesIntegrationGetRoomByShareTokenApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $shareToken = jsonSerializers.serialize(shareToken, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($shareToken as String?, RegExp(r'^.+$'), 'shareToken');
    _parameters['shareToken'] = $shareToken;

    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(FilesIntegrationGetRoomByShareTokenApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/publicshare/{shareToken}').expand(_parameters);
    return DynamiteRawResponse<FilesIntegrationGetRoomByShareTokenResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(FilesIntegrationGetRoomByShareTokenResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class GuestClient {
  GuestClient(this._rootClient);

  final Client _rootClient;

  /// Set the display name as a guest.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [displayName] New display name.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Display name updated successfully
  ///   * 403: Not a guest
  ///   * 404: Not a participant
  ///
  /// See:
  ///  * [setDisplayNameRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GuestSetDisplayNameResponseApplicationJson, void>> setDisplayName({
    required String displayName,
    required String token,
    GuestSetDisplayNameApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setDisplayNameRaw(
      displayName: displayName,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set the display name as a guest.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [displayName] New display name.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Display name updated successfully
  ///   * 403: Not a guest
  ///   * 404: Not a participant
  ///
  /// See:
  ///  * [setDisplayName] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GuestSetDisplayNameResponseApplicationJson, void> setDisplayNameRaw({
    required String displayName,
    required String token,
    GuestSetDisplayNameApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $displayName = jsonSerializers.serialize(displayName, specifiedType: const FullType(String));
    _parameters['displayName'] = $displayName;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(GuestSetDisplayNameApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/guest/{token}/name{?displayName*}').expand(_parameters);
    return DynamiteRawResponse<GuestSetDisplayNameResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 403, 404},
      ),
      bodyType: const FullType(GuestSetDisplayNameResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class HostedSignalingServerClient {
  HostedSignalingServerClient(this._rootClient);

  final Client _rootClient;

  /// Request a trial account.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [url] Server URL.
  ///   * [name] Display name of the user.
  ///   * [email] Email of the user.
  ///   * [language] Language of the user.
  ///   * [country] Country of the user.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Trial requested successfully
  ///   * 400: Requesting trial is not possible
  ///   * 500
  ///
  /// See:
  ///  * [requestTrialRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<HostedSignalingServerRequestTrialResponseApplicationJson, void>> requestTrial({
    required String url,
    required String name,
    required String email,
    required String language,
    required String country,
    HostedSignalingServerRequestTrialApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = requestTrialRaw(
      url: url,
      name: name,
      email: email,
      language: language,
      country: country,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Request a trial account.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [url] Server URL.
  ///   * [name] Display name of the user.
  ///   * [email] Email of the user.
  ///   * [language] Language of the user.
  ///   * [country] Country of the user.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Trial requested successfully
  ///   * 400: Requesting trial is not possible
  ///   * 500
  ///
  /// See:
  ///  * [requestTrial] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<HostedSignalingServerRequestTrialResponseApplicationJson, void> requestTrialRaw({
    required String url,
    required String name,
    required String email,
    required String language,
    required String country,
    HostedSignalingServerRequestTrialApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $url = jsonSerializers.serialize(url, specifiedType: const FullType(String));
    _parameters['url'] = $url;

    final $name = jsonSerializers.serialize(name, specifiedType: const FullType(String));
    _parameters['name'] = $name;

    final $email = jsonSerializers.serialize(email, specifiedType: const FullType(String));
    _parameters['email'] = $email;

    final $language = jsonSerializers.serialize(language, specifiedType: const FullType(String));
    _parameters['language'] = $language;

    final $country = jsonSerializers.serialize(country, specifiedType: const FullType(String));
    _parameters['country'] = $country;

    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(HostedSignalingServerRequestTrialApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/hostedsignalingserver/requesttrial{?url*,name*,email*,language*,country*}',
    ).expand(_parameters);
    return DynamiteRawResponse<HostedSignalingServerRequestTrialResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(HostedSignalingServerRequestTrialResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete the account.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 204: Account deleted successfully
  ///   * 400: Deleting account is not possible
  ///   * 500
  ///
  /// See:
  ///  * [deleteAccountRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<HostedSignalingServerDeleteAccountResponseApplicationJson, void>> deleteAccount({
    HostedSignalingServerDeleteAccountApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteAccountRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete the account.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 204: Account deleted successfully
  ///   * 400: Deleting account is not possible
  ///   * 500
  ///
  /// See:
  ///  * [deleteAccount] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<HostedSignalingServerDeleteAccountResponseApplicationJson, void> deleteAccountRaw({
    HostedSignalingServerDeleteAccountApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(HostedSignalingServerDeleteAccountApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/hostedsignalingserver/delete').expand(_parameters);
    return DynamiteRawResponse<HostedSignalingServerDeleteAccountResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {204},
      ),
      bodyType: const FullType(HostedSignalingServerDeleteAccountResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class MatterbridgeClient {
  MatterbridgeClient(this._rootClient);

  final Client _rootClient;

  /// Get bridge information of one room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Return list of configured bridges
  ///
  /// See:
  ///  * [getBridgeOfRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<MatterbridgeGetBridgeOfRoomResponseApplicationJson, void>> getBridgeOfRoom({
    required String token,
    MatterbridgeGetBridgeOfRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getBridgeOfRoomRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get bridge information of one room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Return list of configured bridges
  ///
  /// See:
  ///  * [getBridgeOfRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<MatterbridgeGetBridgeOfRoomResponseApplicationJson, void> getBridgeOfRoomRaw({
    required String token,
    MatterbridgeGetBridgeOfRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(MatterbridgeGetBridgeOfRoomApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bridge/{token}').expand(_parameters);
    return DynamiteRawResponse<MatterbridgeGetBridgeOfRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(MatterbridgeGetBridgeOfRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Edit bridge information of one room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [enabled] If the bridge should be enabled.
  ///   * [parts] New parts.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bridge edited successfully
  ///   * 406: Editing bridge is not possible
  ///
  /// See:
  ///  * [editBridgeOfRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<MatterbridgeEditBridgeOfRoomResponseApplicationJson, void>> editBridgeOfRoom({
    required int enabled,
    required String token,
    ContentString<BuiltList<BuiltMap<String, JsonObject>>>? parts,
    MatterbridgeEditBridgeOfRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = editBridgeOfRoomRaw(
      enabled: enabled,
      token: token,
      parts: parts,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Edit bridge information of one room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [enabled] If the bridge should be enabled.
  ///   * [parts] New parts.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bridge edited successfully
  ///   * 406: Editing bridge is not possible
  ///
  /// See:
  ///  * [editBridgeOfRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<MatterbridgeEditBridgeOfRoomResponseApplicationJson, void> editBridgeOfRoomRaw({
    required int enabled,
    required String token,
    ContentString<BuiltList<BuiltMap<String, JsonObject>>>? parts,
    MatterbridgeEditBridgeOfRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $enabled = jsonSerializers.serialize(enabled, specifiedType: const FullType(int));
    _parameters['enabled'] = $enabled;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $parts = jsonSerializers.serialize(
      parts,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltList, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
      ]),
    );
    _parameters['parts'] = $parts;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(MatterbridgeEditBridgeOfRoomApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bridge/{token}{?enabled*,parts*}').expand(_parameters);
    return DynamiteRawResponse<MatterbridgeEditBridgeOfRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(MatterbridgeEditBridgeOfRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete bridge of one room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bridge deleted successfully
  ///   * 406: Deleting bridge is not possible
  ///
  /// See:
  ///  * [deleteBridgeOfRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<MatterbridgeDeleteBridgeOfRoomResponseApplicationJson, void>> deleteBridgeOfRoom({
    required String token,
    MatterbridgeDeleteBridgeOfRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteBridgeOfRoomRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete bridge of one room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bridge deleted successfully
  ///   * 406: Deleting bridge is not possible
  ///
  /// See:
  ///  * [deleteBridgeOfRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<MatterbridgeDeleteBridgeOfRoomResponseApplicationJson, void> deleteBridgeOfRoomRaw({
    required String token,
    MatterbridgeDeleteBridgeOfRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(MatterbridgeDeleteBridgeOfRoomApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bridge/{token}').expand(_parameters);
    return DynamiteRawResponse<MatterbridgeDeleteBridgeOfRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(MatterbridgeDeleteBridgeOfRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get bridge process information.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Return list of running processes
  ///
  /// See:
  ///  * [getBridgeProcessStateRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<MatterbridgeGetBridgeProcessStateResponseApplicationJson, void>> getBridgeProcessState({
    required String token,
    MatterbridgeGetBridgeProcessStateApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getBridgeProcessStateRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get bridge process information.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Return list of running processes
  ///
  /// See:
  ///  * [getBridgeProcessState] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<MatterbridgeGetBridgeProcessStateResponseApplicationJson, void> getBridgeProcessStateRaw({
    required String token,
    MatterbridgeGetBridgeProcessStateApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(MatterbridgeGetBridgeProcessStateApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bridge/{token}/process').expand(_parameters);
    return DynamiteRawResponse<MatterbridgeGetBridgeProcessStateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(MatterbridgeGetBridgeProcessStateResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class MatterbridgeSettingsClient {
  MatterbridgeSettingsClient(this._rootClient);

  final Client _rootClient;

  /// Stop all bridges.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: All bridges stopped successfully
  ///   * 406: Stopping all bridges is not possible
  ///
  /// See:
  ///  * [stopAllBridgesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<MatterbridgeSettingsStopAllBridgesResponseApplicationJson, void>> stopAllBridges({
    MatterbridgeSettingsStopAllBridgesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = stopAllBridgesRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Stop all bridges.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: All bridges stopped successfully
  ///   * 406: Stopping all bridges is not possible
  ///
  /// See:
  ///  * [stopAllBridges] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<MatterbridgeSettingsStopAllBridgesResponseApplicationJson, void> stopAllBridgesRaw({
    MatterbridgeSettingsStopAllBridgesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(MatterbridgeSettingsStopAllBridgesApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bridge').expand(_parameters);
    return DynamiteRawResponse<MatterbridgeSettingsStopAllBridgesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(MatterbridgeSettingsStopAllBridgesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get Matterbridge version.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bridge version returned
  ///   * 400: Getting bridge version is not possible
  ///
  /// See:
  ///  * [getMatterbridgeVersionRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson, void>>
      getMatterbridgeVersion({
    MatterbridgeSettingsGetMatterbridgeVersionApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getMatterbridgeVersionRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get Matterbridge version.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Bridge version returned
  ///   * 400: Getting bridge version is not possible
  ///
  /// See:
  ///  * [getMatterbridgeVersion] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson, void>
      getMatterbridgeVersionRaw({
    MatterbridgeSettingsGetMatterbridgeVersionApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $apiVersion = jsonSerializers.serialize(
      apiVersion,
      specifiedType: const FullType(MatterbridgeSettingsGetMatterbridgeVersionApiVersion),
    );
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/bridge/version').expand(_parameters);
    return DynamiteRawResponse<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class PollClient {
  PollClient(this._rootClient);

  final Client _rootClient;

  /// Create a poll.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [question] Question of the poll.
  ///   * [options] Options of the poll.
  ///   * [resultMode] Mode how the results will be shown.
  ///   * [maxVotes] Number of maximum votes per voter.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Poll created successfully
  ///   * 400: Creating poll is not possible
  ///
  /// See:
  ///  * [createPollRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PollCreatePollResponseApplicationJson, void>> createPoll({
    required String question,
    required BuiltList<String> options,
    required int resultMode,
    required int maxVotes,
    required String token,
    PollCreatePollApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = createPollRaw(
      question: question,
      options: options,
      resultMode: resultMode,
      maxVotes: maxVotes,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a poll.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [question] Question of the poll.
  ///   * [options] Options of the poll.
  ///   * [resultMode] Mode how the results will be shown.
  ///   * [maxVotes] Number of maximum votes per voter.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Poll created successfully
  ///   * 400: Creating poll is not possible
  ///
  /// See:
  ///  * [createPoll] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PollCreatePollResponseApplicationJson, void> createPollRaw({
    required String question,
    required BuiltList<String> options,
    required int resultMode,
    required int maxVotes,
    required String token,
    PollCreatePollApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $question = jsonSerializers.serialize(question, specifiedType: const FullType(String));
    _parameters['question'] = $question;

    final $options = jsonSerializers.serialize(options, specifiedType: const FullType(BuiltList, [FullType(String)]));
    _parameters['options%5B%5D'] = $options;

    final $resultMode = jsonSerializers.serialize(resultMode, specifiedType: const FullType(int));
    _parameters['resultMode'] = $resultMode;

    final $maxVotes = jsonSerializers.serialize(maxVotes, specifiedType: const FullType(int));
    _parameters['maxVotes'] = $maxVotes;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(PollCreatePollApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/poll/{token}{?question*,options%5B%5D*,resultMode*,maxVotes*}',
    ).expand(_parameters);
    return DynamiteRawResponse<PollCreatePollResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201},
      ),
      bodyType: const FullType(PollCreatePollResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a poll.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [pollId] ID of the poll.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Poll returned
  ///   * 404: Poll not found
  ///
  /// See:
  ///  * [showPollRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PollShowPollResponseApplicationJson, void>> showPoll({
    required String token,
    required int pollId,
    PollShowPollApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = showPollRaw(
      token: token,
      pollId: pollId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a poll.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [pollId] ID of the poll.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Poll returned
  ///   * 404: Poll not found
  ///
  /// See:
  ///  * [showPoll] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PollShowPollResponseApplicationJson, void> showPollRaw({
    required String token,
    required int pollId,
    PollShowPollApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $pollId = jsonSerializers.serialize(pollId, specifiedType: const FullType(int));
    _parameters['pollId'] = $pollId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(PollShowPollApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/poll/{token}/{pollId}').expand(_parameters);
    return DynamiteRawResponse<PollShowPollResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(PollShowPollResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Vote on a poll.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [optionIds] IDs of the selected options. Defaults to `[]`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [pollId] ID of the poll.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Voted successfully
  ///   * 400: Voting is not possible
  ///   * 404: Poll not found
  ///
  /// See:
  ///  * [votePollRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PollVotePollResponseApplicationJson, void>> votePoll({
    required String token,
    required int pollId,
    BuiltList<int>? optionIds,
    PollVotePollApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = votePollRaw(
      token: token,
      pollId: pollId,
      optionIds: optionIds,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Vote on a poll.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [optionIds] IDs of the selected options. Defaults to `[]`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [pollId] ID of the poll.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Voted successfully
  ///   * 400: Voting is not possible
  ///   * 404: Poll not found
  ///
  /// See:
  ///  * [votePoll] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PollVotePollResponseApplicationJson, void> votePollRaw({
    required String token,
    required int pollId,
    BuiltList<int>? optionIds,
    PollVotePollApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $pollId = jsonSerializers.serialize(pollId, specifiedType: const FullType(int));
    _parameters['pollId'] = $pollId;

    var $optionIds = jsonSerializers.serialize(optionIds, specifiedType: const FullType(BuiltList, [FullType(int)]));
    $optionIds ??= [];
    _parameters['optionIds%5B%5D'] = $optionIds;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(PollVotePollApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/poll/{token}/{pollId}{?optionIds%5B%5D*}')
        .expand(_parameters);
    return DynamiteRawResponse<PollVotePollResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(PollVotePollResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Close a poll.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [pollId] ID of the poll.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Poll closed successfully
  ///   * 400: Poll already closed
  ///   * 403: Missing permissions to close poll
  ///   * 404: Poll not found
  ///   * 500
  ///
  /// See:
  ///  * [closePollRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PollClosePollResponseApplicationJson, void>> closePoll({
    required String token,
    required int pollId,
    PollClosePollApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = closePollRaw(
      token: token,
      pollId: pollId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Close a poll.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [pollId] ID of the poll.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Poll closed successfully
  ///   * 400: Poll already closed
  ///   * 403: Missing permissions to close poll
  ///   * 404: Poll not found
  ///   * 500
  ///
  /// See:
  ///  * [closePoll] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PollClosePollResponseApplicationJson, void> closePollRaw({
    required String token,
    required int pollId,
    PollClosePollApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $pollId = jsonSerializers.serialize(pollId, specifiedType: const FullType(int));
    _parameters['pollId'] = $pollId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(PollClosePollApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/poll/{token}/{pollId}').expand(_parameters);
    return DynamiteRawResponse<PollClosePollResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(PollClosePollResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class PublicShareAuthClient {
  PublicShareAuthClient(this._rootClient);

  final Client _rootClient;

  /// Creates a new room for requesting the password of a share.
  ///
  /// The new room is a public room associated with a "share:password" object with the ID of the share token. Unlike normal rooms in which the owner is the user that created the room these are special rooms always created by a guest or user on behalf of a registered user, the sharer, who will be the owner of the room.
  /// The share must have "send password by Talk" enabled; an error is returned otherwise.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [shareToken] Token of the file share.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Room created successfully
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [createRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PublicShareAuthCreateRoomResponseApplicationJson, void>> createRoom({
    required String shareToken,
    PublicShareAuthCreateRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = createRoomRaw(
      shareToken: shareToken,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Creates a new room for requesting the password of a share.
  ///
  /// The new room is a public room associated with a "share:password" object with the ID of the share token. Unlike normal rooms in which the owner is the user that created the room these are special rooms always created by a guest or user on behalf of a registered user, the sharer, who will be the owner of the room.
  /// The share must have "send password by Talk" enabled; an error is returned otherwise.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [shareToken] Token of the file share.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 201: Room created successfully
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [createRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PublicShareAuthCreateRoomResponseApplicationJson, void> createRoomRaw({
    required String shareToken,
    PublicShareAuthCreateRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $shareToken = jsonSerializers.serialize(shareToken, specifiedType: const FullType(String));
    _parameters['shareToken'] = $shareToken;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(PublicShareAuthCreateRoomApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/publicshareauth{?shareToken*}').expand(_parameters);
    return DynamiteRawResponse<PublicShareAuthCreateRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201},
      ),
      bodyType: const FullType(PublicShareAuthCreateRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class ReactionClient {
  ReactionClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of reactions for a message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Emoji to filter.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reactions returned
  ///   * 404: Message or reaction not found
  ///
  /// See:
  ///  * [getReactionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ReactionGetReactionsResponseApplicationJson, void>> getReactions({
    required String token,
    required int messageId,
    String? reaction,
    ReactionGetReactionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getReactionsRaw(
      token: token,
      messageId: messageId,
      reaction: reaction,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of reactions for a message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Emoji to filter.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reactions returned
  ///   * 404: Message or reaction not found
  ///
  /// See:
  ///  * [getReactions] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ReactionGetReactionsResponseApplicationJson, void> getReactionsRaw({
    required String token,
    required int messageId,
    String? reaction,
    ReactionGetReactionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    final $reaction = jsonSerializers.serialize(reaction, specifiedType: const FullType(String));
    _parameters['reaction'] = $reaction;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ReactionGetReactionsApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/reaction/{token}/{messageId}{?reaction*}')
        .expand(_parameters);
    return DynamiteRawResponse<ReactionGetReactionsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ReactionGetReactionsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Add a reaction to a message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Emoji to add.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reaction already existed
  ///   * 201: Reaction added successfully
  ///   * 400: Adding reaction is not possible
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [reactRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ReactionReactResponseApplicationJson, void>> react({
    required String reaction,
    required String token,
    required int messageId,
    ReactionReactApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = reactRaw(
      reaction: reaction,
      token: token,
      messageId: messageId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Add a reaction to a message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Emoji to add.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reaction already existed
  ///   * 201: Reaction added successfully
  ///   * 400: Adding reaction is not possible
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [react] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ReactionReactResponseApplicationJson, void> reactRaw({
    required String reaction,
    required String token,
    required int messageId,
    ReactionReactApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $reaction = jsonSerializers.serialize(reaction, specifiedType: const FullType(String));
    _parameters['reaction'] = $reaction;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ReactionReactApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/reaction/{token}/{messageId}{?reaction*}')
        .expand(_parameters);
    return DynamiteRawResponse<ReactionReactResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 201},
      ),
      bodyType: const FullType(ReactionReactResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete a reaction from a message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Emoji to remove.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reaction deleted successfully
  ///   * 400: Deleting reaction is not possible
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [deleteRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ReactionDeleteResponseApplicationJson, void>> delete({
    required String reaction,
    required String token,
    required int messageId,
    ReactionDeleteApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteRaw(
      reaction: reaction,
      token: token,
      messageId: messageId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a reaction from a message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reaction] Emoji to remove.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [messageId] ID of the message.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reaction deleted successfully
  ///   * 400: Deleting reaction is not possible
  ///   * 404: Message not found
  ///
  /// See:
  ///  * [delete] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ReactionDeleteResponseApplicationJson, void> deleteRaw({
    required String reaction,
    required String token,
    required int messageId,
    ReactionDeleteApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $reaction = jsonSerializers.serialize(reaction, specifiedType: const FullType(String));
    _parameters['reaction'] = $reaction;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(int));
    _parameters['messageId'] = $messageId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ReactionDeleteApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/reaction/{token}/{messageId}{?reaction*}')
        .expand(_parameters);
    return DynamiteRawResponse<ReactionDeleteResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ReactionDeleteResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class RecordingClient {
  RecordingClient(this._rootClient);

  final Client _rootClient;

  /// Get the welcome message of a recording server.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [serverId] ID of the server.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Welcome message returned
  ///   * 404: Recording server not found or not configured
  ///   * 500
  ///
  /// See:
  ///  * [getWelcomeMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RecordingGetWelcomeMessageResponseApplicationJson, void>> getWelcomeMessage({
    required int serverId,
    RecordingGetWelcomeMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getWelcomeMessageRaw(
      serverId: serverId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the welcome message of a recording server.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [serverId] ID of the server.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Welcome message returned
  ///   * 404: Recording server not found or not configured
  ///   * 500
  ///
  /// See:
  ///  * [getWelcomeMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RecordingGetWelcomeMessageResponseApplicationJson, void> getWelcomeMessageRaw({
    required int serverId,
    RecordingGetWelcomeMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $serverId = jsonSerializers.serialize(serverId, specifiedType: const FullType(int));
    _parameters['serverId'] = $serverId;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RecordingGetWelcomeMessageApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/recording/welcome/{serverId}').expand(_parameters);
    return DynamiteRawResponse<RecordingGetWelcomeMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RecordingGetWelcomeMessageResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Start the recording.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [status] Type of the recording.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording started successfully
  ///   * 400: Starting recording is not possible
  ///
  /// See:
  ///  * [startRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RecordingStartResponseApplicationJson, void>> start({
    required int status,
    required String token,
    RecordingStartApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = startRaw(
      status: status,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Start the recording.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [status] Type of the recording.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording started successfully
  ///   * 400: Starting recording is not possible
  ///
  /// See:
  ///  * [start] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RecordingStartResponseApplicationJson, void> startRaw({
    required int status,
    required String token,
    RecordingStartApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $status = jsonSerializers.serialize(status, specifiedType: const FullType(int));
    _parameters['status'] = $status;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RecordingStartApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/recording/{token}{?status*}').expand(_parameters);
    return DynamiteRawResponse<RecordingStartResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RecordingStartResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Stop the recording.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording stopped successfully
  ///   * 400: Stopping recording is not possible
  ///
  /// See:
  ///  * [stopRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RecordingStopResponseApplicationJson, void>> stop({
    required String token,
    RecordingStopApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = stopRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Stop the recording.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording stopped successfully
  ///   * 400: Stopping recording is not possible
  ///
  /// See:
  ///  * [stop] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RecordingStopResponseApplicationJson, void> stopRaw({
    required String token,
    RecordingStopApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RecordingStopApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/recording/{token}').expand(_parameters);
    return DynamiteRawResponse<RecordingStopResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RecordingStopResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Store the recording.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [owner] User that will own the recording file.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording stored successfully
  ///   * 400: Storing recording is not possible
  ///   * 401: Missing permissions to store recording
  ///
  /// See:
  ///  * [storeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RecordingStoreResponseApplicationJson, void>> store({
    required String owner,
    required String token,
    RecordingStoreApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = storeRaw(
      owner: owner,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Store the recording.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [owner] User that will own the recording file.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording stored successfully
  ///   * 400: Storing recording is not possible
  ///   * 401: Missing permissions to store recording
  ///
  /// See:
  ///  * [store] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RecordingStoreResponseApplicationJson, void> storeRaw({
    required String owner,
    required String token,
    RecordingStoreApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $owner = jsonSerializers.serialize(owner, specifiedType: const FullType(String));
    _parameters['owner'] = $owner;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RecordingStoreApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/recording/{token}/store{?owner*}').expand(_parameters);
    return DynamiteRawResponse<RecordingStoreResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RecordingStoreResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Dismiss the store call recording notification.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [timestamp] Timestamp of the notification to be dismissed.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification dismissed successfully
  ///   * 400: Dismissing notification is not possible
  ///
  /// See:
  ///  * [notificationDismissRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RecordingNotificationDismissResponseApplicationJson, void>> notificationDismiss({
    required int timestamp,
    required String token,
    RecordingNotificationDismissApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = notificationDismissRaw(
      timestamp: timestamp,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Dismiss the store call recording notification.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [timestamp] Timestamp of the notification to be dismissed.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification dismissed successfully
  ///   * 400: Dismissing notification is not possible
  ///
  /// See:
  ///  * [notificationDismiss] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RecordingNotificationDismissResponseApplicationJson, void> notificationDismissRaw({
    required int timestamp,
    required String token,
    RecordingNotificationDismissApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $timestamp = jsonSerializers.serialize(timestamp, specifiedType: const FullType(int));
    _parameters['timestamp'] = $timestamp;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RecordingNotificationDismissApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/recording/{token}/notification{?timestamp*}')
        .expand(_parameters);
    return DynamiteRawResponse<RecordingNotificationDismissResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RecordingNotificationDismissResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Share the recorded file to the chat.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [fileId] ID of the file.
  ///   * [timestamp] Timestamp of the notification to be dismissed.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording shared to chat successfully
  ///   * 400: Sharing recording to chat is not possible
  ///
  /// See:
  ///  * [shareToChatRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RecordingShareToChatResponseApplicationJson, void>> shareToChat({
    required int fileId,
    required int timestamp,
    required String token,
    RecordingShareToChatApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = shareToChatRaw(
      fileId: fileId,
      timestamp: timestamp,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Share the recorded file to the chat.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [fileId] ID of the file.
  ///   * [timestamp] Timestamp of the notification to be dismissed.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording shared to chat successfully
  ///   * 400: Sharing recording to chat is not possible
  ///
  /// See:
  ///  * [shareToChat] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RecordingShareToChatResponseApplicationJson, void> shareToChatRaw({
    required int fileId,
    required int timestamp,
    required String token,
    RecordingShareToChatApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $fileId = jsonSerializers.serialize(fileId, specifiedType: const FullType(int));
    _parameters['fileId'] = $fileId;

    final $timestamp = jsonSerializers.serialize(timestamp, specifiedType: const FullType(int));
    _parameters['timestamp'] = $timestamp;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RecordingShareToChatApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/recording/{token}/share-chat{?fileId*,timestamp*}')
            .expand(_parameters);
    return DynamiteRawResponse<RecordingShareToChatResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RecordingShareToChatResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class RoomClient {
  RoomClient(this._rootClient);

  final Client _rootClient;

  /// Get all currently existent rooms which the user has joined.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [noStatusUpdate] When the user status should not be automatically set to online set to 1 (default 0). Defaults to `0`.
  ///   * [includeStatus] Include the user status. Defaults to `0`.
  ///   * [modifiedSince] Filter rooms modified after a timestamp. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Return list of rooms
  ///
  /// See:
  ///  * [getRoomsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomGetRoomsResponseApplicationJson, RoomRoomGetRoomsHeaders>> getRooms({
    int? noStatusUpdate,
    int? includeStatus,
    int? modifiedSince,
    RoomGetRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getRoomsRaw(
      noStatusUpdate: noStatusUpdate,
      includeStatus: includeStatus,
      modifiedSince: modifiedSince,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get all currently existent rooms which the user has joined.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [noStatusUpdate] When the user status should not be automatically set to online set to 1 (default 0). Defaults to `0`.
  ///   * [includeStatus] Include the user status. Defaults to `0`.
  ///   * [modifiedSince] Filter rooms modified after a timestamp. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Return list of rooms
  ///
  /// See:
  ///  * [getRooms] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomGetRoomsResponseApplicationJson, RoomRoomGetRoomsHeaders> getRoomsRaw({
    int? noStatusUpdate,
    int? includeStatus,
    int? modifiedSince,
    RoomGetRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $noStatusUpdate = jsonSerializers.serialize(noStatusUpdate, specifiedType: const FullType(int));
    $noStatusUpdate ??= 0;
    _parameters['noStatusUpdate'] = $noStatusUpdate;

    var $includeStatus = jsonSerializers.serialize(includeStatus, specifiedType: const FullType(int));
    $includeStatus ??= 0;
    _parameters['includeStatus'] = $includeStatus;

    var $modifiedSince = jsonSerializers.serialize(modifiedSince, specifiedType: const FullType(int));
    $modifiedSince ??= 0;
    _parameters['modifiedSince'] = $modifiedSince;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomGetRoomsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room{?noStatusUpdate*,includeStatus*,modifiedSince*}')
            .expand(_parameters);
    return DynamiteRawResponse<RoomGetRoomsResponseApplicationJson, RoomRoomGetRoomsHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomGetRoomsResponseApplicationJson),
      headersType: const FullType(RoomRoomGetRoomsHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Create a room with a user, a group or a circle.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [roomType] Type of the room.
  ///   * [invite] User, group, … ID to invite. Defaults to `''`.
  ///   * [roomName] Name of the room. Defaults to `''`.
  ///   * [source] Source of the invite ID ('circles' to create a room with a circle, etc.). Defaults to `''`.
  ///   * [objectType] Type of the object. Defaults to `''`.
  ///   * [objectId] ID of the object. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room already existed
  ///   * 201: Room created successfully
  ///   * 400: Room type invalid
  ///   * 403: Missing permissions to create room
  ///   * 404: User, group or other target to invite was not found
  ///
  /// See:
  ///  * [createRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomCreateRoomResponseApplicationJson, void>> createRoom({
    required int roomType,
    String? invite,
    String? roomName,
    String? source,
    String? objectType,
    String? objectId,
    RoomCreateRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = createRoomRaw(
      roomType: roomType,
      invite: invite,
      roomName: roomName,
      source: source,
      objectType: objectType,
      objectId: objectId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a room with a user, a group or a circle.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [roomType] Type of the room.
  ///   * [invite] User, group, … ID to invite. Defaults to `''`.
  ///   * [roomName] Name of the room. Defaults to `''`.
  ///   * [source] Source of the invite ID ('circles' to create a room with a circle, etc.). Defaults to `''`.
  ///   * [objectType] Type of the object. Defaults to `''`.
  ///   * [objectId] ID of the object. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room already existed
  ///   * 201: Room created successfully
  ///   * 400: Room type invalid
  ///   * 403: Missing permissions to create room
  ///   * 404: User, group or other target to invite was not found
  ///
  /// See:
  ///  * [createRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomCreateRoomResponseApplicationJson, void> createRoomRaw({
    required int roomType,
    String? invite,
    String? roomName,
    String? source,
    String? objectType,
    String? objectId,
    RoomCreateRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $roomType = jsonSerializers.serialize(roomType, specifiedType: const FullType(int));
    _parameters['roomType'] = $roomType;

    var $invite = jsonSerializers.serialize(invite, specifiedType: const FullType(String));
    $invite ??= '';
    _parameters['invite'] = $invite;

    var $roomName = jsonSerializers.serialize(roomName, specifiedType: const FullType(String));
    $roomName ??= '';
    _parameters['roomName'] = $roomName;

    var $source = jsonSerializers.serialize(source, specifiedType: const FullType(String));
    $source ??= '';
    _parameters['source'] = $source;

    var $objectType = jsonSerializers.serialize(objectType, specifiedType: const FullType(String));
    $objectType ??= '';
    _parameters['objectType'] = $objectType;

    var $objectId = jsonSerializers.serialize(objectId, specifiedType: const FullType(String));
    $objectId ??= '';
    _parameters['objectId'] = $objectId;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomCreateRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/room{?roomType*,invite*,roomName*,source*,objectType*,objectId*}',
    ).expand(_parameters);
    return DynamiteRawResponse<RoomCreateRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 201},
      ),
      bodyType: const FullType(RoomCreateRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get listed rooms with optional search term.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [searchTerm] search term. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Return list of matching rooms
  ///
  /// See:
  ///  * [getListedRoomsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomGetListedRoomsResponseApplicationJson, void>> getListedRooms({
    String? searchTerm,
    RoomGetListedRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getListedRoomsRaw(
      searchTerm: searchTerm,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get listed rooms with optional search term.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [searchTerm] search term. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Return list of matching rooms
  ///
  /// See:
  ///  * [getListedRooms] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomGetListedRoomsResponseApplicationJson, void> getListedRoomsRaw({
    String? searchTerm,
    RoomGetListedRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $searchTerm = jsonSerializers.serialize(searchTerm, specifiedType: const FullType(String));
    $searchTerm ??= '';
    _parameters['searchTerm'] = $searchTerm;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomGetListedRoomsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/listed-room{?searchTerm*}').expand(_parameters);
    return DynamiteRawResponse<RoomGetListedRoomsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomGetListedRoomsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the "Note to self" conversation for the user.
  ///
  /// It will be automatically created when it is currently missing.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room returned successfully
  ///
  /// See:
  ///  * [getNoteToSelfConversationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<
      DynamiteResponse<RoomGetNoteToSelfConversationResponseApplicationJson,
          RoomRoomGetNoteToSelfConversationHeaders>> getNoteToSelfConversation({
    RoomGetNoteToSelfConversationApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getNoteToSelfConversationRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the "Note to self" conversation for the user.
  ///
  /// It will be automatically created when it is currently missing.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room returned successfully
  ///
  /// See:
  ///  * [getNoteToSelfConversation] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomGetNoteToSelfConversationResponseApplicationJson, RoomRoomGetNoteToSelfConversationHeaders>
      getNoteToSelfConversationRaw({
    RoomGetNoteToSelfConversationApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomGetNoteToSelfConversationApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/note-to-self').expand(_parameters);
    return DynamiteRawResponse<RoomGetNoteToSelfConversationResponseApplicationJson,
        RoomRoomGetNoteToSelfConversationHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomGetNoteToSelfConversationResponseApplicationJson),
      headersType: const FullType(RoomRoomGetNoteToSelfConversationHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Get a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room returned
  ///   * 401: SIP request invalid
  ///   * 404: Room not found
  ///
  /// See:
  ///  * [getSingleRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomGetSingleRoomResponseApplicationJson, RoomRoomGetSingleRoomHeaders>> getSingleRoom({
    required String token,
    RoomGetSingleRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getSingleRoomRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room returned
  ///   * 401: SIP request invalid
  ///   * 404: Room not found
  ///
  /// See:
  ///  * [getSingleRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomGetSingleRoomResponseApplicationJson, RoomRoomGetSingleRoomHeaders> getSingleRoomRaw({
    required String token,
    RoomGetSingleRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomGetSingleRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}').expand(_parameters);
    return DynamiteRawResponse<RoomGetSingleRoomResponseApplicationJson, RoomRoomGetSingleRoomHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomGetSingleRoomResponseApplicationJson),
      headersType: const FullType(RoomRoomGetSingleRoomHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Rename a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [roomName] New name.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room renamed successfully
  ///   * 400: Renaming room is not possible
  ///
  /// See:
  ///  * [renameRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomRenameRoomResponseApplicationJson, void>> renameRoom({
    required String roomName,
    required String token,
    RoomRenameRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = renameRoomRaw(
      roomName: roomName,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Rename a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [roomName] New name.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room renamed successfully
  ///   * 400: Renaming room is not possible
  ///
  /// See:
  ///  * [renameRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomRenameRoomResponseApplicationJson, void> renameRoomRaw({
    required String roomName,
    required String token,
    RoomRenameRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $roomName = jsonSerializers.serialize(roomName, specifiedType: const FullType(String));
    _parameters['roomName'] = $roomName;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomRenameRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}{?roomName*}').expand(_parameters);
    return DynamiteRawResponse<RoomRenameRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomRenameRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room successfully deleted
  ///   * 400: Deleting room is not possible
  ///
  /// See:
  ///  * [deleteRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomDeleteRoomResponseApplicationJson, void>> deleteRoom({
    required String token,
    RoomDeleteRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteRoomRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room successfully deleted
  ///   * 400: Deleting room is not possible
  ///
  /// See:
  ///  * [deleteRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomDeleteRoomResponseApplicationJson, void> deleteRoomRaw({
    required String token,
    RoomDeleteRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomDeleteRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}').expand(_parameters);
    return DynamiteRawResponse<RoomDeleteRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomDeleteRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get all (for moderators and in case of "free selection") or the assigned breakout room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms returned
  ///   * 400: Getting breakout rooms is not possible
  ///
  /// See:
  ///  * [getBreakoutRoomsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomGetBreakoutRoomsResponseApplicationJson, void>> getBreakoutRooms({
    required String token,
    RoomGetBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getBreakoutRoomsRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get all (for moderators and in case of "free selection") or the assigned breakout room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout rooms returned
  ///   * 400: Getting breakout rooms is not possible
  ///
  /// See:
  ///  * [getBreakoutRooms] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomGetBreakoutRoomsResponseApplicationJson, void> getBreakoutRoomsRaw({
    required String token,
    RoomGetBreakoutRoomsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomGetBreakoutRoomsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/breakout-rooms').expand(_parameters);
    return DynamiteRawResponse<RoomGetBreakoutRoomsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomGetBreakoutRoomsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Allowed guests to join conversation.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Allowed guests successfully
  ///   * 400: Allowing guests is not possible
  ///
  /// See:
  ///  * [makePublicRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomMakePublicResponseApplicationJson, void>> makePublic({
    required String token,
    RoomMakePublicApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = makePublicRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Allowed guests to join conversation.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Allowed guests successfully
  ///   * 400: Allowing guests is not possible
  ///
  /// See:
  ///  * [makePublic] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomMakePublicResponseApplicationJson, void> makePublicRaw({
    required String token,
    RoomMakePublicApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomMakePublicApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/public').expand(_parameters);
    return DynamiteRawResponse<RoomMakePublicResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomMakePublicResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Disallowed guests to join conversation.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room unpublished Disallowing guests successfully
  ///   * 400: Disallowing guests is not possible
  ///
  /// See:
  ///  * [makePrivateRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomMakePrivateResponseApplicationJson, void>> makePrivate({
    required String token,
    RoomMakePrivateApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = makePrivateRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Disallowed guests to join conversation.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room unpublished Disallowing guests successfully
  ///   * 400: Disallowing guests is not possible
  ///
  /// See:
  ///  * [makePrivate] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomMakePrivateResponseApplicationJson, void> makePrivateRaw({
    required String token,
    RoomMakePrivateApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomMakePrivateApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/public').expand(_parameters);
    return DynamiteRawResponse<RoomMakePrivateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomMakePrivateResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update the description of a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [description] New description.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Description updated successfully
  ///   * 400: Updating description is not possible
  ///
  /// See:
  ///  * [setDescriptionRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetDescriptionResponseApplicationJson, void>> setDescription({
    required String description,
    required String token,
    RoomSetDescriptionApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setDescriptionRaw(
      description: description,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the description of a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [description] New description.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Description updated successfully
  ///   * 400: Updating description is not possible
  ///
  /// See:
  ///  * [setDescription] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetDescriptionResponseApplicationJson, void> setDescriptionRaw({
    required String description,
    required String token,
    RoomSetDescriptionApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $description = jsonSerializers.serialize(description, specifiedType: const FullType(String));
    _parameters['description'] = $description;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetDescriptionApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/description{?description*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomSetDescriptionResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomSetDescriptionResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set read-only state of a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [state] New read-only state.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Read-only state updated successfully
  ///   * 400: Updating read-only state is not possible
  ///
  /// See:
  ///  * [setReadOnlyRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetReadOnlyResponseApplicationJson, void>> setReadOnly({
    required int state,
    required String token,
    RoomSetReadOnlyApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setReadOnlyRaw(
      state: state,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set read-only state of a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [state] New read-only state.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Read-only state updated successfully
  ///   * 400: Updating read-only state is not possible
  ///
  /// See:
  ///  * [setReadOnly] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetReadOnlyResponseApplicationJson, void> setReadOnlyRaw({
    required int state,
    required String token,
    RoomSetReadOnlyApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $state = jsonSerializers.serialize(state, specifiedType: const FullType(int));
    _parameters['state'] = $state;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetReadOnlyApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/read-only{?state*}').expand(_parameters);
    return DynamiteRawResponse<RoomSetReadOnlyResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomSetReadOnlyResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Make a room listable.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [scope] Scope where the room is listable.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Made room listable successfully
  ///   * 400: Making room listable is not possible
  ///
  /// See:
  ///  * [setListableRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetListableResponseApplicationJson, void>> setListable({
    required int scope,
    required String token,
    RoomSetListableApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setListableRaw(
      scope: scope,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Make a room listable.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [scope] Scope where the room is listable.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Made room listable successfully
  ///   * 400: Making room listable is not possible
  ///
  /// See:
  ///  * [setListable] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetListableResponseApplicationJson, void> setListableRaw({
    required int scope,
    required String token,
    RoomSetListableApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $scope = jsonSerializers.serialize(scope, specifiedType: const FullType(int));
    _parameters['scope'] = $scope;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetListableApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/listable{?scope*}').expand(_parameters);
    return DynamiteRawResponse<RoomSetListableResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomSetListableResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set a password for a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [password] New password.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Password set successfully
  ///   * 403: Setting password is not allowed
  ///   * 400: Setting password is not possible
  ///
  /// See:
  ///  * [setPasswordRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetPasswordResponseApplicationJson, void>> setPassword({
    required String password,
    required String token,
    RoomSetPasswordApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setPasswordRaw(
      password: password,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set a password for a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [password] New password.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Password set successfully
  ///   * 403: Setting password is not allowed
  ///   * 400: Setting password is not possible
  ///
  /// See:
  ///  * [setPassword] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetPasswordResponseApplicationJson, void> setPasswordRaw({
    required String password,
    required String token,
    RoomSetPasswordApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $password = jsonSerializers.serialize(password, specifiedType: const FullType(String));
    _parameters['password'] = $password;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetPasswordApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/password{?password*}').expand(_parameters);
    return DynamiteRawResponse<RoomSetPasswordResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200, 403},
      ),
      bodyType: const FullType(RoomSetPasswordResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update the permissions of a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [permissions] New permissions.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [mode] Level of the permissions ('call', 'default').
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Permissions updated successfully
  ///   * 400: Updating permissions is not possible
  ///
  /// See:
  ///  * [setPermissionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetPermissionsResponseApplicationJson, void>> setPermissions({
    required int permissions,
    required String token,
    required String mode,
    RoomSetPermissionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setPermissionsRaw(
      permissions: permissions,
      token: token,
      mode: mode,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the permissions of a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [permissions] New permissions.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [mode] Level of the permissions ('call', 'default').
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Permissions updated successfully
  ///   * 400: Updating permissions is not possible
  ///
  /// See:
  ///  * [setPermissions] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetPermissionsResponseApplicationJson, void> setPermissionsRaw({
    required int permissions,
    required String token,
    required String mode,
    RoomSetPermissionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $permissions = jsonSerializers.serialize(permissions, specifiedType: const FullType(int));
    _parameters['permissions'] = $permissions;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $mode = jsonSerializers.serialize(mode, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($mode as String?, RegExp(r'^(call|default)$'), 'mode');
    _parameters['mode'] = $mode;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetPermissionsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/permissions/{mode}{?permissions*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomSetPermissionsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomSetPermissionsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of participants for a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [includeStatus] Include the user statuses. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Participants returned
  ///   * 403: Missing permissions for getting participants
  ///
  /// See:
  ///  * [getParticipantsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomGetParticipantsResponseApplicationJson, RoomRoomGetParticipantsHeaders>> getParticipants({
    required String token,
    int? includeStatus,
    RoomGetParticipantsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getParticipantsRaw(
      token: token,
      includeStatus: includeStatus,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of participants for a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [includeStatus] Include the user statuses. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Participants returned
  ///   * 403: Missing permissions for getting participants
  ///
  /// See:
  ///  * [getParticipants] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomGetParticipantsResponseApplicationJson, RoomRoomGetParticipantsHeaders> getParticipantsRaw({
    required String token,
    int? includeStatus,
    RoomGetParticipantsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $includeStatus = jsonSerializers.serialize(includeStatus, specifiedType: const FullType(int));
    $includeStatus ??= 0;
    _parameters['includeStatus'] = $includeStatus;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomGetParticipantsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/participants{?includeStatus*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomGetParticipantsResponseApplicationJson, RoomRoomGetParticipantsHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomGetParticipantsResponseApplicationJson),
      headersType: const FullType(RoomRoomGetParticipantsHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Add a participant to a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newParticipant] New participant.
  ///   * [source] Source of the participant. Defaults to `users`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Participant successfully added
  ///   * 404: User, group or other target to invite was not found
  ///   * 501: SIP dial-out is not configured
  ///   * 400: Adding participant is not possible
  ///
  /// See:
  ///  * [addParticipantToRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomAddParticipantToRoomResponseApplicationJson, void>> addParticipantToRoom({
    required String newParticipant,
    required String token,
    String? source,
    RoomAddParticipantToRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = addParticipantToRoomRaw(
      newParticipant: newParticipant,
      token: token,
      source: source,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Add a participant to a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newParticipant] New participant.
  ///   * [source] Source of the participant. Defaults to `users`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Participant successfully added
  ///   * 404: User, group or other target to invite was not found
  ///   * 501: SIP dial-out is not configured
  ///   * 400: Adding participant is not possible
  ///
  /// See:
  ///  * [addParticipantToRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomAddParticipantToRoomResponseApplicationJson, void> addParticipantToRoomRaw({
    required String newParticipant,
    required String token,
    String? source,
    RoomAddParticipantToRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $newParticipant = jsonSerializers.serialize(newParticipant, specifiedType: const FullType(String));
    _parameters['newParticipant'] = $newParticipant;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $source = jsonSerializers.serialize(source, specifiedType: const FullType(String));
    $source ??= 'users';
    _parameters['source'] = $source;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomAddParticipantToRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/participants{?newParticipant*,source*}')
            .expand(_parameters);
    return DynamiteRawResponse<RoomAddParticipantToRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomAddParticipantToRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the breakout room participants for a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [includeStatus] Include the user statuses. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout room participants returned
  ///   * 400: Getting breakout room participants is not possible
  ///   * 403: Missing permissions to get breakout room participants
  ///
  /// See:
  ///  * [getBreakoutRoomParticipantsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<
      DynamiteResponse<RoomGetBreakoutRoomParticipantsResponseApplicationJson,
          RoomRoomGetBreakoutRoomParticipantsHeaders>> getBreakoutRoomParticipants({
    required String token,
    int? includeStatus,
    RoomGetBreakoutRoomParticipantsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getBreakoutRoomParticipantsRaw(
      token: token,
      includeStatus: includeStatus,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the breakout room participants for a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [includeStatus] Include the user statuses. Defaults to `0`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Breakout room participants returned
  ///   * 400: Getting breakout room participants is not possible
  ///   * 403: Missing permissions to get breakout room participants
  ///
  /// See:
  ///  * [getBreakoutRoomParticipants] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomGetBreakoutRoomParticipantsResponseApplicationJson,
      RoomRoomGetBreakoutRoomParticipantsHeaders> getBreakoutRoomParticipantsRaw({
    required String token,
    int? includeStatus,
    RoomGetBreakoutRoomParticipantsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $includeStatus = jsonSerializers.serialize(includeStatus, specifiedType: const FullType(int));
    $includeStatus ??= 0;
    _parameters['includeStatus'] = $includeStatus;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomGetBreakoutRoomParticipantsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/breakout-rooms/participants{?includeStatus*}',
    ).expand(_parameters);
    return DynamiteRawResponse<RoomGetBreakoutRoomParticipantsResponseApplicationJson,
        RoomRoomGetBreakoutRoomParticipantsHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomGetBreakoutRoomParticipantsResponseApplicationJson),
      headersType: const FullType(RoomRoomGetBreakoutRoomParticipantsHeaders),
      serializers: jsonSerializers,
    );
  }

  /// Remove the current user from a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Participant removed successfully
  ///   * 400: Removing participant is not possible
  ///   * 404: Participant not found
  ///
  /// See:
  ///  * [removeSelfFromRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomRemoveSelfFromRoomResponseApplicationJson, void>> removeSelfFromRoom({
    required String token,
    RoomRemoveSelfFromRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = removeSelfFromRoomRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove the current user from a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Participant removed successfully
  ///   * 400: Removing participant is not possible
  ///   * 404: Participant not found
  ///
  /// See:
  ///  * [removeSelfFromRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomRemoveSelfFromRoomResponseApplicationJson, void> removeSelfFromRoomRaw({
    required String token,
    RoomRemoveSelfFromRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomRemoveSelfFromRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/participants/self').expand(_parameters);
    return DynamiteRawResponse<RoomRemoveSelfFromRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 400, 404},
      ),
      bodyType: const FullType(RoomRemoveSelfFromRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Remove an attendee from a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee removed successfully
  ///   * 400: Removing attendee is not possible
  ///   * 403: Removing attendee is not allowed
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [removeAttendeeFromRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomRemoveAttendeeFromRoomResponseApplicationJson, void>> removeAttendeeFromRoom({
    required int attendeeId,
    required String token,
    RoomRemoveAttendeeFromRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = removeAttendeeFromRoomRaw(
      attendeeId: attendeeId,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove an attendee from a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee removed successfully
  ///   * 400: Removing attendee is not possible
  ///   * 403: Removing attendee is not allowed
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [removeAttendeeFromRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomRemoveAttendeeFromRoomResponseApplicationJson, void> removeAttendeeFromRoomRaw({
    required int attendeeId,
    required String token,
    RoomRemoveAttendeeFromRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $attendeeId = jsonSerializers.serialize(attendeeId, specifiedType: const FullType(int));
    _parameters['attendeeId'] = $attendeeId;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomRemoveAttendeeFromRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/attendees{?attendeeId*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomRemoveAttendeeFromRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 400, 403, 404},
      ),
      bodyType: const FullType(RoomRemoveAttendeeFromRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update the permissions of an attendee.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [method] Method of updating permissions ('set', 'remove', 'add').
  ///   * [permissions] New permissions.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Permissions updated successfully
  ///   * 400: Updating permissions is not possible
  ///   * 403: Missing permissions to update permissions
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [setAttendeePermissionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetAttendeePermissionsResponseApplicationJson, void>> setAttendeePermissions({
    required int attendeeId,
    required String method,
    required int permissions,
    required String token,
    RoomSetAttendeePermissionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setAttendeePermissionsRaw(
      attendeeId: attendeeId,
      method: method,
      permissions: permissions,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the permissions of an attendee.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [method] Method of updating permissions ('set', 'remove', 'add').
  ///   * [permissions] New permissions.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Permissions updated successfully
  ///   * 400: Updating permissions is not possible
  ///   * 403: Missing permissions to update permissions
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [setAttendeePermissions] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetAttendeePermissionsResponseApplicationJson, void> setAttendeePermissionsRaw({
    required int attendeeId,
    required String method,
    required int permissions,
    required String token,
    RoomSetAttendeePermissionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $attendeeId = jsonSerializers.serialize(attendeeId, specifiedType: const FullType(int));
    _parameters['attendeeId'] = $attendeeId;

    final $method = jsonSerializers.serialize(method, specifiedType: const FullType(String));
    _parameters['method'] = $method;

    final $permissions = jsonSerializers.serialize(permissions, specifiedType: const FullType(int));
    _parameters['permissions'] = $permissions;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetAttendeePermissionsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/attendees/permissions{?attendeeId*,method*,permissions*}',
    ).expand(_parameters);
    return DynamiteRawResponse<RoomSetAttendeePermissionsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200, 400, 403, 404},
      ),
      bodyType: const FullType(RoomSetAttendeePermissionsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update the permissions of all attendees.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [method] Method of updating permissions ('set', 'remove', 'add').
  ///   * [permissions] New permissions.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Permissions updated successfully
  ///   * 400: Updating permissions is not possible
  ///
  /// See:
  ///  * [setAllAttendeesPermissionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetAllAttendeesPermissionsResponseApplicationJson, void>> setAllAttendeesPermissions({
    required String method,
    required int permissions,
    required String token,
    RoomSetAllAttendeesPermissionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setAllAttendeesPermissionsRaw(
      method: method,
      permissions: permissions,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the permissions of all attendees.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [method] Method of updating permissions ('set', 'remove', 'add').
  ///   * [permissions] New permissions.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Permissions updated successfully
  ///   * 400: Updating permissions is not possible
  ///
  /// See:
  ///  * [setAllAttendeesPermissions] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetAllAttendeesPermissionsResponseApplicationJson, void> setAllAttendeesPermissionsRaw({
    required String method,
    required int permissions,
    required String token,
    RoomSetAllAttendeesPermissionsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $method = jsonSerializers.serialize(method, specifiedType: const FullType(String));
    _parameters['method'] = $method;

    final $permissions = jsonSerializers.serialize(permissions, specifiedType: const FullType(int));
    _parameters['permissions'] = $permissions;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetAllAttendeesPermissionsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/attendees/permissions/all{?method*,permissions*}',
    ).expand(_parameters);
    return DynamiteRawResponse<RoomSetAllAttendeesPermissionsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomSetAllAttendeesPermissionsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Join a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [password] Password of the room. Defaults to `''`.
  ///   * [force] Create a new session if necessary. Defaults to `1`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room joined successfully
  ///   * 403: Joining room is not allowed
  ///   * 404: Room not found
  ///   * 409: Session already exists
  ///
  /// See:
  ///  * [joinRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomJoinRoomResponseApplicationJson, void>> joinRoom({
    required String token,
    String? password,
    int? force,
    RoomJoinRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = joinRoomRaw(
      token: token,
      password: password,
      force: force,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Join a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [password] Password of the room. Defaults to `''`.
  ///   * [force] Create a new session if necessary. Defaults to `1`.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Room joined successfully
  ///   * 403: Joining room is not allowed
  ///   * 404: Room not found
  ///   * 409: Session already exists
  ///
  /// See:
  ///  * [joinRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomJoinRoomResponseApplicationJson, void> joinRoomRaw({
    required String token,
    String? password,
    int? force,
    RoomJoinRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $password = jsonSerializers.serialize(password, specifiedType: const FullType(String));
    $password ??= '';
    _parameters['password'] = $password;

    var $force = jsonSerializers.serialize(force, specifiedType: const FullType(int));
    $force ??= 1;
    _parameters['force'] = $force;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomJoinRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/participants/active{?password*,force*}')
            .expand(_parameters);
    return DynamiteRawResponse<RoomJoinRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomJoinRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Leave a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Successfully left the room
  ///
  /// See:
  ///  * [leaveRoomRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomLeaveRoomResponseApplicationJson, void>> leaveRoom({
    required String token,
    RoomLeaveRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = leaveRoomRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Leave a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Successfully left the room
  ///
  /// See:
  ///  * [leaveRoom] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomLeaveRoomResponseApplicationJson, void> leaveRoomRaw({
    required String token,
    RoomLeaveRoomApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomLeaveRoomApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/participants/active').expand(_parameters);
    return DynamiteRawResponse<RoomLeaveRoomResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomLeaveRoomResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Resend invitations.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Invitation resent successfully
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [resendInvitationsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomResendInvitationsResponseApplicationJson, void>> resendInvitations({
    required String token,
    int? attendeeId,
    RoomResendInvitationsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = resendInvitationsRaw(
      token: token,
      attendeeId: attendeeId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Resend invitations.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Invitation resent successfully
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [resendInvitations] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomResendInvitationsResponseApplicationJson, void> resendInvitationsRaw({
    required String token,
    int? attendeeId,
    RoomResendInvitationsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $attendeeId = jsonSerializers.serialize(attendeeId, specifiedType: const FullType(int));
    _parameters['attendeeId'] = $attendeeId;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomResendInvitationsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/participants/resend-invitations{?attendeeId*}',
    ).expand(_parameters);
    return DynamiteRawResponse<RoomResendInvitationsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 404},
      ),
      bodyType: const FullType(RoomResendInvitationsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set active state for a session.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [state] of the room.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Session state set successfully
  ///   * 400: The provided new state was invalid
  ///
  /// See:
  ///  * [setSessionStateRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetSessionStateResponseApplicationJson, void>> setSessionState({
    required int state,
    required String token,
    RoomSetSessionStateApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setSessionStateRaw(
      state: state,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set active state for a session.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [state] of the room.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Session state set successfully
  ///   * 400: The provided new state was invalid
  ///
  /// See:
  ///  * [setSessionState] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetSessionStateResponseApplicationJson, void> setSessionStateRaw({
    required int state,
    required String token,
    RoomSetSessionStateApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $state = jsonSerializers.serialize(state, specifiedType: const FullType(int));
    _parameters['state'] = $state;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetSessionStateApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/participants/state{?state*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomSetSessionStateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomSetSessionStateResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Promote an attendee to moderator.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee promoted to moderator successfully
  ///   * 400: Promoting attendee to moderator is not possible
  ///   * 403: Promoting attendee to moderator is not allowed
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [promoteModeratorRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomPromoteModeratorResponseApplicationJson, void>> promoteModerator({
    required int attendeeId,
    required String token,
    RoomPromoteModeratorApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = promoteModeratorRaw(
      attendeeId: attendeeId,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Promote an attendee to moderator.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee promoted to moderator successfully
  ///   * 400: Promoting attendee to moderator is not possible
  ///   * 403: Promoting attendee to moderator is not allowed
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [promoteModerator] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomPromoteModeratorResponseApplicationJson, void> promoteModeratorRaw({
    required int attendeeId,
    required String token,
    RoomPromoteModeratorApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $attendeeId = jsonSerializers.serialize(attendeeId, specifiedType: const FullType(int));
    _parameters['attendeeId'] = $attendeeId;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomPromoteModeratorApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/moderators{?attendeeId*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomPromoteModeratorResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 400, 403, 404},
      ),
      bodyType: const FullType(RoomPromoteModeratorResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Demote an attendee from moderator.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee demoted from moderator successfully
  ///   * 400: Demoting attendee from moderator is not possible
  ///   * 403: Demoting attendee from moderator is not allowed
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [demoteModeratorRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomDemoteModeratorResponseApplicationJson, void>> demoteModerator({
    required int attendeeId,
    required String token,
    RoomDemoteModeratorApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = demoteModeratorRaw(
      attendeeId: attendeeId,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Demote an attendee from moderator.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [attendeeId] ID of the attendee.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Attendee demoted from moderator successfully
  ///   * 400: Demoting attendee from moderator is not possible
  ///   * 403: Demoting attendee from moderator is not allowed
  ///   * 404: Attendee not found
  ///
  /// See:
  ///  * [demoteModerator] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomDemoteModeratorResponseApplicationJson, void> demoteModeratorRaw({
    required int attendeeId,
    required String token,
    RoomDemoteModeratorApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $attendeeId = jsonSerializers.serialize(attendeeId, specifiedType: const FullType(int));
    _parameters['attendeeId'] = $attendeeId;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomDemoteModeratorApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/moderators{?attendeeId*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomDemoteModeratorResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 400, 403, 404},
      ),
      bodyType: const FullType(RoomDemoteModeratorResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Add a room to the favorites.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Successfully added room to favorites
  ///
  /// See:
  ///  * [addToFavoritesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomAddToFavoritesResponseApplicationJson, void>> addToFavorites({
    required String token,
    RoomAddToFavoritesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = addToFavoritesRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Add a room to the favorites.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Successfully added room to favorites
  ///
  /// See:
  ///  * [addToFavorites] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomAddToFavoritesResponseApplicationJson, void> addToFavoritesRaw({
    required String token,
    RoomAddToFavoritesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomAddToFavoritesApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/favorite').expand(_parameters);
    return DynamiteRawResponse<RoomAddToFavoritesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomAddToFavoritesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Remove a room from the favorites.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Successfully removed room from favorites
  ///
  /// See:
  ///  * [removeFromFavoritesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomRemoveFromFavoritesResponseApplicationJson, void>> removeFromFavorites({
    required String token,
    RoomRemoveFromFavoritesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = removeFromFavoritesRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a room from the favorites.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Successfully removed room from favorites
  ///
  /// See:
  ///  * [removeFromFavorites] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomRemoveFromFavoritesResponseApplicationJson, void> removeFromFavoritesRaw({
    required String token,
    RoomRemoveFromFavoritesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomRemoveFromFavoritesApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/favorite').expand(_parameters);
    return DynamiteRawResponse<RoomRemoveFromFavoritesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomRemoveFromFavoritesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update the notification level for a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [level] New level.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification level updated successfully
  ///   * 400: Updating notification level is not possible
  ///
  /// See:
  ///  * [setNotificationLevelRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetNotificationLevelResponseApplicationJson, void>> setNotificationLevel({
    required int level,
    required String token,
    RoomSetNotificationLevelApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setNotificationLevelRaw(
      level: level,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the notification level for a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [level] New level.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification level updated successfully
  ///   * 400: Updating notification level is not possible
  ///
  /// See:
  ///  * [setNotificationLevel] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetNotificationLevelResponseApplicationJson, void> setNotificationLevelRaw({
    required int level,
    required String token,
    RoomSetNotificationLevelApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $level = jsonSerializers.serialize(level, specifiedType: const FullType(int));
    _parameters['level'] = $level;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetNotificationLevelApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/notify{?level*}').expand(_parameters);
    return DynamiteRawResponse<RoomSetNotificationLevelResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomSetNotificationLevelResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update call notifications.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [level] New level.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Call notification level updated successfully
  ///   * 400: Updating call notification level is not possible
  ///
  /// See:
  ///  * [setNotificationCallsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetNotificationCallsResponseApplicationJson, void>> setNotificationCalls({
    required int level,
    required String token,
    RoomSetNotificationCallsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setNotificationCallsRaw(
      level: level,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update call notifications.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [level] New level.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Call notification level updated successfully
  ///   * 400: Updating call notification level is not possible
  ///
  /// See:
  ///  * [setNotificationCalls] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetNotificationCallsResponseApplicationJson, void> setNotificationCallsRaw({
    required int level,
    required String token,
    RoomSetNotificationCallsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $level = jsonSerializers.serialize(level, specifiedType: const FullType(int));
    _parameters['level'] = $level;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetNotificationCallsApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/notify-calls{?level*}').expand(_parameters);
    return DynamiteRawResponse<RoomSetNotificationCallsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(RoomSetNotificationCallsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update the lobby state for a room.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [state] New state.
  ///   * [timer] Timer when the lobby will be removed.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Lobby state updated successfully
  ///   * 400: Updating lobby state is not possible
  ///
  /// See:
  ///  * [setLobbyRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetLobbyResponseApplicationJson, void>> setLobby({
    required int state,
    required String token,
    int? timer,
    RoomSetLobbyApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setLobbyRaw(
      state: state,
      token: token,
      timer: timer,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the lobby state for a room.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [state] New state.
  ///   * [timer] Timer when the lobby will be removed.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Lobby state updated successfully
  ///   * 400: Updating lobby state is not possible
  ///
  /// See:
  ///  * [setLobby] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetLobbyResponseApplicationJson, void> setLobbyRaw({
    required int state,
    required String token,
    int? timer,
    RoomSetLobbyApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $state = jsonSerializers.serialize(state, specifiedType: const FullType(int));
    _parameters['state'] = $state;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    final $timer = jsonSerializers.serialize(timer, specifiedType: const FullType(int));
    _parameters['timer'] = $timer;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetLobbyApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/webinar/lobby{?state*,timer*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomSetLobbyResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomSetLobbyResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update SIP enabled state.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [state] New state.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: SIP enabled state updated successfully
  ///   * 400: Updating SIP enabled state is not possible
  ///   * 401: User not found
  ///   * 403: Missing permissions to update SIP enabled state
  ///   * 412: SIP not configured
  ///
  /// See:
  ///  * [setsipEnabledRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetsipEnabledResponseApplicationJson, void>> setsipEnabled({
    required int state,
    required String token,
    RoomSetsipEnabledApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setsipEnabledRaw(
      state: state,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update SIP enabled state.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [state] New state.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: SIP enabled state updated successfully
  ///   * 400: Updating SIP enabled state is not possible
  ///   * 401: User not found
  ///   * 403: Missing permissions to update SIP enabled state
  ///   * 412: SIP not configured
  ///
  /// See:
  ///  * [setsipEnabled] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetsipEnabledResponseApplicationJson, void> setsipEnabledRaw({
    required int state,
    required String token,
    RoomSetsipEnabledApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $state = jsonSerializers.serialize(state, specifiedType: const FullType(int));
    _parameters['state'] = $state;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetsipEnabledApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/webinar/sip{?state*}').expand(_parameters);
    return DynamiteRawResponse<RoomSetsipEnabledResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomSetsipEnabledResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set recording consent requirement for this conversation.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [recordingConsent] New consent setting for the conversation (Only {@see RecordingService::CONSENT_REQUIRED_NO} and {@see RecordingService::CONSENT_REQUIRED_YES} are allowed here.).
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording consent requirement set successfully
  ///   * 400: Setting recording consent requirement is not possible
  ///   * 412: No recording server is configured
  ///
  /// See:
  ///  * [setRecordingConsentRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetRecordingConsentResponseApplicationJson, void>> setRecordingConsent({
    required int recordingConsent,
    required String token,
    RoomSetRecordingConsentApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setRecordingConsentRaw(
      recordingConsent: recordingConsent,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set recording consent requirement for this conversation.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [recordingConsent] New consent setting for the conversation (Only {@see RecordingService::CONSENT_REQUIRED_NO} and {@see RecordingService::CONSENT_REQUIRED_YES} are allowed here.).
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recording consent requirement set successfully
  ///   * 400: Setting recording consent requirement is not possible
  ///   * 412: No recording server is configured
  ///
  /// See:
  ///  * [setRecordingConsent] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetRecordingConsentResponseApplicationJson, void> setRecordingConsentRaw({
    required int recordingConsent,
    required String token,
    RoomSetRecordingConsentApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $recordingConsent = jsonSerializers.serialize(recordingConsent, specifiedType: const FullType(int));
    _parameters['recordingConsent'] = $recordingConsent;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetRecordingConsentApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/recording-consent{?recordingConsent*}')
            .expand(_parameters);
    return DynamiteRawResponse<RoomSetRecordingConsentResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomSetRecordingConsentResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update message expiration time.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [seconds] New time.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Message expiration time updated successfully
  ///   * 400: Updating message expiration time is not possible
  ///
  /// See:
  ///  * [setMessageExpirationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RoomSetMessageExpirationResponseApplicationJson, void>> setMessageExpiration({
    required int seconds,
    required String token,
    RoomSetMessageExpirationApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setMessageExpirationRaw(
      seconds: seconds,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update message expiration time.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [seconds] New time.
  ///   * [apiVersion] Defaults to `v4`.
  ///   * [token]
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Message expiration time updated successfully
  ///   * 400: Updating message expiration time is not possible
  ///
  /// See:
  ///  * [setMessageExpiration] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RoomSetMessageExpirationResponseApplicationJson, void> setMessageExpirationRaw({
    required int seconds,
    required String token,
    RoomSetMessageExpirationApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $seconds = jsonSerializers.serialize(seconds, specifiedType: const FullType(int));
    _parameters['seconds'] = $seconds;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(RoomSetMessageExpirationApiVersion));
    $apiVersion ??= 'v4';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/room/{token}/message-expiration{?seconds*}')
        .expand(_parameters);
    return DynamiteRawResponse<RoomSetMessageExpirationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(RoomSetMessageExpirationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class SettingsClient {
  SettingsClient(this._rootClient);

  final Client _rootClient;

  /// Update SIP settings.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [sipGroups] New SIP groups. Defaults to `[]`.
  ///   * [dialInInfo] New dial info. Defaults to `''`.
  ///   * [sharedSecret] New shared secret. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Successfully set new SIP settings
  ///
  /// See:
  ///  * [setsipSettingsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SettingsSetsipSettingsResponseApplicationJson, void>> setsipSettings({
    BuiltList<String>? sipGroups,
    String? dialInInfo,
    String? sharedSecret,
    SettingsSetsipSettingsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setsipSettingsRaw(
      sipGroups: sipGroups,
      dialInInfo: dialInInfo,
      sharedSecret: sharedSecret,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update SIP settings.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [sipGroups] New SIP groups. Defaults to `[]`.
  ///   * [dialInInfo] New dial info. Defaults to `''`.
  ///   * [sharedSecret] New shared secret. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Successfully set new SIP settings
  ///
  /// See:
  ///  * [setsipSettings] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SettingsSetsipSettingsResponseApplicationJson, void> setsipSettingsRaw({
    BuiltList<String>? sipGroups,
    String? dialInInfo,
    String? sharedSecret,
    SettingsSetsipSettingsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $sipGroups = jsonSerializers.serialize(sipGroups, specifiedType: const FullType(BuiltList, [FullType(String)]));
    $sipGroups ??= [];
    _parameters['sipGroups%5B%5D'] = $sipGroups;

    var $dialInInfo = jsonSerializers.serialize(dialInInfo, specifiedType: const FullType(String));
    $dialInInfo ??= '';
    _parameters['dialInInfo'] = $dialInInfo;

    var $sharedSecret = jsonSerializers.serialize(sharedSecret, specifiedType: const FullType(String));
    $sharedSecret ??= '';
    _parameters['sharedSecret'] = $sharedSecret;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(SettingsSetsipSettingsApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate(
      '/ocs/v2.php/apps/spreed/api/{apiVersion}/settings/sip{?sipGroups%5B%5D*,dialInInfo*,sharedSecret*}',
    ).expand(_parameters);
    return DynamiteRawResponse<SettingsSetsipSettingsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(SettingsSetsipSettingsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update user setting.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key to update.
  ///   * [value] New value for the key.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User setting updated successfully
  ///   * 400: Updating user setting is not possible
  ///
  /// See:
  ///  * [setUserSettingRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SettingsSetUserSettingResponseApplicationJson, void>> setUserSetting({
    required String key,
    ContentString<SettingsSetUserSettingValue>? value,
    SettingsSetUserSettingApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setUserSettingRaw(
      key: key,
      value: value,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update user setting.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key to update.
  ///   * [value] New value for the key.
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User setting updated successfully
  ///   * 400: Updating user setting is not possible
  ///
  /// See:
  ///  * [setUserSetting] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SettingsSetUserSettingResponseApplicationJson, void> setUserSettingRaw({
    required String key,
    ContentString<SettingsSetUserSettingValue>? value,
    SettingsSetUserSettingApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $key = jsonSerializers.serialize(key, specifiedType: const FullType(String));
    _parameters['key'] = $key;

    final $value = jsonSerializers.serialize(
      value,
      specifiedType: const FullType(ContentString, [FullType(SettingsSetUserSettingValue)]),
    );
    _parameters['value'] = $value;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(SettingsSetUserSettingApiVersion));
    $apiVersion ??= 'v1';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/settings/user{?key*,value*}').expand(_parameters);
    return DynamiteRawResponse<SettingsSetUserSettingResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(SettingsSetUserSettingResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class SignalingClient {
  SignalingClient(this._rootClient);

  final Client _rootClient;

  /// Get the signaling settings.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] Token of the room. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v3`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Signaling settings returned
  ///   * 401: Recording request invalid
  ///   * 404: Room not found
  ///
  /// See:
  ///  * [getSettingsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SignalingGetSettingsResponseApplicationJson, void>> getSettings({
    String? token,
    SignalingGetSettingsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getSettingsRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the signaling settings.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] Token of the room. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v3`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Signaling settings returned
  ///   * 401: Recording request invalid
  ///   * 404: Room not found
  ///
  /// See:
  ///  * [getSettings] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SignalingGetSettingsResponseApplicationJson, void> getSettingsRaw({
    String? token,
    SignalingGetSettingsApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    var $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    $token ??= '';
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(SignalingGetSettingsApiVersion));
    $apiVersion ??= 'v3';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/signaling/settings{?token*}').expand(_parameters);
    return DynamiteRawResponse<SignalingGetSettingsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(SignalingGetSettingsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the welcome message from a signaling server.
  ///
  /// Only available for logged-in users because guests can not use the apps right now.
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v3`.
  ///   * [serverId] ID of the signaling server.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Welcome message returned
  ///   * 404: Signaling server not found
  ///   * 500
  ///
  /// See:
  ///  * [getWelcomeMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SignalingGetWelcomeMessageResponseApplicationJson, void>> getWelcomeMessage({
    required int serverId,
    SignalingGetWelcomeMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getWelcomeMessageRaw(
      serverId: serverId,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the welcome message from a signaling server.
  ///
  /// Only available for logged-in users because guests can not use the apps right now.
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v3`.
  ///   * [serverId] ID of the signaling server.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Welcome message returned
  ///   * 404: Signaling server not found
  ///   * 500
  ///
  /// See:
  ///  * [getWelcomeMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SignalingGetWelcomeMessageResponseApplicationJson, void> getWelcomeMessageRaw({
    required int serverId,
    SignalingGetWelcomeMessageApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $serverId = jsonSerializers.serialize(serverId, specifiedType: const FullType(int));
    _parameters['serverId'] = $serverId;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(SignalingGetWelcomeMessageApiVersion));
    $apiVersion ??= 'v3';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/signaling/welcome/{serverId}').expand(_parameters);
    return DynamiteRawResponse<SignalingGetWelcomeMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(SignalingGetWelcomeMessageResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get signaling messages.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v3`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Signaling messages returned
  ///   * 404: Session, room or participant not found
  ///   * 409: Session killed
  ///   * 400: Getting signaling messages is not possible
  ///
  /// See:
  ///  * [pullMessagesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SignalingPullMessagesResponseApplicationJson, void>> pullMessages({
    required String token,
    SignalingPullMessagesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = pullMessagesRaw(
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get signaling messages.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v3`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Signaling messages returned
  ///   * 404: Session, room or participant not found
  ///   * 409: Session killed
  ///   * 400: Getting signaling messages is not possible
  ///
  /// See:
  ///  * [pullMessages] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SignalingPullMessagesResponseApplicationJson, void> pullMessagesRaw({
    required String token,
    SignalingPullMessagesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(SignalingPullMessagesApiVersion));
    $apiVersion ??= 'v3';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/signaling/{token}').expand(_parameters);
    return DynamiteRawResponse<SignalingPullMessagesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200, 404, 409},
      ),
      bodyType: const FullType(SignalingPullMessagesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Send signaling messages.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [messages] JSON encoded messages.
  ///   * [apiVersion] Defaults to `v3`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Signaling message sent successfully
  ///   * 400: Sending signaling message is not possible
  ///
  /// See:
  ///  * [sendMessagesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SignalingSendMessagesResponseApplicationJson, void>> sendMessages({
    required String messages,
    required String token,
    SignalingSendMessagesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = sendMessagesRaw(
      messages: messages,
      token: token,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Send signaling messages.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [messages] JSON encoded messages.
  ///   * [apiVersion] Defaults to `v3`.
  ///   * [token] Token of the room.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Signaling message sent successfully
  ///   * 400: Sending signaling message is not possible
  ///
  /// See:
  ///  * [sendMessages] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SignalingSendMessagesResponseApplicationJson, void> sendMessagesRaw({
    required String messages,
    required String token,
    SignalingSendMessagesApiVersion? apiVersion,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $messages = jsonSerializers.serialize(messages, specifiedType: const FullType(String));
    _parameters['messages'] = $messages;

    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($token as String?, RegExp(r'^[a-z0-9]{4,30}$'), 'token');
    _parameters['token'] = $token;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(SignalingSendMessagesApiVersion));
    $apiVersion ??= 'v3';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/spreed/api/{apiVersion}/signaling/{token}{?messages*}').expand(_parameters);
    return DynamiteRawResponse<SignalingSendMessagesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(SignalingSendMessagesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class TempAvatarClient {
  TempAvatarClient(this._rootClient);

  final Client _rootClient;

  /// Upload a temporary avatar.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar uploaded successfully
  ///   * 400: Uploading avatar is not possible
  ///
  /// See:
  ///  * [postAvatarRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TempAvatarPostAvatarResponseApplicationJson, void>> postAvatar({bool? oCSAPIRequest}) async {
    final rawResponse = postAvatarRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Upload a temporary avatar.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar uploaded successfully
  ///   * 400: Uploading avatar is not possible
  ///
  /// See:
  ///  * [postAvatar] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TempAvatarPostAvatarResponseApplicationJson, void> postAvatarRaw({bool? oCSAPIRequest}) {
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    const _path = '/ocs/v2.php/apps/spreed/temp-user-avatar';
    return DynamiteRawResponse<TempAvatarPostAvatarResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TempAvatarPostAvatarResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete a temporary avatar.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar deleted successfully
  ///   * 400: Deleting avatar is not possible
  ///
  /// See:
  ///  * [deleteAvatarRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TempAvatarDeleteAvatarResponseApplicationJson, void>> deleteAvatar({
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteAvatarRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a temporary avatar.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Avatar deleted successfully
  ///   * 400: Deleting avatar is not possible
  ///
  /// See:
  ///  * [deleteAvatar] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TempAvatarDeleteAvatarResponseApplicationJson, void> deleteAvatarRaw({bool? oCSAPIRequest}) {
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    const _path = '/ocs/v2.php/apps/spreed/temp-user-avatar';
    return DynamiteRawResponse<TempAvatarDeleteAvatarResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(TempAvatarDeleteAvatarResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class AvatarGetAvatarApiVersion extends EnumClass {
  const AvatarGetAvatarApiVersion._(super.name);

  static const AvatarGetAvatarApiVersion v1 = _$avatarGetAvatarApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<AvatarGetAvatarApiVersion> get values => _$avatarGetAvatarApiVersionValues;
  // coverage:ignore-end

  static AvatarGetAvatarApiVersion valueOf(String name) => _$valueOfAvatarGetAvatarApiVersion(name);

  static Serializer<AvatarGetAvatarApiVersion> get serializer => _$avatarGetAvatarApiVersionSerializer;
}

class AvatarUploadAvatarApiVersion extends EnumClass {
  const AvatarUploadAvatarApiVersion._(super.name);

  static const AvatarUploadAvatarApiVersion v1 = _$avatarUploadAvatarApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<AvatarUploadAvatarApiVersion> get values => _$avatarUploadAvatarApiVersionValues;
  // coverage:ignore-end

  static AvatarUploadAvatarApiVersion valueOf(String name) => _$valueOfAvatarUploadAvatarApiVersion(name);

  static Serializer<AvatarUploadAvatarApiVersion> get serializer => _$avatarUploadAvatarApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements $OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatMessageInterface {
  String get actorDisplayName;
  String get actorId;
  String get actorType;
  bool? get deleted;
  int get expirationTimestamp;
  int get id;
  bool get isReplyable;
  bool? get markdown;
  String get message;
  BuiltMap<String, BuiltMap<String, JsonObject>> get messageParameters;
  String get messageType;
  BuiltMap<String, int> get reactions;
  String get referenceId;
  String get systemMessage;
  int get timestamp;
  String get token;
}

abstract class ChatMessage implements $ChatMessageInterface, Built<ChatMessage, ChatMessageBuilder> {
  factory ChatMessage([void Function(ChatMessageBuilder)? b]) = _$ChatMessage;

  // coverage:ignore-start
  const ChatMessage._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatMessage.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatMessage> get serializer => _$chatMessageSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomInterface {
  String get actorId;
  String get actorType;
  int get attendeeId;
  int get attendeePermissions;
  String? get attendeePin;
  String get avatarVersion;
  int get breakoutRoomMode;
  int get breakoutRoomStatus;
  int get callFlag;
  int get callPermissions;
  int get callRecording;
  int get callStartTime;
  bool get canDeleteConversation;
  bool get canEnableSIP;
  bool get canLeaveConversation;
  bool get canStartCall;
  int get defaultPermissions;
  String get description;
  String get displayName;
  bool get hasCall;
  bool get hasPassword;
  int get id;
  bool? get isCustomAvatar;
  bool get isFavorite;
  int get lastActivity;
  int get lastCommonReadMessage;
  Room_LastMessage get lastMessage;
  int get lastPing;
  int get lastReadMessage;
  int get listable;
  int get lobbyState;
  int get lobbyTimer;
  int get messageExpiration;
  String get name;
  int get notificationCalls;
  int get notificationLevel;
  String get objectId;
  String get objectType;
  int get participantFlags;
  int get participantType;
  int get permissions;
  int get readOnly;
  int? get recordingConsent;
  String get sessionId;
  int get sipEnabled;
  String? get status;
  int? get statusClearAt;
  String? get statusIcon;
  String? get statusMessage;
  String get token;
  int get type;
  bool get unreadMention;
  bool get unreadMentionDirect;
  int get unreadMessages;
}

abstract class Room implements $RoomInterface, Built<Room, RoomBuilder> {
  factory Room([void Function(RoomBuilder)? b]) = _$Room;

  // coverage:ignore-start
  const Room._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Room.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Room> get serializer => _$roomSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(RoomBuilder b) {
    b.lastMessage?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $AvatarUploadAvatarResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class AvatarUploadAvatarResponseApplicationJson_Ocs
    implements
        $AvatarUploadAvatarResponseApplicationJson_OcsInterface,
        Built<AvatarUploadAvatarResponseApplicationJson_Ocs, AvatarUploadAvatarResponseApplicationJson_OcsBuilder> {
  factory AvatarUploadAvatarResponseApplicationJson_Ocs([
    void Function(AvatarUploadAvatarResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AvatarUploadAvatarResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AvatarUploadAvatarResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarUploadAvatarResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AvatarUploadAvatarResponseApplicationJson_Ocs> get serializer =>
      _$avatarUploadAvatarResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AvatarUploadAvatarResponseApplicationJsonInterface {
  AvatarUploadAvatarResponseApplicationJson_Ocs get ocs;
}

abstract class AvatarUploadAvatarResponseApplicationJson
    implements
        $AvatarUploadAvatarResponseApplicationJsonInterface,
        Built<AvatarUploadAvatarResponseApplicationJson, AvatarUploadAvatarResponseApplicationJsonBuilder> {
  factory AvatarUploadAvatarResponseApplicationJson([
    void Function(AvatarUploadAvatarResponseApplicationJsonBuilder)? b,
  ]) = _$AvatarUploadAvatarResponseApplicationJson;

  // coverage:ignore-start
  const AvatarUploadAvatarResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarUploadAvatarResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AvatarUploadAvatarResponseApplicationJson> get serializer =>
      _$avatarUploadAvatarResponseApplicationJsonSerializer;
}

class AvatarDeleteAvatarApiVersion extends EnumClass {
  const AvatarDeleteAvatarApiVersion._(super.name);

  static const AvatarDeleteAvatarApiVersion v1 = _$avatarDeleteAvatarApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<AvatarDeleteAvatarApiVersion> get values => _$avatarDeleteAvatarApiVersionValues;
  // coverage:ignore-end

  static AvatarDeleteAvatarApiVersion valueOf(String name) => _$valueOfAvatarDeleteAvatarApiVersion(name);

  static Serializer<AvatarDeleteAvatarApiVersion> get serializer => _$avatarDeleteAvatarApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AvatarDeleteAvatarResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class AvatarDeleteAvatarResponseApplicationJson_Ocs
    implements
        $AvatarDeleteAvatarResponseApplicationJson_OcsInterface,
        Built<AvatarDeleteAvatarResponseApplicationJson_Ocs, AvatarDeleteAvatarResponseApplicationJson_OcsBuilder> {
  factory AvatarDeleteAvatarResponseApplicationJson_Ocs([
    void Function(AvatarDeleteAvatarResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AvatarDeleteAvatarResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AvatarDeleteAvatarResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarDeleteAvatarResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AvatarDeleteAvatarResponseApplicationJson_Ocs> get serializer =>
      _$avatarDeleteAvatarResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AvatarDeleteAvatarResponseApplicationJsonInterface {
  AvatarDeleteAvatarResponseApplicationJson_Ocs get ocs;
}

abstract class AvatarDeleteAvatarResponseApplicationJson
    implements
        $AvatarDeleteAvatarResponseApplicationJsonInterface,
        Built<AvatarDeleteAvatarResponseApplicationJson, AvatarDeleteAvatarResponseApplicationJsonBuilder> {
  factory AvatarDeleteAvatarResponseApplicationJson([
    void Function(AvatarDeleteAvatarResponseApplicationJsonBuilder)? b,
  ]) = _$AvatarDeleteAvatarResponseApplicationJson;

  // coverage:ignore-start
  const AvatarDeleteAvatarResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarDeleteAvatarResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AvatarDeleteAvatarResponseApplicationJson> get serializer =>
      _$avatarDeleteAvatarResponseApplicationJsonSerializer;
}

class AvatarEmojiAvatarApiVersion extends EnumClass {
  const AvatarEmojiAvatarApiVersion._(super.name);

  static const AvatarEmojiAvatarApiVersion v1 = _$avatarEmojiAvatarApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<AvatarEmojiAvatarApiVersion> get values => _$avatarEmojiAvatarApiVersionValues;
  // coverage:ignore-end

  static AvatarEmojiAvatarApiVersion valueOf(String name) => _$valueOfAvatarEmojiAvatarApiVersion(name);

  static Serializer<AvatarEmojiAvatarApiVersion> get serializer => _$avatarEmojiAvatarApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AvatarEmojiAvatarResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class AvatarEmojiAvatarResponseApplicationJson_Ocs
    implements
        $AvatarEmojiAvatarResponseApplicationJson_OcsInterface,
        Built<AvatarEmojiAvatarResponseApplicationJson_Ocs, AvatarEmojiAvatarResponseApplicationJson_OcsBuilder> {
  factory AvatarEmojiAvatarResponseApplicationJson_Ocs([
    void Function(AvatarEmojiAvatarResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AvatarEmojiAvatarResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AvatarEmojiAvatarResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarEmojiAvatarResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AvatarEmojiAvatarResponseApplicationJson_Ocs> get serializer =>
      _$avatarEmojiAvatarResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AvatarEmojiAvatarResponseApplicationJsonInterface {
  AvatarEmojiAvatarResponseApplicationJson_Ocs get ocs;
}

abstract class AvatarEmojiAvatarResponseApplicationJson
    implements
        $AvatarEmojiAvatarResponseApplicationJsonInterface,
        Built<AvatarEmojiAvatarResponseApplicationJson, AvatarEmojiAvatarResponseApplicationJsonBuilder> {
  factory AvatarEmojiAvatarResponseApplicationJson([
    void Function(AvatarEmojiAvatarResponseApplicationJsonBuilder)? b,
  ]) = _$AvatarEmojiAvatarResponseApplicationJson;

  // coverage:ignore-start
  const AvatarEmojiAvatarResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarEmojiAvatarResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AvatarEmojiAvatarResponseApplicationJson> get serializer =>
      _$avatarEmojiAvatarResponseApplicationJsonSerializer;
}

class AvatarGetAvatarDarkApiVersion extends EnumClass {
  const AvatarGetAvatarDarkApiVersion._(super.name);

  static const AvatarGetAvatarDarkApiVersion v1 = _$avatarGetAvatarDarkApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<AvatarGetAvatarDarkApiVersion> get values => _$avatarGetAvatarDarkApiVersionValues;
  // coverage:ignore-end

  static AvatarGetAvatarDarkApiVersion valueOf(String name) => _$valueOfAvatarGetAvatarDarkApiVersion(name);

  static Serializer<AvatarGetAvatarDarkApiVersion> get serializer => _$avatarGetAvatarDarkApiVersionSerializer;
}

class BotSendMessageApiVersion extends EnumClass {
  const BotSendMessageApiVersion._(super.name);

  static const BotSendMessageApiVersion v1 = _$botSendMessageApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BotSendMessageApiVersion> get values => _$botSendMessageApiVersionValues;
  // coverage:ignore-end

  static BotSendMessageApiVersion valueOf(String name) => _$valueOfBotSendMessageApiVersion(name);

  static Serializer<BotSendMessageApiVersion> get serializer => _$botSendMessageApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotSendMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class BotSendMessageResponseApplicationJson_Ocs
    implements
        $BotSendMessageResponseApplicationJson_OcsInterface,
        Built<BotSendMessageResponseApplicationJson_Ocs, BotSendMessageResponseApplicationJson_OcsBuilder> {
  factory BotSendMessageResponseApplicationJson_Ocs([
    void Function(BotSendMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BotSendMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BotSendMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotSendMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotSendMessageResponseApplicationJson_Ocs> get serializer =>
      _$botSendMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotSendMessageResponseApplicationJsonInterface {
  BotSendMessageResponseApplicationJson_Ocs get ocs;
}

abstract class BotSendMessageResponseApplicationJson
    implements
        $BotSendMessageResponseApplicationJsonInterface,
        Built<BotSendMessageResponseApplicationJson, BotSendMessageResponseApplicationJsonBuilder> {
  factory BotSendMessageResponseApplicationJson([void Function(BotSendMessageResponseApplicationJsonBuilder)? b]) =
      _$BotSendMessageResponseApplicationJson;

  // coverage:ignore-start
  const BotSendMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotSendMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotSendMessageResponseApplicationJson> get serializer =>
      _$botSendMessageResponseApplicationJsonSerializer;
}

class BotReactApiVersion extends EnumClass {
  const BotReactApiVersion._(super.name);

  static const BotReactApiVersion v1 = _$botReactApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BotReactApiVersion> get values => _$botReactApiVersionValues;
  // coverage:ignore-end

  static BotReactApiVersion valueOf(String name) => _$valueOfBotReactApiVersion(name);

  static Serializer<BotReactApiVersion> get serializer => _$botReactApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotReactResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class BotReactResponseApplicationJson_Ocs
    implements
        $BotReactResponseApplicationJson_OcsInterface,
        Built<BotReactResponseApplicationJson_Ocs, BotReactResponseApplicationJson_OcsBuilder> {
  factory BotReactResponseApplicationJson_Ocs([void Function(BotReactResponseApplicationJson_OcsBuilder)? b]) =
      _$BotReactResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BotReactResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotReactResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotReactResponseApplicationJson_Ocs> get serializer =>
      _$botReactResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotReactResponseApplicationJsonInterface {
  BotReactResponseApplicationJson_Ocs get ocs;
}

abstract class BotReactResponseApplicationJson
    implements
        $BotReactResponseApplicationJsonInterface,
        Built<BotReactResponseApplicationJson, BotReactResponseApplicationJsonBuilder> {
  factory BotReactResponseApplicationJson([void Function(BotReactResponseApplicationJsonBuilder)? b]) =
      _$BotReactResponseApplicationJson;

  // coverage:ignore-start
  const BotReactResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotReactResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotReactResponseApplicationJson> get serializer => _$botReactResponseApplicationJsonSerializer;
}

class BotDeleteReactionApiVersion extends EnumClass {
  const BotDeleteReactionApiVersion._(super.name);

  static const BotDeleteReactionApiVersion v1 = _$botDeleteReactionApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BotDeleteReactionApiVersion> get values => _$botDeleteReactionApiVersionValues;
  // coverage:ignore-end

  static BotDeleteReactionApiVersion valueOf(String name) => _$valueOfBotDeleteReactionApiVersion(name);

  static Serializer<BotDeleteReactionApiVersion> get serializer => _$botDeleteReactionApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotDeleteReactionResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class BotDeleteReactionResponseApplicationJson_Ocs
    implements
        $BotDeleteReactionResponseApplicationJson_OcsInterface,
        Built<BotDeleteReactionResponseApplicationJson_Ocs, BotDeleteReactionResponseApplicationJson_OcsBuilder> {
  factory BotDeleteReactionResponseApplicationJson_Ocs([
    void Function(BotDeleteReactionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BotDeleteReactionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BotDeleteReactionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotDeleteReactionResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotDeleteReactionResponseApplicationJson_Ocs> get serializer =>
      _$botDeleteReactionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotDeleteReactionResponseApplicationJsonInterface {
  BotDeleteReactionResponseApplicationJson_Ocs get ocs;
}

abstract class BotDeleteReactionResponseApplicationJson
    implements
        $BotDeleteReactionResponseApplicationJsonInterface,
        Built<BotDeleteReactionResponseApplicationJson, BotDeleteReactionResponseApplicationJsonBuilder> {
  factory BotDeleteReactionResponseApplicationJson([
    void Function(BotDeleteReactionResponseApplicationJsonBuilder)? b,
  ]) = _$BotDeleteReactionResponseApplicationJson;

  // coverage:ignore-start
  const BotDeleteReactionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotDeleteReactionResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotDeleteReactionResponseApplicationJson> get serializer =>
      _$botDeleteReactionResponseApplicationJsonSerializer;
}

class BotAdminListBotsApiVersion extends EnumClass {
  const BotAdminListBotsApiVersion._(super.name);

  static const BotAdminListBotsApiVersion v1 = _$botAdminListBotsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BotAdminListBotsApiVersion> get values => _$botAdminListBotsApiVersionValues;
  // coverage:ignore-end

  static BotAdminListBotsApiVersion valueOf(String name) => _$valueOfBotAdminListBotsApiVersion(name);

  static Serializer<BotAdminListBotsApiVersion> get serializer => _$botAdminListBotsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotInterface {
  String? get description;
  int get id;
  String get name;
  int get state;
}

abstract class Bot implements $BotInterface, Built<Bot, BotBuilder> {
  factory Bot([void Function(BotBuilder)? b]) = _$Bot;

  // coverage:ignore-start
  const Bot._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Bot.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Bot> get serializer => _$botSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotWithDetails_1Interface {
  @BuiltValueField(wireName: 'error_count')
  int get errorCount;
  int get features;
  @BuiltValueField(wireName: 'last_error_date')
  int get lastErrorDate;
  @BuiltValueField(wireName: 'last_error_message')
  String get lastErrorMessage;
  String get url;
  @BuiltValueField(wireName: 'url_hash')
  String get urlHash;
}

@BuiltValue(instantiable: false)
abstract interface class $BotWithDetailsInterface implements $BotInterface, $BotWithDetails_1Interface {}

abstract class BotWithDetails implements $BotWithDetailsInterface, Built<BotWithDetails, BotWithDetailsBuilder> {
  factory BotWithDetails([void Function(BotWithDetailsBuilder)? b]) = _$BotWithDetails;

  // coverage:ignore-start
  const BotWithDetails._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotWithDetails.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotWithDetails> get serializer => _$botWithDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotAdminListBotsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<BotWithDetails> get data;
}

abstract class BotAdminListBotsResponseApplicationJson_Ocs
    implements
        $BotAdminListBotsResponseApplicationJson_OcsInterface,
        Built<BotAdminListBotsResponseApplicationJson_Ocs, BotAdminListBotsResponseApplicationJson_OcsBuilder> {
  factory BotAdminListBotsResponseApplicationJson_Ocs([
    void Function(BotAdminListBotsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BotAdminListBotsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BotAdminListBotsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotAdminListBotsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotAdminListBotsResponseApplicationJson_Ocs> get serializer =>
      _$botAdminListBotsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotAdminListBotsResponseApplicationJsonInterface {
  BotAdminListBotsResponseApplicationJson_Ocs get ocs;
}

abstract class BotAdminListBotsResponseApplicationJson
    implements
        $BotAdminListBotsResponseApplicationJsonInterface,
        Built<BotAdminListBotsResponseApplicationJson, BotAdminListBotsResponseApplicationJsonBuilder> {
  factory BotAdminListBotsResponseApplicationJson([void Function(BotAdminListBotsResponseApplicationJsonBuilder)? b]) =
      _$BotAdminListBotsResponseApplicationJson;

  // coverage:ignore-start
  const BotAdminListBotsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotAdminListBotsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotAdminListBotsResponseApplicationJson> get serializer =>
      _$botAdminListBotsResponseApplicationJsonSerializer;
}

class BotListBotsApiVersion extends EnumClass {
  const BotListBotsApiVersion._(super.name);

  static const BotListBotsApiVersion v1 = _$botListBotsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BotListBotsApiVersion> get values => _$botListBotsApiVersionValues;
  // coverage:ignore-end

  static BotListBotsApiVersion valueOf(String name) => _$valueOfBotListBotsApiVersion(name);

  static Serializer<BotListBotsApiVersion> get serializer => _$botListBotsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotListBotsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Bot> get data;
}

abstract class BotListBotsResponseApplicationJson_Ocs
    implements
        $BotListBotsResponseApplicationJson_OcsInterface,
        Built<BotListBotsResponseApplicationJson_Ocs, BotListBotsResponseApplicationJson_OcsBuilder> {
  factory BotListBotsResponseApplicationJson_Ocs([void Function(BotListBotsResponseApplicationJson_OcsBuilder)? b]) =
      _$BotListBotsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BotListBotsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotListBotsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotListBotsResponseApplicationJson_Ocs> get serializer =>
      _$botListBotsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotListBotsResponseApplicationJsonInterface {
  BotListBotsResponseApplicationJson_Ocs get ocs;
}

abstract class BotListBotsResponseApplicationJson
    implements
        $BotListBotsResponseApplicationJsonInterface,
        Built<BotListBotsResponseApplicationJson, BotListBotsResponseApplicationJsonBuilder> {
  factory BotListBotsResponseApplicationJson([void Function(BotListBotsResponseApplicationJsonBuilder)? b]) =
      _$BotListBotsResponseApplicationJson;

  // coverage:ignore-start
  const BotListBotsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotListBotsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotListBotsResponseApplicationJson> get serializer =>
      _$botListBotsResponseApplicationJsonSerializer;
}

class BotEnableBotApiVersion extends EnumClass {
  const BotEnableBotApiVersion._(super.name);

  static const BotEnableBotApiVersion v1 = _$botEnableBotApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BotEnableBotApiVersion> get values => _$botEnableBotApiVersionValues;
  // coverage:ignore-end

  static BotEnableBotApiVersion valueOf(String name) => _$valueOfBotEnableBotApiVersion(name);

  static Serializer<BotEnableBotApiVersion> get serializer => _$botEnableBotApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotEnableBotResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Bot? get data;
}

abstract class BotEnableBotResponseApplicationJson_Ocs
    implements
        $BotEnableBotResponseApplicationJson_OcsInterface,
        Built<BotEnableBotResponseApplicationJson_Ocs, BotEnableBotResponseApplicationJson_OcsBuilder> {
  factory BotEnableBotResponseApplicationJson_Ocs([void Function(BotEnableBotResponseApplicationJson_OcsBuilder)? b]) =
      _$BotEnableBotResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BotEnableBotResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotEnableBotResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotEnableBotResponseApplicationJson_Ocs> get serializer =>
      _$botEnableBotResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotEnableBotResponseApplicationJsonInterface {
  BotEnableBotResponseApplicationJson_Ocs get ocs;
}

abstract class BotEnableBotResponseApplicationJson
    implements
        $BotEnableBotResponseApplicationJsonInterface,
        Built<BotEnableBotResponseApplicationJson, BotEnableBotResponseApplicationJsonBuilder> {
  factory BotEnableBotResponseApplicationJson([void Function(BotEnableBotResponseApplicationJsonBuilder)? b]) =
      _$BotEnableBotResponseApplicationJson;

  // coverage:ignore-start
  const BotEnableBotResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotEnableBotResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotEnableBotResponseApplicationJson> get serializer =>
      _$botEnableBotResponseApplicationJsonSerializer;
}

class BotDisableBotApiVersion extends EnumClass {
  const BotDisableBotApiVersion._(super.name);

  static const BotDisableBotApiVersion v1 = _$botDisableBotApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BotDisableBotApiVersion> get values => _$botDisableBotApiVersionValues;
  // coverage:ignore-end

  static BotDisableBotApiVersion valueOf(String name) => _$valueOfBotDisableBotApiVersion(name);

  static Serializer<BotDisableBotApiVersion> get serializer => _$botDisableBotApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotDisableBotResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Bot? get data;
}

abstract class BotDisableBotResponseApplicationJson_Ocs
    implements
        $BotDisableBotResponseApplicationJson_OcsInterface,
        Built<BotDisableBotResponseApplicationJson_Ocs, BotDisableBotResponseApplicationJson_OcsBuilder> {
  factory BotDisableBotResponseApplicationJson_Ocs([
    void Function(BotDisableBotResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BotDisableBotResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BotDisableBotResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotDisableBotResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotDisableBotResponseApplicationJson_Ocs> get serializer =>
      _$botDisableBotResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotDisableBotResponseApplicationJsonInterface {
  BotDisableBotResponseApplicationJson_Ocs get ocs;
}

abstract class BotDisableBotResponseApplicationJson
    implements
        $BotDisableBotResponseApplicationJsonInterface,
        Built<BotDisableBotResponseApplicationJson, BotDisableBotResponseApplicationJsonBuilder> {
  factory BotDisableBotResponseApplicationJson([void Function(BotDisableBotResponseApplicationJsonBuilder)? b]) =
      _$BotDisableBotResponseApplicationJson;

  // coverage:ignore-start
  const BotDisableBotResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotDisableBotResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotDisableBotResponseApplicationJson> get serializer =>
      _$botDisableBotResponseApplicationJsonSerializer;
}

class BreakoutRoomConfigureBreakoutRoomsApiVersion extends EnumClass {
  const BreakoutRoomConfigureBreakoutRoomsApiVersion._(super.name);

  static const BreakoutRoomConfigureBreakoutRoomsApiVersion v1 = _$breakoutRoomConfigureBreakoutRoomsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomConfigureBreakoutRoomsApiVersion> get values =>
      _$breakoutRoomConfigureBreakoutRoomsApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomConfigureBreakoutRoomsApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomConfigureBreakoutRoomsApiVersion(name);

  static Serializer<BreakoutRoomConfigureBreakoutRoomsApiVersion> get serializer =>
      _$breakoutRoomConfigureBreakoutRoomsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Room> get data;
}

abstract class BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs
    implements
        $BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs,
            BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs([
    void Function(BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomConfigureBreakoutRoomsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomConfigureBreakoutRoomsResponseApplicationJsonInterface {
  BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson
    implements
        $BreakoutRoomConfigureBreakoutRoomsResponseApplicationJsonInterface,
        Built<BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson,
            BreakoutRoomConfigureBreakoutRoomsResponseApplicationJsonBuilder> {
  factory BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson([
    void Function(BreakoutRoomConfigureBreakoutRoomsResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson> get serializer =>
      _$breakoutRoomConfigureBreakoutRoomsResponseApplicationJsonSerializer;
}

class BreakoutRoomRemoveBreakoutRoomsApiVersion extends EnumClass {
  const BreakoutRoomRemoveBreakoutRoomsApiVersion._(super.name);

  static const BreakoutRoomRemoveBreakoutRoomsApiVersion v1 = _$breakoutRoomRemoveBreakoutRoomsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomRemoveBreakoutRoomsApiVersion> get values =>
      _$breakoutRoomRemoveBreakoutRoomsApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomRemoveBreakoutRoomsApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomRemoveBreakoutRoomsApiVersion(name);

  static Serializer<BreakoutRoomRemoveBreakoutRoomsApiVersion> get serializer =>
      _$breakoutRoomRemoveBreakoutRoomsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs
    implements
        $BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs,
            BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs([
    void Function(BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomRemoveBreakoutRoomsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomRemoveBreakoutRoomsResponseApplicationJsonInterface {
  BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson
    implements
        $BreakoutRoomRemoveBreakoutRoomsResponseApplicationJsonInterface,
        Built<BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson,
            BreakoutRoomRemoveBreakoutRoomsResponseApplicationJsonBuilder> {
  factory BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson([
    void Function(BreakoutRoomRemoveBreakoutRoomsResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson> get serializer =>
      _$breakoutRoomRemoveBreakoutRoomsResponseApplicationJsonSerializer;
}

class BreakoutRoomBroadcastChatMessageApiVersion extends EnumClass {
  const BreakoutRoomBroadcastChatMessageApiVersion._(super.name);

  static const BreakoutRoomBroadcastChatMessageApiVersion v1 = _$breakoutRoomBroadcastChatMessageApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomBroadcastChatMessageApiVersion> get values =>
      _$breakoutRoomBroadcastChatMessageApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomBroadcastChatMessageApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomBroadcastChatMessageApiVersion(name);

  static Serializer<BreakoutRoomBroadcastChatMessageApiVersion> get serializer =>
      _$breakoutRoomBroadcastChatMessageApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomBroadcastChatMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Room> get data;
}

abstract class BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs
    implements
        $BreakoutRoomBroadcastChatMessageResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs,
            BreakoutRoomBroadcastChatMessageResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs([
    void Function(BreakoutRoomBroadcastChatMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomBroadcastChatMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomBroadcastChatMessageResponseApplicationJsonInterface {
  BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomBroadcastChatMessageResponseApplicationJson
    implements
        $BreakoutRoomBroadcastChatMessageResponseApplicationJsonInterface,
        Built<BreakoutRoomBroadcastChatMessageResponseApplicationJson,
            BreakoutRoomBroadcastChatMessageResponseApplicationJsonBuilder> {
  factory BreakoutRoomBroadcastChatMessageResponseApplicationJson([
    void Function(BreakoutRoomBroadcastChatMessageResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomBroadcastChatMessageResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomBroadcastChatMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomBroadcastChatMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomBroadcastChatMessageResponseApplicationJson> get serializer =>
      _$breakoutRoomBroadcastChatMessageResponseApplicationJsonSerializer;
}

class BreakoutRoomApplyAttendeeMapApiVersion extends EnumClass {
  const BreakoutRoomApplyAttendeeMapApiVersion._(super.name);

  static const BreakoutRoomApplyAttendeeMapApiVersion v1 = _$breakoutRoomApplyAttendeeMapApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomApplyAttendeeMapApiVersion> get values => _$breakoutRoomApplyAttendeeMapApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomApplyAttendeeMapApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomApplyAttendeeMapApiVersion(name);

  static Serializer<BreakoutRoomApplyAttendeeMapApiVersion> get serializer =>
      _$breakoutRoomApplyAttendeeMapApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomApplyAttendeeMapResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Room> get data;
}

abstract class BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs
    implements
        $BreakoutRoomApplyAttendeeMapResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs,
            BreakoutRoomApplyAttendeeMapResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs([
    void Function(BreakoutRoomApplyAttendeeMapResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomApplyAttendeeMapResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomApplyAttendeeMapResponseApplicationJsonInterface {
  BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomApplyAttendeeMapResponseApplicationJson
    implements
        $BreakoutRoomApplyAttendeeMapResponseApplicationJsonInterface,
        Built<BreakoutRoomApplyAttendeeMapResponseApplicationJson,
            BreakoutRoomApplyAttendeeMapResponseApplicationJsonBuilder> {
  factory BreakoutRoomApplyAttendeeMapResponseApplicationJson([
    void Function(BreakoutRoomApplyAttendeeMapResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomApplyAttendeeMapResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomApplyAttendeeMapResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomApplyAttendeeMapResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomApplyAttendeeMapResponseApplicationJson> get serializer =>
      _$breakoutRoomApplyAttendeeMapResponseApplicationJsonSerializer;
}

class BreakoutRoomRequestAssistanceApiVersion extends EnumClass {
  const BreakoutRoomRequestAssistanceApiVersion._(super.name);

  static const BreakoutRoomRequestAssistanceApiVersion v1 = _$breakoutRoomRequestAssistanceApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomRequestAssistanceApiVersion> get values =>
      _$breakoutRoomRequestAssistanceApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomRequestAssistanceApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomRequestAssistanceApiVersion(name);

  static Serializer<BreakoutRoomRequestAssistanceApiVersion> get serializer =>
      _$breakoutRoomRequestAssistanceApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomRequestAssistanceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs
    implements
        $BreakoutRoomRequestAssistanceResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs,
            BreakoutRoomRequestAssistanceResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs([
    void Function(BreakoutRoomRequestAssistanceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomRequestAssistanceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomRequestAssistanceResponseApplicationJsonInterface {
  BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomRequestAssistanceResponseApplicationJson
    implements
        $BreakoutRoomRequestAssistanceResponseApplicationJsonInterface,
        Built<BreakoutRoomRequestAssistanceResponseApplicationJson,
            BreakoutRoomRequestAssistanceResponseApplicationJsonBuilder> {
  factory BreakoutRoomRequestAssistanceResponseApplicationJson([
    void Function(BreakoutRoomRequestAssistanceResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomRequestAssistanceResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomRequestAssistanceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomRequestAssistanceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomRequestAssistanceResponseApplicationJson> get serializer =>
      _$breakoutRoomRequestAssistanceResponseApplicationJsonSerializer;
}

class BreakoutRoomResetRequestForAssistanceApiVersion extends EnumClass {
  const BreakoutRoomResetRequestForAssistanceApiVersion._(super.name);

  static const BreakoutRoomResetRequestForAssistanceApiVersion v1 = _$breakoutRoomResetRequestForAssistanceApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomResetRequestForAssistanceApiVersion> get values =>
      _$breakoutRoomResetRequestForAssistanceApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomResetRequestForAssistanceApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomResetRequestForAssistanceApiVersion(name);

  static Serializer<BreakoutRoomResetRequestForAssistanceApiVersion> get serializer =>
      _$breakoutRoomResetRequestForAssistanceApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomResetRequestForAssistanceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs
    implements
        $BreakoutRoomResetRequestForAssistanceResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs,
            BreakoutRoomResetRequestForAssistanceResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs([
    void Function(BreakoutRoomResetRequestForAssistanceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomResetRequestForAssistanceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomResetRequestForAssistanceResponseApplicationJsonInterface {
  BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomResetRequestForAssistanceResponseApplicationJson
    implements
        $BreakoutRoomResetRequestForAssistanceResponseApplicationJsonInterface,
        Built<BreakoutRoomResetRequestForAssistanceResponseApplicationJson,
            BreakoutRoomResetRequestForAssistanceResponseApplicationJsonBuilder> {
  factory BreakoutRoomResetRequestForAssistanceResponseApplicationJson([
    void Function(BreakoutRoomResetRequestForAssistanceResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomResetRequestForAssistanceResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomResetRequestForAssistanceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomResetRequestForAssistanceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomResetRequestForAssistanceResponseApplicationJson> get serializer =>
      _$breakoutRoomResetRequestForAssistanceResponseApplicationJsonSerializer;
}

class BreakoutRoomStartBreakoutRoomsApiVersion extends EnumClass {
  const BreakoutRoomStartBreakoutRoomsApiVersion._(super.name);

  static const BreakoutRoomStartBreakoutRoomsApiVersion v1 = _$breakoutRoomStartBreakoutRoomsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomStartBreakoutRoomsApiVersion> get values =>
      _$breakoutRoomStartBreakoutRoomsApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomStartBreakoutRoomsApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomStartBreakoutRoomsApiVersion(name);

  static Serializer<BreakoutRoomStartBreakoutRoomsApiVersion> get serializer =>
      _$breakoutRoomStartBreakoutRoomsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomStartBreakoutRoomsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Room> get data;
}

abstract class BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs
    implements
        $BreakoutRoomStartBreakoutRoomsResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs,
            BreakoutRoomStartBreakoutRoomsResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs([
    void Function(BreakoutRoomStartBreakoutRoomsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomStartBreakoutRoomsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomStartBreakoutRoomsResponseApplicationJsonInterface {
  BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomStartBreakoutRoomsResponseApplicationJson
    implements
        $BreakoutRoomStartBreakoutRoomsResponseApplicationJsonInterface,
        Built<BreakoutRoomStartBreakoutRoomsResponseApplicationJson,
            BreakoutRoomStartBreakoutRoomsResponseApplicationJsonBuilder> {
  factory BreakoutRoomStartBreakoutRoomsResponseApplicationJson([
    void Function(BreakoutRoomStartBreakoutRoomsResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomStartBreakoutRoomsResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomStartBreakoutRoomsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomStartBreakoutRoomsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomStartBreakoutRoomsResponseApplicationJson> get serializer =>
      _$breakoutRoomStartBreakoutRoomsResponseApplicationJsonSerializer;
}

class BreakoutRoomStopBreakoutRoomsApiVersion extends EnumClass {
  const BreakoutRoomStopBreakoutRoomsApiVersion._(super.name);

  static const BreakoutRoomStopBreakoutRoomsApiVersion v1 = _$breakoutRoomStopBreakoutRoomsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomStopBreakoutRoomsApiVersion> get values =>
      _$breakoutRoomStopBreakoutRoomsApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomStopBreakoutRoomsApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomStopBreakoutRoomsApiVersion(name);

  static Serializer<BreakoutRoomStopBreakoutRoomsApiVersion> get serializer =>
      _$breakoutRoomStopBreakoutRoomsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomStopBreakoutRoomsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Room> get data;
}

abstract class BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs
    implements
        $BreakoutRoomStopBreakoutRoomsResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs,
            BreakoutRoomStopBreakoutRoomsResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs([
    void Function(BreakoutRoomStopBreakoutRoomsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomStopBreakoutRoomsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomStopBreakoutRoomsResponseApplicationJsonInterface {
  BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomStopBreakoutRoomsResponseApplicationJson
    implements
        $BreakoutRoomStopBreakoutRoomsResponseApplicationJsonInterface,
        Built<BreakoutRoomStopBreakoutRoomsResponseApplicationJson,
            BreakoutRoomStopBreakoutRoomsResponseApplicationJsonBuilder> {
  factory BreakoutRoomStopBreakoutRoomsResponseApplicationJson([
    void Function(BreakoutRoomStopBreakoutRoomsResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomStopBreakoutRoomsResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomStopBreakoutRoomsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomStopBreakoutRoomsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomStopBreakoutRoomsResponseApplicationJson> get serializer =>
      _$breakoutRoomStopBreakoutRoomsResponseApplicationJsonSerializer;
}

class BreakoutRoomSwitchBreakoutRoomApiVersion extends EnumClass {
  const BreakoutRoomSwitchBreakoutRoomApiVersion._(super.name);

  static const BreakoutRoomSwitchBreakoutRoomApiVersion v1 = _$breakoutRoomSwitchBreakoutRoomApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<BreakoutRoomSwitchBreakoutRoomApiVersion> get values =>
      _$breakoutRoomSwitchBreakoutRoomApiVersionValues;
  // coverage:ignore-end

  static BreakoutRoomSwitchBreakoutRoomApiVersion valueOf(String name) =>
      _$valueOfBreakoutRoomSwitchBreakoutRoomApiVersion(name);

  static Serializer<BreakoutRoomSwitchBreakoutRoomApiVersion> get serializer =>
      _$breakoutRoomSwitchBreakoutRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs
    implements
        $BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_OcsInterface,
        Built<BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs,
            BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_OcsBuilder> {
  factory BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs([
    void Function(BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs> get serializer =>
      _$breakoutRoomSwitchBreakoutRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BreakoutRoomSwitchBreakoutRoomResponseApplicationJsonInterface {
  BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs get ocs;
}

abstract class BreakoutRoomSwitchBreakoutRoomResponseApplicationJson
    implements
        $BreakoutRoomSwitchBreakoutRoomResponseApplicationJsonInterface,
        Built<BreakoutRoomSwitchBreakoutRoomResponseApplicationJson,
            BreakoutRoomSwitchBreakoutRoomResponseApplicationJsonBuilder> {
  factory BreakoutRoomSwitchBreakoutRoomResponseApplicationJson([
    void Function(BreakoutRoomSwitchBreakoutRoomResponseApplicationJsonBuilder)? b,
  ]) = _$BreakoutRoomSwitchBreakoutRoomResponseApplicationJson;

  // coverage:ignore-start
  const BreakoutRoomSwitchBreakoutRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BreakoutRoomSwitchBreakoutRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BreakoutRoomSwitchBreakoutRoomResponseApplicationJson> get serializer =>
      _$breakoutRoomSwitchBreakoutRoomResponseApplicationJsonSerializer;
}

class CallGetPeersForCallApiVersion extends EnumClass {
  const CallGetPeersForCallApiVersion._(super.name);

  static const CallGetPeersForCallApiVersion v4 = _$callGetPeersForCallApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<CallGetPeersForCallApiVersion> get values => _$callGetPeersForCallApiVersionValues;
  // coverage:ignore-end

  static CallGetPeersForCallApiVersion valueOf(String name) => _$valueOfCallGetPeersForCallApiVersion(name);

  static Serializer<CallGetPeersForCallApiVersion> get serializer => _$callGetPeersForCallApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallPeerInterface {
  String get actorId;
  String get actorType;
  String get displayName;
  int get lastPing;
  String get sessionId;
  String get token;
}

abstract class CallPeer implements $CallPeerInterface, Built<CallPeer, CallPeerBuilder> {
  factory CallPeer([void Function(CallPeerBuilder)? b]) = _$CallPeer;

  // coverage:ignore-start
  const CallPeer._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallPeer.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallPeer> get serializer => _$callPeerSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallGetPeersForCallResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<CallPeer> get data;
}

abstract class CallGetPeersForCallResponseApplicationJson_Ocs
    implements
        $CallGetPeersForCallResponseApplicationJson_OcsInterface,
        Built<CallGetPeersForCallResponseApplicationJson_Ocs, CallGetPeersForCallResponseApplicationJson_OcsBuilder> {
  factory CallGetPeersForCallResponseApplicationJson_Ocs([
    void Function(CallGetPeersForCallResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CallGetPeersForCallResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CallGetPeersForCallResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallGetPeersForCallResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallGetPeersForCallResponseApplicationJson_Ocs> get serializer =>
      _$callGetPeersForCallResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallGetPeersForCallResponseApplicationJsonInterface {
  CallGetPeersForCallResponseApplicationJson_Ocs get ocs;
}

abstract class CallGetPeersForCallResponseApplicationJson
    implements
        $CallGetPeersForCallResponseApplicationJsonInterface,
        Built<CallGetPeersForCallResponseApplicationJson, CallGetPeersForCallResponseApplicationJsonBuilder> {
  factory CallGetPeersForCallResponseApplicationJson([
    void Function(CallGetPeersForCallResponseApplicationJsonBuilder)? b,
  ]) = _$CallGetPeersForCallResponseApplicationJson;

  // coverage:ignore-start
  const CallGetPeersForCallResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallGetPeersForCallResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallGetPeersForCallResponseApplicationJson> get serializer =>
      _$callGetPeersForCallResponseApplicationJsonSerializer;
}

class CallUpdateCallFlagsApiVersion extends EnumClass {
  const CallUpdateCallFlagsApiVersion._(super.name);

  static const CallUpdateCallFlagsApiVersion v4 = _$callUpdateCallFlagsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<CallUpdateCallFlagsApiVersion> get values => _$callUpdateCallFlagsApiVersionValues;
  // coverage:ignore-end

  static CallUpdateCallFlagsApiVersion valueOf(String name) => _$valueOfCallUpdateCallFlagsApiVersion(name);

  static Serializer<CallUpdateCallFlagsApiVersion> get serializer => _$callUpdateCallFlagsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallUpdateCallFlagsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class CallUpdateCallFlagsResponseApplicationJson_Ocs
    implements
        $CallUpdateCallFlagsResponseApplicationJson_OcsInterface,
        Built<CallUpdateCallFlagsResponseApplicationJson_Ocs, CallUpdateCallFlagsResponseApplicationJson_OcsBuilder> {
  factory CallUpdateCallFlagsResponseApplicationJson_Ocs([
    void Function(CallUpdateCallFlagsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CallUpdateCallFlagsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CallUpdateCallFlagsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallUpdateCallFlagsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallUpdateCallFlagsResponseApplicationJson_Ocs> get serializer =>
      _$callUpdateCallFlagsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallUpdateCallFlagsResponseApplicationJsonInterface {
  CallUpdateCallFlagsResponseApplicationJson_Ocs get ocs;
}

abstract class CallUpdateCallFlagsResponseApplicationJson
    implements
        $CallUpdateCallFlagsResponseApplicationJsonInterface,
        Built<CallUpdateCallFlagsResponseApplicationJson, CallUpdateCallFlagsResponseApplicationJsonBuilder> {
  factory CallUpdateCallFlagsResponseApplicationJson([
    void Function(CallUpdateCallFlagsResponseApplicationJsonBuilder)? b,
  ]) = _$CallUpdateCallFlagsResponseApplicationJson;

  // coverage:ignore-start
  const CallUpdateCallFlagsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallUpdateCallFlagsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallUpdateCallFlagsResponseApplicationJson> get serializer =>
      _$callUpdateCallFlagsResponseApplicationJsonSerializer;
}

class CallJoinCallApiVersion extends EnumClass {
  const CallJoinCallApiVersion._(super.name);

  static const CallJoinCallApiVersion v4 = _$callJoinCallApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<CallJoinCallApiVersion> get values => _$callJoinCallApiVersionValues;
  // coverage:ignore-end

  static CallJoinCallApiVersion valueOf(String name) => _$valueOfCallJoinCallApiVersion(name);

  static Serializer<CallJoinCallApiVersion> get serializer => _$callJoinCallApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallJoinCallResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class CallJoinCallResponseApplicationJson_Ocs
    implements
        $CallJoinCallResponseApplicationJson_OcsInterface,
        Built<CallJoinCallResponseApplicationJson_Ocs, CallJoinCallResponseApplicationJson_OcsBuilder> {
  factory CallJoinCallResponseApplicationJson_Ocs([void Function(CallJoinCallResponseApplicationJson_OcsBuilder)? b]) =
      _$CallJoinCallResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CallJoinCallResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallJoinCallResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallJoinCallResponseApplicationJson_Ocs> get serializer =>
      _$callJoinCallResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallJoinCallResponseApplicationJsonInterface {
  CallJoinCallResponseApplicationJson_Ocs get ocs;
}

abstract class CallJoinCallResponseApplicationJson
    implements
        $CallJoinCallResponseApplicationJsonInterface,
        Built<CallJoinCallResponseApplicationJson, CallJoinCallResponseApplicationJsonBuilder> {
  factory CallJoinCallResponseApplicationJson([void Function(CallJoinCallResponseApplicationJsonBuilder)? b]) =
      _$CallJoinCallResponseApplicationJson;

  // coverage:ignore-start
  const CallJoinCallResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallJoinCallResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallJoinCallResponseApplicationJson> get serializer =>
      _$callJoinCallResponseApplicationJsonSerializer;
}

class CallLeaveCallApiVersion extends EnumClass {
  const CallLeaveCallApiVersion._(super.name);

  static const CallLeaveCallApiVersion v4 = _$callLeaveCallApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<CallLeaveCallApiVersion> get values => _$callLeaveCallApiVersionValues;
  // coverage:ignore-end

  static CallLeaveCallApiVersion valueOf(String name) => _$valueOfCallLeaveCallApiVersion(name);

  static Serializer<CallLeaveCallApiVersion> get serializer => _$callLeaveCallApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallLeaveCallResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class CallLeaveCallResponseApplicationJson_Ocs
    implements
        $CallLeaveCallResponseApplicationJson_OcsInterface,
        Built<CallLeaveCallResponseApplicationJson_Ocs, CallLeaveCallResponseApplicationJson_OcsBuilder> {
  factory CallLeaveCallResponseApplicationJson_Ocs([
    void Function(CallLeaveCallResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CallLeaveCallResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CallLeaveCallResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallLeaveCallResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallLeaveCallResponseApplicationJson_Ocs> get serializer =>
      _$callLeaveCallResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallLeaveCallResponseApplicationJsonInterface {
  CallLeaveCallResponseApplicationJson_Ocs get ocs;
}

abstract class CallLeaveCallResponseApplicationJson
    implements
        $CallLeaveCallResponseApplicationJsonInterface,
        Built<CallLeaveCallResponseApplicationJson, CallLeaveCallResponseApplicationJsonBuilder> {
  factory CallLeaveCallResponseApplicationJson([void Function(CallLeaveCallResponseApplicationJsonBuilder)? b]) =
      _$CallLeaveCallResponseApplicationJson;

  // coverage:ignore-start
  const CallLeaveCallResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallLeaveCallResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallLeaveCallResponseApplicationJson> get serializer =>
      _$callLeaveCallResponseApplicationJsonSerializer;
}

class CallRingAttendeeApiVersion extends EnumClass {
  const CallRingAttendeeApiVersion._(super.name);

  static const CallRingAttendeeApiVersion v4 = _$callRingAttendeeApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<CallRingAttendeeApiVersion> get values => _$callRingAttendeeApiVersionValues;
  // coverage:ignore-end

  static CallRingAttendeeApiVersion valueOf(String name) => _$valueOfCallRingAttendeeApiVersion(name);

  static Serializer<CallRingAttendeeApiVersion> get serializer => _$callRingAttendeeApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallRingAttendeeResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class CallRingAttendeeResponseApplicationJson_Ocs
    implements
        $CallRingAttendeeResponseApplicationJson_OcsInterface,
        Built<CallRingAttendeeResponseApplicationJson_Ocs, CallRingAttendeeResponseApplicationJson_OcsBuilder> {
  factory CallRingAttendeeResponseApplicationJson_Ocs([
    void Function(CallRingAttendeeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CallRingAttendeeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CallRingAttendeeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallRingAttendeeResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallRingAttendeeResponseApplicationJson_Ocs> get serializer =>
      _$callRingAttendeeResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallRingAttendeeResponseApplicationJsonInterface {
  CallRingAttendeeResponseApplicationJson_Ocs get ocs;
}

abstract class CallRingAttendeeResponseApplicationJson
    implements
        $CallRingAttendeeResponseApplicationJsonInterface,
        Built<CallRingAttendeeResponseApplicationJson, CallRingAttendeeResponseApplicationJsonBuilder> {
  factory CallRingAttendeeResponseApplicationJson([void Function(CallRingAttendeeResponseApplicationJsonBuilder)? b]) =
      _$CallRingAttendeeResponseApplicationJson;

  // coverage:ignore-start
  const CallRingAttendeeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallRingAttendeeResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallRingAttendeeResponseApplicationJson> get serializer =>
      _$callRingAttendeeResponseApplicationJsonSerializer;
}

class CallSipDialOutApiVersion extends EnumClass {
  const CallSipDialOutApiVersion._(super.name);

  static const CallSipDialOutApiVersion v4 = _$callSipDialOutApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<CallSipDialOutApiVersion> get values => _$callSipDialOutApiVersionValues;
  // coverage:ignore-end

  static CallSipDialOutApiVersion valueOf(String name) => _$valueOfCallSipDialOutApiVersion(name);

  static Serializer<CallSipDialOutApiVersion> get serializer => _$callSipDialOutApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallSipDialOutResponseApplicationJson_Ocs_DataInterface {
  String? get error;
  String? get message;
}

abstract class CallSipDialOutResponseApplicationJson_Ocs_Data
    implements
        $CallSipDialOutResponseApplicationJson_Ocs_DataInterface,
        Built<CallSipDialOutResponseApplicationJson_Ocs_Data, CallSipDialOutResponseApplicationJson_Ocs_DataBuilder> {
  factory CallSipDialOutResponseApplicationJson_Ocs_Data([
    void Function(CallSipDialOutResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CallSipDialOutResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CallSipDialOutResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallSipDialOutResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallSipDialOutResponseApplicationJson_Ocs_Data> get serializer =>
      _$callSipDialOutResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallSipDialOutResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  CallSipDialOutResponseApplicationJson_Ocs_Data get data;
}

abstract class CallSipDialOutResponseApplicationJson_Ocs
    implements
        $CallSipDialOutResponseApplicationJson_OcsInterface,
        Built<CallSipDialOutResponseApplicationJson_Ocs, CallSipDialOutResponseApplicationJson_OcsBuilder> {
  factory CallSipDialOutResponseApplicationJson_Ocs([
    void Function(CallSipDialOutResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CallSipDialOutResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CallSipDialOutResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallSipDialOutResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallSipDialOutResponseApplicationJson_Ocs> get serializer =>
      _$callSipDialOutResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CallSipDialOutResponseApplicationJsonInterface {
  CallSipDialOutResponseApplicationJson_Ocs get ocs;
}

abstract class CallSipDialOutResponseApplicationJson
    implements
        $CallSipDialOutResponseApplicationJsonInterface,
        Built<CallSipDialOutResponseApplicationJson, CallSipDialOutResponseApplicationJsonBuilder> {
  factory CallSipDialOutResponseApplicationJson([void Function(CallSipDialOutResponseApplicationJsonBuilder)? b]) =
      _$CallSipDialOutResponseApplicationJson;

  // coverage:ignore-start
  const CallSipDialOutResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CallSipDialOutResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CallSipDialOutResponseApplicationJson> get serializer =>
      _$callSipDialOutResponseApplicationJsonSerializer;
}

class CertificateGetCertificateExpirationApiVersion extends EnumClass {
  const CertificateGetCertificateExpirationApiVersion._(super.name);

  static const CertificateGetCertificateExpirationApiVersion v1 = _$certificateGetCertificateExpirationApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<CertificateGetCertificateExpirationApiVersion> get values =>
      _$certificateGetCertificateExpirationApiVersionValues;
  // coverage:ignore-end

  static CertificateGetCertificateExpirationApiVersion valueOf(String name) =>
      _$valueOfCertificateGetCertificateExpirationApiVersion(name);

  static Serializer<CertificateGetCertificateExpirationApiVersion> get serializer =>
      _$certificateGetCertificateExpirationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CertificateGetCertificateExpirationResponseApplicationJson_Ocs_DataInterface {
  @BuiltValueField(wireName: 'expiration_in_days')
  int? get expirationInDays;
}

abstract class CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data
    implements
        $CertificateGetCertificateExpirationResponseApplicationJson_Ocs_DataInterface,
        Built<CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data,
            CertificateGetCertificateExpirationResponseApplicationJson_Ocs_DataBuilder> {
  factory CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data([
    void Function(CertificateGetCertificateExpirationResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data> get serializer =>
      _$certificateGetCertificateExpirationResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CertificateGetCertificateExpirationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data get data;
}

abstract class CertificateGetCertificateExpirationResponseApplicationJson_Ocs
    implements
        $CertificateGetCertificateExpirationResponseApplicationJson_OcsInterface,
        Built<CertificateGetCertificateExpirationResponseApplicationJson_Ocs,
            CertificateGetCertificateExpirationResponseApplicationJson_OcsBuilder> {
  factory CertificateGetCertificateExpirationResponseApplicationJson_Ocs([
    void Function(CertificateGetCertificateExpirationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CertificateGetCertificateExpirationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CertificateGetCertificateExpirationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CertificateGetCertificateExpirationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CertificateGetCertificateExpirationResponseApplicationJson_Ocs> get serializer =>
      _$certificateGetCertificateExpirationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CertificateGetCertificateExpirationResponseApplicationJsonInterface {
  CertificateGetCertificateExpirationResponseApplicationJson_Ocs get ocs;
}

abstract class CertificateGetCertificateExpirationResponseApplicationJson
    implements
        $CertificateGetCertificateExpirationResponseApplicationJsonInterface,
        Built<CertificateGetCertificateExpirationResponseApplicationJson,
            CertificateGetCertificateExpirationResponseApplicationJsonBuilder> {
  factory CertificateGetCertificateExpirationResponseApplicationJson([
    void Function(CertificateGetCertificateExpirationResponseApplicationJsonBuilder)? b,
  ]) = _$CertificateGetCertificateExpirationResponseApplicationJson;

  // coverage:ignore-start
  const CertificateGetCertificateExpirationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CertificateGetCertificateExpirationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CertificateGetCertificateExpirationResponseApplicationJson> get serializer =>
      _$certificateGetCertificateExpirationResponseApplicationJsonSerializer;
}

class ChatReceiveMessagesApiVersion extends EnumClass {
  const ChatReceiveMessagesApiVersion._(super.name);

  static const ChatReceiveMessagesApiVersion v1 = _$chatReceiveMessagesApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatReceiveMessagesApiVersion> get values => _$chatReceiveMessagesApiVersionValues;
  // coverage:ignore-end

  static ChatReceiveMessagesApiVersion valueOf(String name) => _$valueOfChatReceiveMessagesApiVersion(name);

  static Serializer<ChatReceiveMessagesApiVersion> get serializer => _$chatReceiveMessagesApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatReceiveMessagesHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-common-read')
  String? get xChatLastCommonRead;
  @BuiltValueField(wireName: 'x-chat-last-given')
  String? get xChatLastGiven;
}

abstract class ChatChatReceiveMessagesHeaders
    implements
        $ChatChatReceiveMessagesHeadersInterface,
        Built<ChatChatReceiveMessagesHeaders, ChatChatReceiveMessagesHeadersBuilder> {
  factory ChatChatReceiveMessagesHeaders([void Function(ChatChatReceiveMessagesHeadersBuilder)? b]) =
      _$ChatChatReceiveMessagesHeaders;

  // coverage:ignore-start
  const ChatChatReceiveMessagesHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatReceiveMessagesHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatReceiveMessagesHeaders> get serializer => _$chatChatReceiveMessagesHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatMessageWithParent_1Interface {
  ChatMessage? get parent;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatMessageWithParentInterface
    implements $ChatMessageInterface, $ChatMessageWithParent_1Interface {}

abstract class ChatMessageWithParent
    implements $ChatMessageWithParentInterface, Built<ChatMessageWithParent, ChatMessageWithParentBuilder> {
  factory ChatMessageWithParent([void Function(ChatMessageWithParentBuilder)? b]) = _$ChatMessageWithParent;

  // coverage:ignore-start
  const ChatMessageWithParent._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatMessageWithParent.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatMessageWithParent> get serializer => _$chatMessageWithParentSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatReceiveMessagesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<ChatMessageWithParent> get data;
}

abstract class ChatReceiveMessagesResponseApplicationJson_Ocs
    implements
        $ChatReceiveMessagesResponseApplicationJson_OcsInterface,
        Built<ChatReceiveMessagesResponseApplicationJson_Ocs, ChatReceiveMessagesResponseApplicationJson_OcsBuilder> {
  factory ChatReceiveMessagesResponseApplicationJson_Ocs([
    void Function(ChatReceiveMessagesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatReceiveMessagesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatReceiveMessagesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatReceiveMessagesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatReceiveMessagesResponseApplicationJson_Ocs> get serializer =>
      _$chatReceiveMessagesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatReceiveMessagesResponseApplicationJsonInterface {
  ChatReceiveMessagesResponseApplicationJson_Ocs get ocs;
}

abstract class ChatReceiveMessagesResponseApplicationJson
    implements
        $ChatReceiveMessagesResponseApplicationJsonInterface,
        Built<ChatReceiveMessagesResponseApplicationJson, ChatReceiveMessagesResponseApplicationJsonBuilder> {
  factory ChatReceiveMessagesResponseApplicationJson([
    void Function(ChatReceiveMessagesResponseApplicationJsonBuilder)? b,
  ]) = _$ChatReceiveMessagesResponseApplicationJson;

  // coverage:ignore-start
  const ChatReceiveMessagesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatReceiveMessagesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatReceiveMessagesResponseApplicationJson> get serializer =>
      _$chatReceiveMessagesResponseApplicationJsonSerializer;
}

class ChatSendMessageApiVersion extends EnumClass {
  const ChatSendMessageApiVersion._(super.name);

  static const ChatSendMessageApiVersion v1 = _$chatSendMessageApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatSendMessageApiVersion> get values => _$chatSendMessageApiVersionValues;
  // coverage:ignore-end

  static ChatSendMessageApiVersion valueOf(String name) => _$valueOfChatSendMessageApiVersion(name);

  static Serializer<ChatSendMessageApiVersion> get serializer => _$chatSendMessageApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatSendMessageHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-common-read')
  String? get xChatLastCommonRead;
}

abstract class ChatChatSendMessageHeaders
    implements
        $ChatChatSendMessageHeadersInterface,
        Built<ChatChatSendMessageHeaders, ChatChatSendMessageHeadersBuilder> {
  factory ChatChatSendMessageHeaders([void Function(ChatChatSendMessageHeadersBuilder)? b]) =
      _$ChatChatSendMessageHeaders;

  // coverage:ignore-start
  const ChatChatSendMessageHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatSendMessageHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatSendMessageHeaders> get serializer => _$chatChatSendMessageHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatSendMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ChatMessageWithParent? get data;
}

abstract class ChatSendMessageResponseApplicationJson_Ocs
    implements
        $ChatSendMessageResponseApplicationJson_OcsInterface,
        Built<ChatSendMessageResponseApplicationJson_Ocs, ChatSendMessageResponseApplicationJson_OcsBuilder> {
  factory ChatSendMessageResponseApplicationJson_Ocs([
    void Function(ChatSendMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatSendMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatSendMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatSendMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatSendMessageResponseApplicationJson_Ocs> get serializer =>
      _$chatSendMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatSendMessageResponseApplicationJsonInterface {
  ChatSendMessageResponseApplicationJson_Ocs get ocs;
}

abstract class ChatSendMessageResponseApplicationJson
    implements
        $ChatSendMessageResponseApplicationJsonInterface,
        Built<ChatSendMessageResponseApplicationJson, ChatSendMessageResponseApplicationJsonBuilder> {
  factory ChatSendMessageResponseApplicationJson([void Function(ChatSendMessageResponseApplicationJsonBuilder)? b]) =
      _$ChatSendMessageResponseApplicationJson;

  // coverage:ignore-start
  const ChatSendMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatSendMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatSendMessageResponseApplicationJson> get serializer =>
      _$chatSendMessageResponseApplicationJsonSerializer;
}

class ChatClearHistoryApiVersion extends EnumClass {
  const ChatClearHistoryApiVersion._(super.name);

  static const ChatClearHistoryApiVersion v1 = _$chatClearHistoryApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatClearHistoryApiVersion> get values => _$chatClearHistoryApiVersionValues;
  // coverage:ignore-end

  static ChatClearHistoryApiVersion valueOf(String name) => _$valueOfChatClearHistoryApiVersion(name);

  static Serializer<ChatClearHistoryApiVersion> get serializer => _$chatClearHistoryApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatClearHistoryHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-common-read')
  String? get xChatLastCommonRead;
}

abstract class ChatChatClearHistoryHeaders
    implements
        $ChatChatClearHistoryHeadersInterface,
        Built<ChatChatClearHistoryHeaders, ChatChatClearHistoryHeadersBuilder> {
  factory ChatChatClearHistoryHeaders([void Function(ChatChatClearHistoryHeadersBuilder)? b]) =
      _$ChatChatClearHistoryHeaders;

  // coverage:ignore-start
  const ChatChatClearHistoryHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatClearHistoryHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatClearHistoryHeaders> get serializer => _$chatChatClearHistoryHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatClearHistoryResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ChatMessage get data;
}

abstract class ChatClearHistoryResponseApplicationJson_Ocs
    implements
        $ChatClearHistoryResponseApplicationJson_OcsInterface,
        Built<ChatClearHistoryResponseApplicationJson_Ocs, ChatClearHistoryResponseApplicationJson_OcsBuilder> {
  factory ChatClearHistoryResponseApplicationJson_Ocs([
    void Function(ChatClearHistoryResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatClearHistoryResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatClearHistoryResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatClearHistoryResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatClearHistoryResponseApplicationJson_Ocs> get serializer =>
      _$chatClearHistoryResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatClearHistoryResponseApplicationJsonInterface {
  ChatClearHistoryResponseApplicationJson_Ocs get ocs;
}

abstract class ChatClearHistoryResponseApplicationJson
    implements
        $ChatClearHistoryResponseApplicationJsonInterface,
        Built<ChatClearHistoryResponseApplicationJson, ChatClearHistoryResponseApplicationJsonBuilder> {
  factory ChatClearHistoryResponseApplicationJson([void Function(ChatClearHistoryResponseApplicationJsonBuilder)? b]) =
      _$ChatClearHistoryResponseApplicationJson;

  // coverage:ignore-start
  const ChatClearHistoryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatClearHistoryResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatClearHistoryResponseApplicationJson> get serializer =>
      _$chatClearHistoryResponseApplicationJsonSerializer;
}

class ChatDeleteMessageApiVersion extends EnumClass {
  const ChatDeleteMessageApiVersion._(super.name);

  static const ChatDeleteMessageApiVersion v1 = _$chatDeleteMessageApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatDeleteMessageApiVersion> get values => _$chatDeleteMessageApiVersionValues;
  // coverage:ignore-end

  static ChatDeleteMessageApiVersion valueOf(String name) => _$valueOfChatDeleteMessageApiVersion(name);

  static Serializer<ChatDeleteMessageApiVersion> get serializer => _$chatDeleteMessageApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatDeleteMessageHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-common-read')
  String? get xChatLastCommonRead;
}

abstract class ChatChatDeleteMessageHeaders
    implements
        $ChatChatDeleteMessageHeadersInterface,
        Built<ChatChatDeleteMessageHeaders, ChatChatDeleteMessageHeadersBuilder> {
  factory ChatChatDeleteMessageHeaders([void Function(ChatChatDeleteMessageHeadersBuilder)? b]) =
      _$ChatChatDeleteMessageHeaders;

  // coverage:ignore-start
  const ChatChatDeleteMessageHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatDeleteMessageHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatDeleteMessageHeaders> get serializer => _$chatChatDeleteMessageHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatDeleteMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ChatMessageWithParent get data;
}

abstract class ChatDeleteMessageResponseApplicationJson_Ocs
    implements
        $ChatDeleteMessageResponseApplicationJson_OcsInterface,
        Built<ChatDeleteMessageResponseApplicationJson_Ocs, ChatDeleteMessageResponseApplicationJson_OcsBuilder> {
  factory ChatDeleteMessageResponseApplicationJson_Ocs([
    void Function(ChatDeleteMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatDeleteMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatDeleteMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatDeleteMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatDeleteMessageResponseApplicationJson_Ocs> get serializer =>
      _$chatDeleteMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatDeleteMessageResponseApplicationJsonInterface {
  ChatDeleteMessageResponseApplicationJson_Ocs get ocs;
}

abstract class ChatDeleteMessageResponseApplicationJson
    implements
        $ChatDeleteMessageResponseApplicationJsonInterface,
        Built<ChatDeleteMessageResponseApplicationJson, ChatDeleteMessageResponseApplicationJsonBuilder> {
  factory ChatDeleteMessageResponseApplicationJson([
    void Function(ChatDeleteMessageResponseApplicationJsonBuilder)? b,
  ]) = _$ChatDeleteMessageResponseApplicationJson;

  // coverage:ignore-start
  const ChatDeleteMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatDeleteMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatDeleteMessageResponseApplicationJson> get serializer =>
      _$chatDeleteMessageResponseApplicationJsonSerializer;
}

class ChatGetMessageContextApiVersion extends EnumClass {
  const ChatGetMessageContextApiVersion._(super.name);

  static const ChatGetMessageContextApiVersion v1 = _$chatGetMessageContextApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatGetMessageContextApiVersion> get values => _$chatGetMessageContextApiVersionValues;
  // coverage:ignore-end

  static ChatGetMessageContextApiVersion valueOf(String name) => _$valueOfChatGetMessageContextApiVersion(name);

  static Serializer<ChatGetMessageContextApiVersion> get serializer => _$chatGetMessageContextApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatGetMessageContextHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-common-read')
  String? get xChatLastCommonRead;
  @BuiltValueField(wireName: 'x-chat-last-given')
  String? get xChatLastGiven;
}

abstract class ChatChatGetMessageContextHeaders
    implements
        $ChatChatGetMessageContextHeadersInterface,
        Built<ChatChatGetMessageContextHeaders, ChatChatGetMessageContextHeadersBuilder> {
  factory ChatChatGetMessageContextHeaders([void Function(ChatChatGetMessageContextHeadersBuilder)? b]) =
      _$ChatChatGetMessageContextHeaders;

  // coverage:ignore-start
  const ChatChatGetMessageContextHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatGetMessageContextHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatGetMessageContextHeaders> get serializer => _$chatChatGetMessageContextHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatGetMessageContextResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<ChatMessageWithParent> get data;
}

abstract class ChatGetMessageContextResponseApplicationJson_Ocs
    implements
        $ChatGetMessageContextResponseApplicationJson_OcsInterface,
        Built<ChatGetMessageContextResponseApplicationJson_Ocs,
            ChatGetMessageContextResponseApplicationJson_OcsBuilder> {
  factory ChatGetMessageContextResponseApplicationJson_Ocs([
    void Function(ChatGetMessageContextResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatGetMessageContextResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatGetMessageContextResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatGetMessageContextResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatGetMessageContextResponseApplicationJson_Ocs> get serializer =>
      _$chatGetMessageContextResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatGetMessageContextResponseApplicationJsonInterface {
  ChatGetMessageContextResponseApplicationJson_Ocs get ocs;
}

abstract class ChatGetMessageContextResponseApplicationJson
    implements
        $ChatGetMessageContextResponseApplicationJsonInterface,
        Built<ChatGetMessageContextResponseApplicationJson, ChatGetMessageContextResponseApplicationJsonBuilder> {
  factory ChatGetMessageContextResponseApplicationJson([
    void Function(ChatGetMessageContextResponseApplicationJsonBuilder)? b,
  ]) = _$ChatGetMessageContextResponseApplicationJson;

  // coverage:ignore-start
  const ChatGetMessageContextResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatGetMessageContextResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatGetMessageContextResponseApplicationJson> get serializer =>
      _$chatGetMessageContextResponseApplicationJsonSerializer;
}

class ChatGetReminderApiVersion extends EnumClass {
  const ChatGetReminderApiVersion._(super.name);

  static const ChatGetReminderApiVersion v1 = _$chatGetReminderApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatGetReminderApiVersion> get values => _$chatGetReminderApiVersionValues;
  // coverage:ignore-end

  static ChatGetReminderApiVersion valueOf(String name) => _$valueOfChatGetReminderApiVersion(name);

  static Serializer<ChatGetReminderApiVersion> get serializer => _$chatGetReminderApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatReminderInterface {
  int get messageId;
  int get timestamp;
  String get token;
  String get userId;
}

abstract class ChatReminder implements $ChatReminderInterface, Built<ChatReminder, ChatReminderBuilder> {
  factory ChatReminder([void Function(ChatReminderBuilder)? b]) = _$ChatReminder;

  // coverage:ignore-start
  const ChatReminder._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatReminder.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatReminder> get serializer => _$chatReminderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatGetReminderResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ChatReminder get data;
}

abstract class ChatGetReminderResponseApplicationJson_Ocs
    implements
        $ChatGetReminderResponseApplicationJson_OcsInterface,
        Built<ChatGetReminderResponseApplicationJson_Ocs, ChatGetReminderResponseApplicationJson_OcsBuilder> {
  factory ChatGetReminderResponseApplicationJson_Ocs([
    void Function(ChatGetReminderResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatGetReminderResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatGetReminderResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatGetReminderResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatGetReminderResponseApplicationJson_Ocs> get serializer =>
      _$chatGetReminderResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatGetReminderResponseApplicationJsonInterface {
  ChatGetReminderResponseApplicationJson_Ocs get ocs;
}

abstract class ChatGetReminderResponseApplicationJson
    implements
        $ChatGetReminderResponseApplicationJsonInterface,
        Built<ChatGetReminderResponseApplicationJson, ChatGetReminderResponseApplicationJsonBuilder> {
  factory ChatGetReminderResponseApplicationJson([void Function(ChatGetReminderResponseApplicationJsonBuilder)? b]) =
      _$ChatGetReminderResponseApplicationJson;

  // coverage:ignore-start
  const ChatGetReminderResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatGetReminderResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatGetReminderResponseApplicationJson> get serializer =>
      _$chatGetReminderResponseApplicationJsonSerializer;
}

class ChatSetReminderApiVersion extends EnumClass {
  const ChatSetReminderApiVersion._(super.name);

  static const ChatSetReminderApiVersion v1 = _$chatSetReminderApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatSetReminderApiVersion> get values => _$chatSetReminderApiVersionValues;
  // coverage:ignore-end

  static ChatSetReminderApiVersion valueOf(String name) => _$valueOfChatSetReminderApiVersion(name);

  static Serializer<ChatSetReminderApiVersion> get serializer => _$chatSetReminderApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatSetReminderResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ChatReminder get data;
}

abstract class ChatSetReminderResponseApplicationJson_Ocs
    implements
        $ChatSetReminderResponseApplicationJson_OcsInterface,
        Built<ChatSetReminderResponseApplicationJson_Ocs, ChatSetReminderResponseApplicationJson_OcsBuilder> {
  factory ChatSetReminderResponseApplicationJson_Ocs([
    void Function(ChatSetReminderResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatSetReminderResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatSetReminderResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatSetReminderResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatSetReminderResponseApplicationJson_Ocs> get serializer =>
      _$chatSetReminderResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatSetReminderResponseApplicationJsonInterface {
  ChatSetReminderResponseApplicationJson_Ocs get ocs;
}

abstract class ChatSetReminderResponseApplicationJson
    implements
        $ChatSetReminderResponseApplicationJsonInterface,
        Built<ChatSetReminderResponseApplicationJson, ChatSetReminderResponseApplicationJsonBuilder> {
  factory ChatSetReminderResponseApplicationJson([void Function(ChatSetReminderResponseApplicationJsonBuilder)? b]) =
      _$ChatSetReminderResponseApplicationJson;

  // coverage:ignore-start
  const ChatSetReminderResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatSetReminderResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatSetReminderResponseApplicationJson> get serializer =>
      _$chatSetReminderResponseApplicationJsonSerializer;
}

class ChatDeleteReminderApiVersion extends EnumClass {
  const ChatDeleteReminderApiVersion._(super.name);

  static const ChatDeleteReminderApiVersion v1 = _$chatDeleteReminderApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatDeleteReminderApiVersion> get values => _$chatDeleteReminderApiVersionValues;
  // coverage:ignore-end

  static ChatDeleteReminderApiVersion valueOf(String name) => _$valueOfChatDeleteReminderApiVersion(name);

  static Serializer<ChatDeleteReminderApiVersion> get serializer => _$chatDeleteReminderApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatDeleteReminderResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ChatDeleteReminderResponseApplicationJson_Ocs
    implements
        $ChatDeleteReminderResponseApplicationJson_OcsInterface,
        Built<ChatDeleteReminderResponseApplicationJson_Ocs, ChatDeleteReminderResponseApplicationJson_OcsBuilder> {
  factory ChatDeleteReminderResponseApplicationJson_Ocs([
    void Function(ChatDeleteReminderResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatDeleteReminderResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatDeleteReminderResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatDeleteReminderResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatDeleteReminderResponseApplicationJson_Ocs> get serializer =>
      _$chatDeleteReminderResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatDeleteReminderResponseApplicationJsonInterface {
  ChatDeleteReminderResponseApplicationJson_Ocs get ocs;
}

abstract class ChatDeleteReminderResponseApplicationJson
    implements
        $ChatDeleteReminderResponseApplicationJsonInterface,
        Built<ChatDeleteReminderResponseApplicationJson, ChatDeleteReminderResponseApplicationJsonBuilder> {
  factory ChatDeleteReminderResponseApplicationJson([
    void Function(ChatDeleteReminderResponseApplicationJsonBuilder)? b,
  ]) = _$ChatDeleteReminderResponseApplicationJson;

  // coverage:ignore-start
  const ChatDeleteReminderResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatDeleteReminderResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatDeleteReminderResponseApplicationJson> get serializer =>
      _$chatDeleteReminderResponseApplicationJsonSerializer;
}

class ChatSetReadMarkerApiVersion extends EnumClass {
  const ChatSetReadMarkerApiVersion._(super.name);

  static const ChatSetReadMarkerApiVersion v1 = _$chatSetReadMarkerApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatSetReadMarkerApiVersion> get values => _$chatSetReadMarkerApiVersionValues;
  // coverage:ignore-end

  static ChatSetReadMarkerApiVersion valueOf(String name) => _$valueOfChatSetReadMarkerApiVersion(name);

  static Serializer<ChatSetReadMarkerApiVersion> get serializer => _$chatSetReadMarkerApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatSetReadMarkerHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-common-read')
  String? get xChatLastCommonRead;
}

abstract class ChatChatSetReadMarkerHeaders
    implements
        $ChatChatSetReadMarkerHeadersInterface,
        Built<ChatChatSetReadMarkerHeaders, ChatChatSetReadMarkerHeadersBuilder> {
  factory ChatChatSetReadMarkerHeaders([void Function(ChatChatSetReadMarkerHeadersBuilder)? b]) =
      _$ChatChatSetReadMarkerHeaders;

  // coverage:ignore-start
  const ChatChatSetReadMarkerHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatSetReadMarkerHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatSetReadMarkerHeaders> get serializer => _$chatChatSetReadMarkerHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatSetReadMarkerResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ChatSetReadMarkerResponseApplicationJson_Ocs
    implements
        $ChatSetReadMarkerResponseApplicationJson_OcsInterface,
        Built<ChatSetReadMarkerResponseApplicationJson_Ocs, ChatSetReadMarkerResponseApplicationJson_OcsBuilder> {
  factory ChatSetReadMarkerResponseApplicationJson_Ocs([
    void Function(ChatSetReadMarkerResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatSetReadMarkerResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatSetReadMarkerResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatSetReadMarkerResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatSetReadMarkerResponseApplicationJson_Ocs> get serializer =>
      _$chatSetReadMarkerResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatSetReadMarkerResponseApplicationJsonInterface {
  ChatSetReadMarkerResponseApplicationJson_Ocs get ocs;
}

abstract class ChatSetReadMarkerResponseApplicationJson
    implements
        $ChatSetReadMarkerResponseApplicationJsonInterface,
        Built<ChatSetReadMarkerResponseApplicationJson, ChatSetReadMarkerResponseApplicationJsonBuilder> {
  factory ChatSetReadMarkerResponseApplicationJson([
    void Function(ChatSetReadMarkerResponseApplicationJsonBuilder)? b,
  ]) = _$ChatSetReadMarkerResponseApplicationJson;

  // coverage:ignore-start
  const ChatSetReadMarkerResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatSetReadMarkerResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatSetReadMarkerResponseApplicationJson> get serializer =>
      _$chatSetReadMarkerResponseApplicationJsonSerializer;
}

class ChatMarkUnreadApiVersion extends EnumClass {
  const ChatMarkUnreadApiVersion._(super.name);

  static const ChatMarkUnreadApiVersion v1 = _$chatMarkUnreadApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatMarkUnreadApiVersion> get values => _$chatMarkUnreadApiVersionValues;
  // coverage:ignore-end

  static ChatMarkUnreadApiVersion valueOf(String name) => _$valueOfChatMarkUnreadApiVersion(name);

  static Serializer<ChatMarkUnreadApiVersion> get serializer => _$chatMarkUnreadApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatMarkUnreadHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-common-read')
  String? get xChatLastCommonRead;
}

abstract class ChatChatMarkUnreadHeaders
    implements $ChatChatMarkUnreadHeadersInterface, Built<ChatChatMarkUnreadHeaders, ChatChatMarkUnreadHeadersBuilder> {
  factory ChatChatMarkUnreadHeaders([void Function(ChatChatMarkUnreadHeadersBuilder)? b]) = _$ChatChatMarkUnreadHeaders;

  // coverage:ignore-start
  const ChatChatMarkUnreadHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatMarkUnreadHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatMarkUnreadHeaders> get serializer => _$chatChatMarkUnreadHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatMarkUnreadResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ChatMarkUnreadResponseApplicationJson_Ocs
    implements
        $ChatMarkUnreadResponseApplicationJson_OcsInterface,
        Built<ChatMarkUnreadResponseApplicationJson_Ocs, ChatMarkUnreadResponseApplicationJson_OcsBuilder> {
  factory ChatMarkUnreadResponseApplicationJson_Ocs([
    void Function(ChatMarkUnreadResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatMarkUnreadResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatMarkUnreadResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatMarkUnreadResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatMarkUnreadResponseApplicationJson_Ocs> get serializer =>
      _$chatMarkUnreadResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatMarkUnreadResponseApplicationJsonInterface {
  ChatMarkUnreadResponseApplicationJson_Ocs get ocs;
}

abstract class ChatMarkUnreadResponseApplicationJson
    implements
        $ChatMarkUnreadResponseApplicationJsonInterface,
        Built<ChatMarkUnreadResponseApplicationJson, ChatMarkUnreadResponseApplicationJsonBuilder> {
  factory ChatMarkUnreadResponseApplicationJson([void Function(ChatMarkUnreadResponseApplicationJsonBuilder)? b]) =
      _$ChatMarkUnreadResponseApplicationJson;

  // coverage:ignore-start
  const ChatMarkUnreadResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatMarkUnreadResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatMarkUnreadResponseApplicationJson> get serializer =>
      _$chatMarkUnreadResponseApplicationJsonSerializer;
}

class ChatMentionsApiVersion extends EnumClass {
  const ChatMentionsApiVersion._(super.name);

  static const ChatMentionsApiVersion v1 = _$chatMentionsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatMentionsApiVersion> get values => _$chatMentionsApiVersionValues;
  // coverage:ignore-end

  static ChatMentionsApiVersion valueOf(String name) => _$valueOfChatMentionsApiVersion(name);

  static Serializer<ChatMentionsApiVersion> get serializer => _$chatMentionsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatMentionSuggestionInterface {
  String get id;
  String get label;
  String get source;
  String? get status;
  int? get statusClearAt;
  String? get statusIcon;
  String? get statusMessage;
}

abstract class ChatMentionSuggestion
    implements $ChatMentionSuggestionInterface, Built<ChatMentionSuggestion, ChatMentionSuggestionBuilder> {
  factory ChatMentionSuggestion([void Function(ChatMentionSuggestionBuilder)? b]) = _$ChatMentionSuggestion;

  // coverage:ignore-start
  const ChatMentionSuggestion._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatMentionSuggestion.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatMentionSuggestion> get serializer => _$chatMentionSuggestionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatMentionsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<ChatMentionSuggestion> get data;
}

abstract class ChatMentionsResponseApplicationJson_Ocs
    implements
        $ChatMentionsResponseApplicationJson_OcsInterface,
        Built<ChatMentionsResponseApplicationJson_Ocs, ChatMentionsResponseApplicationJson_OcsBuilder> {
  factory ChatMentionsResponseApplicationJson_Ocs([void Function(ChatMentionsResponseApplicationJson_OcsBuilder)? b]) =
      _$ChatMentionsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatMentionsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatMentionsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatMentionsResponseApplicationJson_Ocs> get serializer =>
      _$chatMentionsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatMentionsResponseApplicationJsonInterface {
  ChatMentionsResponseApplicationJson_Ocs get ocs;
}

abstract class ChatMentionsResponseApplicationJson
    implements
        $ChatMentionsResponseApplicationJsonInterface,
        Built<ChatMentionsResponseApplicationJson, ChatMentionsResponseApplicationJsonBuilder> {
  factory ChatMentionsResponseApplicationJson([void Function(ChatMentionsResponseApplicationJsonBuilder)? b]) =
      _$ChatMentionsResponseApplicationJson;

  // coverage:ignore-start
  const ChatMentionsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatMentionsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatMentionsResponseApplicationJson> get serializer =>
      _$chatMentionsResponseApplicationJsonSerializer;
}

class ChatGetObjectsSharedInRoomApiVersion extends EnumClass {
  const ChatGetObjectsSharedInRoomApiVersion._(super.name);

  static const ChatGetObjectsSharedInRoomApiVersion v1 = _$chatGetObjectsSharedInRoomApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatGetObjectsSharedInRoomApiVersion> get values => _$chatGetObjectsSharedInRoomApiVersionValues;
  // coverage:ignore-end

  static ChatGetObjectsSharedInRoomApiVersion valueOf(String name) =>
      _$valueOfChatGetObjectsSharedInRoomApiVersion(name);

  static Serializer<ChatGetObjectsSharedInRoomApiVersion> get serializer =>
      _$chatGetObjectsSharedInRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatGetObjectsSharedInRoomHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-given')
  String? get xChatLastGiven;
}

abstract class ChatChatGetObjectsSharedInRoomHeaders
    implements
        $ChatChatGetObjectsSharedInRoomHeadersInterface,
        Built<ChatChatGetObjectsSharedInRoomHeaders, ChatChatGetObjectsSharedInRoomHeadersBuilder> {
  factory ChatChatGetObjectsSharedInRoomHeaders([void Function(ChatChatGetObjectsSharedInRoomHeadersBuilder)? b]) =
      _$ChatChatGetObjectsSharedInRoomHeaders;

  // coverage:ignore-start
  const ChatChatGetObjectsSharedInRoomHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatGetObjectsSharedInRoomHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatGetObjectsSharedInRoomHeaders> get serializer =>
      _$chatChatGetObjectsSharedInRoomHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatGetObjectsSharedInRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<ChatMessage> get data;
}

abstract class ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs
    implements
        $ChatGetObjectsSharedInRoomResponseApplicationJson_OcsInterface,
        Built<ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs,
            ChatGetObjectsSharedInRoomResponseApplicationJson_OcsBuilder> {
  factory ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs([
    void Function(ChatGetObjectsSharedInRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs> get serializer =>
      _$chatGetObjectsSharedInRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatGetObjectsSharedInRoomResponseApplicationJsonInterface {
  ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs get ocs;
}

abstract class ChatGetObjectsSharedInRoomResponseApplicationJson
    implements
        $ChatGetObjectsSharedInRoomResponseApplicationJsonInterface,
        Built<ChatGetObjectsSharedInRoomResponseApplicationJson,
            ChatGetObjectsSharedInRoomResponseApplicationJsonBuilder> {
  factory ChatGetObjectsSharedInRoomResponseApplicationJson([
    void Function(ChatGetObjectsSharedInRoomResponseApplicationJsonBuilder)? b,
  ]) = _$ChatGetObjectsSharedInRoomResponseApplicationJson;

  // coverage:ignore-start
  const ChatGetObjectsSharedInRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatGetObjectsSharedInRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatGetObjectsSharedInRoomResponseApplicationJson> get serializer =>
      _$chatGetObjectsSharedInRoomResponseApplicationJsonSerializer;
}

class ChatShareObjectToChatApiVersion extends EnumClass {
  const ChatShareObjectToChatApiVersion._(super.name);

  static const ChatShareObjectToChatApiVersion v1 = _$chatShareObjectToChatApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatShareObjectToChatApiVersion> get values => _$chatShareObjectToChatApiVersionValues;
  // coverage:ignore-end

  static ChatShareObjectToChatApiVersion valueOf(String name) => _$valueOfChatShareObjectToChatApiVersion(name);

  static Serializer<ChatShareObjectToChatApiVersion> get serializer => _$chatShareObjectToChatApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatChatShareObjectToChatHeadersInterface {
  @BuiltValueField(wireName: 'x-chat-last-common-read')
  String? get xChatLastCommonRead;
}

abstract class ChatChatShareObjectToChatHeaders
    implements
        $ChatChatShareObjectToChatHeadersInterface,
        Built<ChatChatShareObjectToChatHeaders, ChatChatShareObjectToChatHeadersBuilder> {
  factory ChatChatShareObjectToChatHeaders([void Function(ChatChatShareObjectToChatHeadersBuilder)? b]) =
      _$ChatChatShareObjectToChatHeaders;

  // coverage:ignore-start
  const ChatChatShareObjectToChatHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatChatShareObjectToChatHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatChatShareObjectToChatHeaders> get serializer => _$chatChatShareObjectToChatHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatShareObjectToChatResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ChatMessageWithParent? get data;
}

abstract class ChatShareObjectToChatResponseApplicationJson_Ocs
    implements
        $ChatShareObjectToChatResponseApplicationJson_OcsInterface,
        Built<ChatShareObjectToChatResponseApplicationJson_Ocs,
            ChatShareObjectToChatResponseApplicationJson_OcsBuilder> {
  factory ChatShareObjectToChatResponseApplicationJson_Ocs([
    void Function(ChatShareObjectToChatResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatShareObjectToChatResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatShareObjectToChatResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatShareObjectToChatResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatShareObjectToChatResponseApplicationJson_Ocs> get serializer =>
      _$chatShareObjectToChatResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatShareObjectToChatResponseApplicationJsonInterface {
  ChatShareObjectToChatResponseApplicationJson_Ocs get ocs;
}

abstract class ChatShareObjectToChatResponseApplicationJson
    implements
        $ChatShareObjectToChatResponseApplicationJsonInterface,
        Built<ChatShareObjectToChatResponseApplicationJson, ChatShareObjectToChatResponseApplicationJsonBuilder> {
  factory ChatShareObjectToChatResponseApplicationJson([
    void Function(ChatShareObjectToChatResponseApplicationJsonBuilder)? b,
  ]) = _$ChatShareObjectToChatResponseApplicationJson;

  // coverage:ignore-start
  const ChatShareObjectToChatResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatShareObjectToChatResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatShareObjectToChatResponseApplicationJson> get serializer =>
      _$chatShareObjectToChatResponseApplicationJsonSerializer;
}

class ChatGetObjectsSharedInRoomOverviewApiVersion extends EnumClass {
  const ChatGetObjectsSharedInRoomOverviewApiVersion._(super.name);

  static const ChatGetObjectsSharedInRoomOverviewApiVersion v1 = _$chatGetObjectsSharedInRoomOverviewApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ChatGetObjectsSharedInRoomOverviewApiVersion> get values =>
      _$chatGetObjectsSharedInRoomOverviewApiVersionValues;
  // coverage:ignore-end

  static ChatGetObjectsSharedInRoomOverviewApiVersion valueOf(String name) =>
      _$valueOfChatGetObjectsSharedInRoomOverviewApiVersion(name);

  static Serializer<ChatGetObjectsSharedInRoomOverviewApiVersion> get serializer =>
      _$chatGetObjectsSharedInRoomOverviewApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, BuiltList<ChatMessage>> get data;
}

abstract class ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs
    implements
        $ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_OcsInterface,
        Built<ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs,
            ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_OcsBuilder> {
  factory ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs([
    void Function(ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs> get serializer =>
      _$chatGetObjectsSharedInRoomOverviewResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ChatGetObjectsSharedInRoomOverviewResponseApplicationJsonInterface {
  ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs get ocs;
}

abstract class ChatGetObjectsSharedInRoomOverviewResponseApplicationJson
    implements
        $ChatGetObjectsSharedInRoomOverviewResponseApplicationJsonInterface,
        Built<ChatGetObjectsSharedInRoomOverviewResponseApplicationJson,
            ChatGetObjectsSharedInRoomOverviewResponseApplicationJsonBuilder> {
  factory ChatGetObjectsSharedInRoomOverviewResponseApplicationJson([
    void Function(ChatGetObjectsSharedInRoomOverviewResponseApplicationJsonBuilder)? b,
  ]) = _$ChatGetObjectsSharedInRoomOverviewResponseApplicationJson;

  // coverage:ignore-start
  const ChatGetObjectsSharedInRoomOverviewResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ChatGetObjectsSharedInRoomOverviewResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ChatGetObjectsSharedInRoomOverviewResponseApplicationJson> get serializer =>
      _$chatGetObjectsSharedInRoomOverviewResponseApplicationJsonSerializer;
}

class FederationAcceptShareApiVersion extends EnumClass {
  const FederationAcceptShareApiVersion._(super.name);

  static const FederationAcceptShareApiVersion v1 = _$federationAcceptShareApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<FederationAcceptShareApiVersion> get values => _$federationAcceptShareApiVersionValues;
  // coverage:ignore-end

  static FederationAcceptShareApiVersion valueOf(String name) => _$valueOfFederationAcceptShareApiVersion(name);

  static Serializer<FederationAcceptShareApiVersion> get serializer => _$federationAcceptShareApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FederationAcceptShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class FederationAcceptShareResponseApplicationJson_Ocs
    implements
        $FederationAcceptShareResponseApplicationJson_OcsInterface,
        Built<FederationAcceptShareResponseApplicationJson_Ocs,
            FederationAcceptShareResponseApplicationJson_OcsBuilder> {
  factory FederationAcceptShareResponseApplicationJson_Ocs([
    void Function(FederationAcceptShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FederationAcceptShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FederationAcceptShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FederationAcceptShareResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FederationAcceptShareResponseApplicationJson_Ocs> get serializer =>
      _$federationAcceptShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FederationAcceptShareResponseApplicationJsonInterface {
  FederationAcceptShareResponseApplicationJson_Ocs get ocs;
}

abstract class FederationAcceptShareResponseApplicationJson
    implements
        $FederationAcceptShareResponseApplicationJsonInterface,
        Built<FederationAcceptShareResponseApplicationJson, FederationAcceptShareResponseApplicationJsonBuilder> {
  factory FederationAcceptShareResponseApplicationJson([
    void Function(FederationAcceptShareResponseApplicationJsonBuilder)? b,
  ]) = _$FederationAcceptShareResponseApplicationJson;

  // coverage:ignore-start
  const FederationAcceptShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FederationAcceptShareResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FederationAcceptShareResponseApplicationJson> get serializer =>
      _$federationAcceptShareResponseApplicationJsonSerializer;
}

class FederationRejectShareApiVersion extends EnumClass {
  const FederationRejectShareApiVersion._(super.name);

  static const FederationRejectShareApiVersion v1 = _$federationRejectShareApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<FederationRejectShareApiVersion> get values => _$federationRejectShareApiVersionValues;
  // coverage:ignore-end

  static FederationRejectShareApiVersion valueOf(String name) => _$valueOfFederationRejectShareApiVersion(name);

  static Serializer<FederationRejectShareApiVersion> get serializer => _$federationRejectShareApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FederationRejectShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class FederationRejectShareResponseApplicationJson_Ocs
    implements
        $FederationRejectShareResponseApplicationJson_OcsInterface,
        Built<FederationRejectShareResponseApplicationJson_Ocs,
            FederationRejectShareResponseApplicationJson_OcsBuilder> {
  factory FederationRejectShareResponseApplicationJson_Ocs([
    void Function(FederationRejectShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FederationRejectShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FederationRejectShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FederationRejectShareResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FederationRejectShareResponseApplicationJson_Ocs> get serializer =>
      _$federationRejectShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FederationRejectShareResponseApplicationJsonInterface {
  FederationRejectShareResponseApplicationJson_Ocs get ocs;
}

abstract class FederationRejectShareResponseApplicationJson
    implements
        $FederationRejectShareResponseApplicationJsonInterface,
        Built<FederationRejectShareResponseApplicationJson, FederationRejectShareResponseApplicationJsonBuilder> {
  factory FederationRejectShareResponseApplicationJson([
    void Function(FederationRejectShareResponseApplicationJsonBuilder)? b,
  ]) = _$FederationRejectShareResponseApplicationJson;

  // coverage:ignore-start
  const FederationRejectShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FederationRejectShareResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FederationRejectShareResponseApplicationJson> get serializer =>
      _$federationRejectShareResponseApplicationJsonSerializer;
}

class FederationGetSharesApiVersion extends EnumClass {
  const FederationGetSharesApiVersion._(super.name);

  static const FederationGetSharesApiVersion v1 = _$federationGetSharesApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<FederationGetSharesApiVersion> get values => _$federationGetSharesApiVersionValues;
  // coverage:ignore-end

  static FederationGetSharesApiVersion valueOf(String name) => _$valueOfFederationGetSharesApiVersion(name);

  static Serializer<FederationGetSharesApiVersion> get serializer => _$federationGetSharesApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FederationInviteInterface {
  @BuiltValueField(wireName: 'access_token')
  String get accessToken;
  int get id;
  @BuiltValueField(wireName: 'local_room_id')
  int get localRoomId;
  @BuiltValueField(wireName: 'remote_attendee_id')
  String get remoteAttendeeId;
  @BuiltValueField(wireName: 'remote_server_url')
  String get remoteServerUrl;
  @BuiltValueField(wireName: 'remote_token')
  String get remoteToken;
  @BuiltValueField(wireName: 'user_id')
  String get userId;
}

abstract class FederationInvite
    implements $FederationInviteInterface, Built<FederationInvite, FederationInviteBuilder> {
  factory FederationInvite([void Function(FederationInviteBuilder)? b]) = _$FederationInvite;

  // coverage:ignore-start
  const FederationInvite._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FederationInvite.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FederationInvite> get serializer => _$federationInviteSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FederationGetSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<FederationInvite> get data;
}

abstract class FederationGetSharesResponseApplicationJson_Ocs
    implements
        $FederationGetSharesResponseApplicationJson_OcsInterface,
        Built<FederationGetSharesResponseApplicationJson_Ocs, FederationGetSharesResponseApplicationJson_OcsBuilder> {
  factory FederationGetSharesResponseApplicationJson_Ocs([
    void Function(FederationGetSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FederationGetSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FederationGetSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FederationGetSharesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FederationGetSharesResponseApplicationJson_Ocs> get serializer =>
      _$federationGetSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FederationGetSharesResponseApplicationJsonInterface {
  FederationGetSharesResponseApplicationJson_Ocs get ocs;
}

abstract class FederationGetSharesResponseApplicationJson
    implements
        $FederationGetSharesResponseApplicationJsonInterface,
        Built<FederationGetSharesResponseApplicationJson, FederationGetSharesResponseApplicationJsonBuilder> {
  factory FederationGetSharesResponseApplicationJson([
    void Function(FederationGetSharesResponseApplicationJsonBuilder)? b,
  ]) = _$FederationGetSharesResponseApplicationJson;

  // coverage:ignore-start
  const FederationGetSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FederationGetSharesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FederationGetSharesResponseApplicationJson> get serializer =>
      _$federationGetSharesResponseApplicationJsonSerializer;
}

class FilesIntegrationGetRoomByFileIdApiVersion extends EnumClass {
  const FilesIntegrationGetRoomByFileIdApiVersion._(super.name);

  static const FilesIntegrationGetRoomByFileIdApiVersion v1 = _$filesIntegrationGetRoomByFileIdApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<FilesIntegrationGetRoomByFileIdApiVersion> get values =>
      _$filesIntegrationGetRoomByFileIdApiVersionValues;
  // coverage:ignore-end

  static FilesIntegrationGetRoomByFileIdApiVersion valueOf(String name) =>
      _$valueOfFilesIntegrationGetRoomByFileIdApiVersion(name);

  static Serializer<FilesIntegrationGetRoomByFileIdApiVersion> get serializer =>
      _$filesIntegrationGetRoomByFileIdApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_DataInterface {
  String get token;
}

abstract class FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data
    implements
        $FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_DataInterface,
        Built<FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data,
            FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data([
    void Function(FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesIntegrationGetRoomByFileIdResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesIntegrationGetRoomByFileIdResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data get data;
}

abstract class FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs
    implements
        $FilesIntegrationGetRoomByFileIdResponseApplicationJson_OcsInterface,
        Built<FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs,
            FilesIntegrationGetRoomByFileIdResponseApplicationJson_OcsBuilder> {
  factory FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs([
    void Function(FilesIntegrationGetRoomByFileIdResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs> get serializer =>
      _$filesIntegrationGetRoomByFileIdResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesIntegrationGetRoomByFileIdResponseApplicationJsonInterface {
  FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs get ocs;
}

abstract class FilesIntegrationGetRoomByFileIdResponseApplicationJson
    implements
        $FilesIntegrationGetRoomByFileIdResponseApplicationJsonInterface,
        Built<FilesIntegrationGetRoomByFileIdResponseApplicationJson,
            FilesIntegrationGetRoomByFileIdResponseApplicationJsonBuilder> {
  factory FilesIntegrationGetRoomByFileIdResponseApplicationJson([
    void Function(FilesIntegrationGetRoomByFileIdResponseApplicationJsonBuilder)? b,
  ]) = _$FilesIntegrationGetRoomByFileIdResponseApplicationJson;

  // coverage:ignore-start
  const FilesIntegrationGetRoomByFileIdResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesIntegrationGetRoomByFileIdResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesIntegrationGetRoomByFileIdResponseApplicationJson> get serializer =>
      _$filesIntegrationGetRoomByFileIdResponseApplicationJsonSerializer;
}

class FilesIntegrationGetRoomByShareTokenApiVersion extends EnumClass {
  const FilesIntegrationGetRoomByShareTokenApiVersion._(super.name);

  static const FilesIntegrationGetRoomByShareTokenApiVersion v1 = _$filesIntegrationGetRoomByShareTokenApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<FilesIntegrationGetRoomByShareTokenApiVersion> get values =>
      _$filesIntegrationGetRoomByShareTokenApiVersionValues;
  // coverage:ignore-end

  static FilesIntegrationGetRoomByShareTokenApiVersion valueOf(String name) =>
      _$valueOfFilesIntegrationGetRoomByShareTokenApiVersion(name);

  static Serializer<FilesIntegrationGetRoomByShareTokenApiVersion> get serializer =>
      _$filesIntegrationGetRoomByShareTokenApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_DataInterface {
  String get token;
  String get userId;
  String get userDisplayName;
}

abstract class FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data
    implements
        $FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_DataInterface,
        Built<FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data,
            FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data([
    void Function(FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesIntegrationGetRoomByShareTokenResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesIntegrationGetRoomByShareTokenResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data get data;
}

abstract class FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs
    implements
        $FilesIntegrationGetRoomByShareTokenResponseApplicationJson_OcsInterface,
        Built<FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs,
            FilesIntegrationGetRoomByShareTokenResponseApplicationJson_OcsBuilder> {
  factory FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs([
    void Function(FilesIntegrationGetRoomByShareTokenResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs> get serializer =>
      _$filesIntegrationGetRoomByShareTokenResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesIntegrationGetRoomByShareTokenResponseApplicationJsonInterface {
  FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs get ocs;
}

abstract class FilesIntegrationGetRoomByShareTokenResponseApplicationJson
    implements
        $FilesIntegrationGetRoomByShareTokenResponseApplicationJsonInterface,
        Built<FilesIntegrationGetRoomByShareTokenResponseApplicationJson,
            FilesIntegrationGetRoomByShareTokenResponseApplicationJsonBuilder> {
  factory FilesIntegrationGetRoomByShareTokenResponseApplicationJson([
    void Function(FilesIntegrationGetRoomByShareTokenResponseApplicationJsonBuilder)? b,
  ]) = _$FilesIntegrationGetRoomByShareTokenResponseApplicationJson;

  // coverage:ignore-start
  const FilesIntegrationGetRoomByShareTokenResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesIntegrationGetRoomByShareTokenResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesIntegrationGetRoomByShareTokenResponseApplicationJson> get serializer =>
      _$filesIntegrationGetRoomByShareTokenResponseApplicationJsonSerializer;
}

class GuestSetDisplayNameApiVersion extends EnumClass {
  const GuestSetDisplayNameApiVersion._(super.name);

  static const GuestSetDisplayNameApiVersion v1 = _$guestSetDisplayNameApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<GuestSetDisplayNameApiVersion> get values => _$guestSetDisplayNameApiVersionValues;
  // coverage:ignore-end

  static GuestSetDisplayNameApiVersion valueOf(String name) => _$valueOfGuestSetDisplayNameApiVersion(name);

  static Serializer<GuestSetDisplayNameApiVersion> get serializer => _$guestSetDisplayNameApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GuestSetDisplayNameResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class GuestSetDisplayNameResponseApplicationJson_Ocs
    implements
        $GuestSetDisplayNameResponseApplicationJson_OcsInterface,
        Built<GuestSetDisplayNameResponseApplicationJson_Ocs, GuestSetDisplayNameResponseApplicationJson_OcsBuilder> {
  factory GuestSetDisplayNameResponseApplicationJson_Ocs([
    void Function(GuestSetDisplayNameResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GuestSetDisplayNameResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GuestSetDisplayNameResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GuestSetDisplayNameResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GuestSetDisplayNameResponseApplicationJson_Ocs> get serializer =>
      _$guestSetDisplayNameResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GuestSetDisplayNameResponseApplicationJsonInterface {
  GuestSetDisplayNameResponseApplicationJson_Ocs get ocs;
}

abstract class GuestSetDisplayNameResponseApplicationJson
    implements
        $GuestSetDisplayNameResponseApplicationJsonInterface,
        Built<GuestSetDisplayNameResponseApplicationJson, GuestSetDisplayNameResponseApplicationJsonBuilder> {
  factory GuestSetDisplayNameResponseApplicationJson([
    void Function(GuestSetDisplayNameResponseApplicationJsonBuilder)? b,
  ]) = _$GuestSetDisplayNameResponseApplicationJson;

  // coverage:ignore-start
  const GuestSetDisplayNameResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GuestSetDisplayNameResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GuestSetDisplayNameResponseApplicationJson> get serializer =>
      _$guestSetDisplayNameResponseApplicationJsonSerializer;
}

class HostedSignalingServerRequestTrialApiVersion extends EnumClass {
  const HostedSignalingServerRequestTrialApiVersion._(super.name);

  static const HostedSignalingServerRequestTrialApiVersion v1 = _$hostedSignalingServerRequestTrialApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<HostedSignalingServerRequestTrialApiVersion> get values =>
      _$hostedSignalingServerRequestTrialApiVersionValues;
  // coverage:ignore-end

  static HostedSignalingServerRequestTrialApiVersion valueOf(String name) =>
      _$valueOfHostedSignalingServerRequestTrialApiVersion(name);

  static Serializer<HostedSignalingServerRequestTrialApiVersion> get serializer =>
      _$hostedSignalingServerRequestTrialApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HostedSignalingServerRequestTrialResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, JsonObject> get data;
}

abstract class HostedSignalingServerRequestTrialResponseApplicationJson_Ocs
    implements
        $HostedSignalingServerRequestTrialResponseApplicationJson_OcsInterface,
        Built<HostedSignalingServerRequestTrialResponseApplicationJson_Ocs,
            HostedSignalingServerRequestTrialResponseApplicationJson_OcsBuilder> {
  factory HostedSignalingServerRequestTrialResponseApplicationJson_Ocs([
    void Function(HostedSignalingServerRequestTrialResponseApplicationJson_OcsBuilder)? b,
  ]) = _$HostedSignalingServerRequestTrialResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const HostedSignalingServerRequestTrialResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HostedSignalingServerRequestTrialResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HostedSignalingServerRequestTrialResponseApplicationJson_Ocs> get serializer =>
      _$hostedSignalingServerRequestTrialResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HostedSignalingServerRequestTrialResponseApplicationJsonInterface {
  HostedSignalingServerRequestTrialResponseApplicationJson_Ocs get ocs;
}

abstract class HostedSignalingServerRequestTrialResponseApplicationJson
    implements
        $HostedSignalingServerRequestTrialResponseApplicationJsonInterface,
        Built<HostedSignalingServerRequestTrialResponseApplicationJson,
            HostedSignalingServerRequestTrialResponseApplicationJsonBuilder> {
  factory HostedSignalingServerRequestTrialResponseApplicationJson([
    void Function(HostedSignalingServerRequestTrialResponseApplicationJsonBuilder)? b,
  ]) = _$HostedSignalingServerRequestTrialResponseApplicationJson;

  // coverage:ignore-start
  const HostedSignalingServerRequestTrialResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HostedSignalingServerRequestTrialResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HostedSignalingServerRequestTrialResponseApplicationJson> get serializer =>
      _$hostedSignalingServerRequestTrialResponseApplicationJsonSerializer;
}

class HostedSignalingServerDeleteAccountApiVersion extends EnumClass {
  const HostedSignalingServerDeleteAccountApiVersion._(super.name);

  static const HostedSignalingServerDeleteAccountApiVersion v1 = _$hostedSignalingServerDeleteAccountApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<HostedSignalingServerDeleteAccountApiVersion> get values =>
      _$hostedSignalingServerDeleteAccountApiVersionValues;
  // coverage:ignore-end

  static HostedSignalingServerDeleteAccountApiVersion valueOf(String name) =>
      _$valueOfHostedSignalingServerDeleteAccountApiVersion(name);

  static Serializer<HostedSignalingServerDeleteAccountApiVersion> get serializer =>
      _$hostedSignalingServerDeleteAccountApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HostedSignalingServerDeleteAccountResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs
    implements
        $HostedSignalingServerDeleteAccountResponseApplicationJson_OcsInterface,
        Built<HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs,
            HostedSignalingServerDeleteAccountResponseApplicationJson_OcsBuilder> {
  factory HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs([
    void Function(HostedSignalingServerDeleteAccountResponseApplicationJson_OcsBuilder)? b,
  ]) = _$HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs> get serializer =>
      _$hostedSignalingServerDeleteAccountResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HostedSignalingServerDeleteAccountResponseApplicationJsonInterface {
  HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs get ocs;
}

abstract class HostedSignalingServerDeleteAccountResponseApplicationJson
    implements
        $HostedSignalingServerDeleteAccountResponseApplicationJsonInterface,
        Built<HostedSignalingServerDeleteAccountResponseApplicationJson,
            HostedSignalingServerDeleteAccountResponseApplicationJsonBuilder> {
  factory HostedSignalingServerDeleteAccountResponseApplicationJson([
    void Function(HostedSignalingServerDeleteAccountResponseApplicationJsonBuilder)? b,
  ]) = _$HostedSignalingServerDeleteAccountResponseApplicationJson;

  // coverage:ignore-start
  const HostedSignalingServerDeleteAccountResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HostedSignalingServerDeleteAccountResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HostedSignalingServerDeleteAccountResponseApplicationJson> get serializer =>
      _$hostedSignalingServerDeleteAccountResponseApplicationJsonSerializer;
}

class MatterbridgeGetBridgeOfRoomApiVersion extends EnumClass {
  const MatterbridgeGetBridgeOfRoomApiVersion._(super.name);

  static const MatterbridgeGetBridgeOfRoomApiVersion v1 = _$matterbridgeGetBridgeOfRoomApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<MatterbridgeGetBridgeOfRoomApiVersion> get values => _$matterbridgeGetBridgeOfRoomApiVersionValues;
  // coverage:ignore-end

  static MatterbridgeGetBridgeOfRoomApiVersion valueOf(String name) =>
      _$valueOfMatterbridgeGetBridgeOfRoomApiVersion(name);

  static Serializer<MatterbridgeGetBridgeOfRoomApiVersion> get serializer =>
      _$matterbridgeGetBridgeOfRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeInterface {
  bool get enabled;
  BuiltList<BuiltMap<String, JsonObject>> get parts;
  int get pid;
}

abstract class Matterbridge implements $MatterbridgeInterface, Built<Matterbridge, MatterbridgeBuilder> {
  factory Matterbridge([void Function(MatterbridgeBuilder)? b]) = _$Matterbridge;

  // coverage:ignore-start
  const Matterbridge._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Matterbridge.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Matterbridge> get serializer => _$matterbridgeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeProcessStateInterface {
  String get log;
  bool get running;
}

abstract class MatterbridgeProcessState
    implements $MatterbridgeProcessStateInterface, Built<MatterbridgeProcessState, MatterbridgeProcessStateBuilder> {
  factory MatterbridgeProcessState([void Function(MatterbridgeProcessStateBuilder)? b]) = _$MatterbridgeProcessState;

  // coverage:ignore-start
  const MatterbridgeProcessState._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeProcessState.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeProcessState> get serializer => _$matterbridgeProcessStateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeWithProcessStateInterface
    implements $MatterbridgeInterface, $MatterbridgeProcessStateInterface {}

abstract class MatterbridgeWithProcessState
    implements
        $MatterbridgeWithProcessStateInterface,
        Built<MatterbridgeWithProcessState, MatterbridgeWithProcessStateBuilder> {
  factory MatterbridgeWithProcessState([void Function(MatterbridgeWithProcessStateBuilder)? b]) =
      _$MatterbridgeWithProcessState;

  // coverage:ignore-start
  const MatterbridgeWithProcessState._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeWithProcessState.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeWithProcessState> get serializer => _$matterbridgeWithProcessStateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeGetBridgeOfRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  MatterbridgeWithProcessState get data;
}

abstract class MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs
    implements
        $MatterbridgeGetBridgeOfRoomResponseApplicationJson_OcsInterface,
        Built<MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs,
            MatterbridgeGetBridgeOfRoomResponseApplicationJson_OcsBuilder> {
  factory MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs([
    void Function(MatterbridgeGetBridgeOfRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs> get serializer =>
      _$matterbridgeGetBridgeOfRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeGetBridgeOfRoomResponseApplicationJsonInterface {
  MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs get ocs;
}

abstract class MatterbridgeGetBridgeOfRoomResponseApplicationJson
    implements
        $MatterbridgeGetBridgeOfRoomResponseApplicationJsonInterface,
        Built<MatterbridgeGetBridgeOfRoomResponseApplicationJson,
            MatterbridgeGetBridgeOfRoomResponseApplicationJsonBuilder> {
  factory MatterbridgeGetBridgeOfRoomResponseApplicationJson([
    void Function(MatterbridgeGetBridgeOfRoomResponseApplicationJsonBuilder)? b,
  ]) = _$MatterbridgeGetBridgeOfRoomResponseApplicationJson;

  // coverage:ignore-start
  const MatterbridgeGetBridgeOfRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeGetBridgeOfRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeGetBridgeOfRoomResponseApplicationJson> get serializer =>
      _$matterbridgeGetBridgeOfRoomResponseApplicationJsonSerializer;
}

class MatterbridgeEditBridgeOfRoomApiVersion extends EnumClass {
  const MatterbridgeEditBridgeOfRoomApiVersion._(super.name);

  static const MatterbridgeEditBridgeOfRoomApiVersion v1 = _$matterbridgeEditBridgeOfRoomApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<MatterbridgeEditBridgeOfRoomApiVersion> get values => _$matterbridgeEditBridgeOfRoomApiVersionValues;
  // coverage:ignore-end

  static MatterbridgeEditBridgeOfRoomApiVersion valueOf(String name) =>
      _$valueOfMatterbridgeEditBridgeOfRoomApiVersion(name);

  static Serializer<MatterbridgeEditBridgeOfRoomApiVersion> get serializer =>
      _$matterbridgeEditBridgeOfRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeEditBridgeOfRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  MatterbridgeProcessState get data;
}

abstract class MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs
    implements
        $MatterbridgeEditBridgeOfRoomResponseApplicationJson_OcsInterface,
        Built<MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs,
            MatterbridgeEditBridgeOfRoomResponseApplicationJson_OcsBuilder> {
  factory MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs([
    void Function(MatterbridgeEditBridgeOfRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs> get serializer =>
      _$matterbridgeEditBridgeOfRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeEditBridgeOfRoomResponseApplicationJsonInterface {
  MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs get ocs;
}

abstract class MatterbridgeEditBridgeOfRoomResponseApplicationJson
    implements
        $MatterbridgeEditBridgeOfRoomResponseApplicationJsonInterface,
        Built<MatterbridgeEditBridgeOfRoomResponseApplicationJson,
            MatterbridgeEditBridgeOfRoomResponseApplicationJsonBuilder> {
  factory MatterbridgeEditBridgeOfRoomResponseApplicationJson([
    void Function(MatterbridgeEditBridgeOfRoomResponseApplicationJsonBuilder)? b,
  ]) = _$MatterbridgeEditBridgeOfRoomResponseApplicationJson;

  // coverage:ignore-start
  const MatterbridgeEditBridgeOfRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeEditBridgeOfRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeEditBridgeOfRoomResponseApplicationJson> get serializer =>
      _$matterbridgeEditBridgeOfRoomResponseApplicationJsonSerializer;
}

class MatterbridgeDeleteBridgeOfRoomApiVersion extends EnumClass {
  const MatterbridgeDeleteBridgeOfRoomApiVersion._(super.name);

  static const MatterbridgeDeleteBridgeOfRoomApiVersion v1 = _$matterbridgeDeleteBridgeOfRoomApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<MatterbridgeDeleteBridgeOfRoomApiVersion> get values =>
      _$matterbridgeDeleteBridgeOfRoomApiVersionValues;
  // coverage:ignore-end

  static MatterbridgeDeleteBridgeOfRoomApiVersion valueOf(String name) =>
      _$valueOfMatterbridgeDeleteBridgeOfRoomApiVersion(name);

  static Serializer<MatterbridgeDeleteBridgeOfRoomApiVersion> get serializer =>
      _$matterbridgeDeleteBridgeOfRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  bool get data;
}

abstract class MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs
    implements
        $MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_OcsInterface,
        Built<MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs,
            MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_OcsBuilder> {
  factory MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs([
    void Function(MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs> get serializer =>
      _$matterbridgeDeleteBridgeOfRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeDeleteBridgeOfRoomResponseApplicationJsonInterface {
  MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs get ocs;
}

abstract class MatterbridgeDeleteBridgeOfRoomResponseApplicationJson
    implements
        $MatterbridgeDeleteBridgeOfRoomResponseApplicationJsonInterface,
        Built<MatterbridgeDeleteBridgeOfRoomResponseApplicationJson,
            MatterbridgeDeleteBridgeOfRoomResponseApplicationJsonBuilder> {
  factory MatterbridgeDeleteBridgeOfRoomResponseApplicationJson([
    void Function(MatterbridgeDeleteBridgeOfRoomResponseApplicationJsonBuilder)? b,
  ]) = _$MatterbridgeDeleteBridgeOfRoomResponseApplicationJson;

  // coverage:ignore-start
  const MatterbridgeDeleteBridgeOfRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeDeleteBridgeOfRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeDeleteBridgeOfRoomResponseApplicationJson> get serializer =>
      _$matterbridgeDeleteBridgeOfRoomResponseApplicationJsonSerializer;
}

class MatterbridgeGetBridgeProcessStateApiVersion extends EnumClass {
  const MatterbridgeGetBridgeProcessStateApiVersion._(super.name);

  static const MatterbridgeGetBridgeProcessStateApiVersion v1 = _$matterbridgeGetBridgeProcessStateApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<MatterbridgeGetBridgeProcessStateApiVersion> get values =>
      _$matterbridgeGetBridgeProcessStateApiVersionValues;
  // coverage:ignore-end

  static MatterbridgeGetBridgeProcessStateApiVersion valueOf(String name) =>
      _$valueOfMatterbridgeGetBridgeProcessStateApiVersion(name);

  static Serializer<MatterbridgeGetBridgeProcessStateApiVersion> get serializer =>
      _$matterbridgeGetBridgeProcessStateApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeGetBridgeProcessStateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  MatterbridgeProcessState get data;
}

abstract class MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs
    implements
        $MatterbridgeGetBridgeProcessStateResponseApplicationJson_OcsInterface,
        Built<MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs,
            MatterbridgeGetBridgeProcessStateResponseApplicationJson_OcsBuilder> {
  factory MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs([
    void Function(MatterbridgeGetBridgeProcessStateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs> get serializer =>
      _$matterbridgeGetBridgeProcessStateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeGetBridgeProcessStateResponseApplicationJsonInterface {
  MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs get ocs;
}

abstract class MatterbridgeGetBridgeProcessStateResponseApplicationJson
    implements
        $MatterbridgeGetBridgeProcessStateResponseApplicationJsonInterface,
        Built<MatterbridgeGetBridgeProcessStateResponseApplicationJson,
            MatterbridgeGetBridgeProcessStateResponseApplicationJsonBuilder> {
  factory MatterbridgeGetBridgeProcessStateResponseApplicationJson([
    void Function(MatterbridgeGetBridgeProcessStateResponseApplicationJsonBuilder)? b,
  ]) = _$MatterbridgeGetBridgeProcessStateResponseApplicationJson;

  // coverage:ignore-start
  const MatterbridgeGetBridgeProcessStateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeGetBridgeProcessStateResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeGetBridgeProcessStateResponseApplicationJson> get serializer =>
      _$matterbridgeGetBridgeProcessStateResponseApplicationJsonSerializer;
}

class MatterbridgeSettingsStopAllBridgesApiVersion extends EnumClass {
  const MatterbridgeSettingsStopAllBridgesApiVersion._(super.name);

  static const MatterbridgeSettingsStopAllBridgesApiVersion v1 = _$matterbridgeSettingsStopAllBridgesApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<MatterbridgeSettingsStopAllBridgesApiVersion> get values =>
      _$matterbridgeSettingsStopAllBridgesApiVersionValues;
  // coverage:ignore-end

  static MatterbridgeSettingsStopAllBridgesApiVersion valueOf(String name) =>
      _$valueOfMatterbridgeSettingsStopAllBridgesApiVersion(name);

  static Serializer<MatterbridgeSettingsStopAllBridgesApiVersion> get serializer =>
      _$matterbridgeSettingsStopAllBridgesApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeSettingsStopAllBridgesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  bool get data;
}

abstract class MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs
    implements
        $MatterbridgeSettingsStopAllBridgesResponseApplicationJson_OcsInterface,
        Built<MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs,
            MatterbridgeSettingsStopAllBridgesResponseApplicationJson_OcsBuilder> {
  factory MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs([
    void Function(MatterbridgeSettingsStopAllBridgesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs> get serializer =>
      _$matterbridgeSettingsStopAllBridgesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeSettingsStopAllBridgesResponseApplicationJsonInterface {
  MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs get ocs;
}

abstract class MatterbridgeSettingsStopAllBridgesResponseApplicationJson
    implements
        $MatterbridgeSettingsStopAllBridgesResponseApplicationJsonInterface,
        Built<MatterbridgeSettingsStopAllBridgesResponseApplicationJson,
            MatterbridgeSettingsStopAllBridgesResponseApplicationJsonBuilder> {
  factory MatterbridgeSettingsStopAllBridgesResponseApplicationJson([
    void Function(MatterbridgeSettingsStopAllBridgesResponseApplicationJsonBuilder)? b,
  ]) = _$MatterbridgeSettingsStopAllBridgesResponseApplicationJson;

  // coverage:ignore-start
  const MatterbridgeSettingsStopAllBridgesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeSettingsStopAllBridgesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeSettingsStopAllBridgesResponseApplicationJson> get serializer =>
      _$matterbridgeSettingsStopAllBridgesResponseApplicationJsonSerializer;
}

class MatterbridgeSettingsGetMatterbridgeVersionApiVersion extends EnumClass {
  const MatterbridgeSettingsGetMatterbridgeVersionApiVersion._(super.name);

  static const MatterbridgeSettingsGetMatterbridgeVersionApiVersion v1 =
      _$matterbridgeSettingsGetMatterbridgeVersionApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<MatterbridgeSettingsGetMatterbridgeVersionApiVersion> get values =>
      _$matterbridgeSettingsGetMatterbridgeVersionApiVersionValues;
  // coverage:ignore-end

  static MatterbridgeSettingsGetMatterbridgeVersionApiVersion valueOf(String name) =>
      _$valueOfMatterbridgeSettingsGetMatterbridgeVersionApiVersion(name);

  static Serializer<MatterbridgeSettingsGetMatterbridgeVersionApiVersion> get serializer =>
      _$matterbridgeSettingsGetMatterbridgeVersionApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_DataInterface {
  String get version;
}

abstract class MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data
    implements
        $MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_DataInterface,
        Built<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data,
            MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_DataBuilder> {
  factory MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data([
    void Function(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data.fromJson(
    Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data> get serializer =>
      _$matterbridgeSettingsGetMatterbridgeVersionResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data get data;
}

abstract class MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs
    implements
        $MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_OcsInterface,
        Built<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs,
            MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_OcsBuilder> {
  factory MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs([
    void Function(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs> get serializer =>
      _$matterbridgeSettingsGetMatterbridgeVersionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJsonInterface {
  MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs get ocs;
}

abstract class MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson
    implements
        $MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJsonInterface,
        Built<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson,
            MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJsonBuilder> {
  factory MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson([
    void Function(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJsonBuilder)? b,
  ]) = _$MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson;

  // coverage:ignore-start
  const MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson> get serializer =>
      _$matterbridgeSettingsGetMatterbridgeVersionResponseApplicationJsonSerializer;
}

class PollCreatePollApiVersion extends EnumClass {
  const PollCreatePollApiVersion._(super.name);

  static const PollCreatePollApiVersion v1 = _$pollCreatePollApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<PollCreatePollApiVersion> get values => _$pollCreatePollApiVersionValues;
  // coverage:ignore-end

  static PollCreatePollApiVersion valueOf(String name) => _$valueOfPollCreatePollApiVersion(name);

  static Serializer<PollCreatePollApiVersion> get serializer => _$pollCreatePollApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollVoteInterface {
  String get actorDisplayName;
  String get actorId;
  String get actorType;
  int get optionId;
}

abstract class PollVote implements $PollVoteInterface, Built<PollVote, PollVoteBuilder> {
  factory PollVote([void Function(PollVoteBuilder)? b]) = _$PollVote;

  // coverage:ignore-start
  const PollVote._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollVote.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollVote> get serializer => _$pollVoteSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollInterface {
  String get actorDisplayName;
  String get actorId;
  String get actorType;
  BuiltList<PollVote>? get details;
  int get id;
  int get maxVotes;
  int? get numVoters;
  BuiltList<String> get options;
  String get question;
  int get resultMode;
  int get status;
  BuiltList<int>? get votedSelf;
  BuiltMap<String, int>? get votes;
}

abstract class Poll implements $PollInterface, Built<Poll, PollBuilder> {
  factory Poll([void Function(PollBuilder)? b]) = _$Poll;

  // coverage:ignore-start
  const Poll._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Poll.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Poll> get serializer => _$pollSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollCreatePollResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Poll get data;
}

abstract class PollCreatePollResponseApplicationJson_Ocs
    implements
        $PollCreatePollResponseApplicationJson_OcsInterface,
        Built<PollCreatePollResponseApplicationJson_Ocs, PollCreatePollResponseApplicationJson_OcsBuilder> {
  factory PollCreatePollResponseApplicationJson_Ocs([
    void Function(PollCreatePollResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PollCreatePollResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PollCreatePollResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollCreatePollResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollCreatePollResponseApplicationJson_Ocs> get serializer =>
      _$pollCreatePollResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollCreatePollResponseApplicationJsonInterface {
  PollCreatePollResponseApplicationJson_Ocs get ocs;
}

abstract class PollCreatePollResponseApplicationJson
    implements
        $PollCreatePollResponseApplicationJsonInterface,
        Built<PollCreatePollResponseApplicationJson, PollCreatePollResponseApplicationJsonBuilder> {
  factory PollCreatePollResponseApplicationJson([void Function(PollCreatePollResponseApplicationJsonBuilder)? b]) =
      _$PollCreatePollResponseApplicationJson;

  // coverage:ignore-start
  const PollCreatePollResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollCreatePollResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollCreatePollResponseApplicationJson> get serializer =>
      _$pollCreatePollResponseApplicationJsonSerializer;
}

class PollShowPollApiVersion extends EnumClass {
  const PollShowPollApiVersion._(super.name);

  static const PollShowPollApiVersion v1 = _$pollShowPollApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<PollShowPollApiVersion> get values => _$pollShowPollApiVersionValues;
  // coverage:ignore-end

  static PollShowPollApiVersion valueOf(String name) => _$valueOfPollShowPollApiVersion(name);

  static Serializer<PollShowPollApiVersion> get serializer => _$pollShowPollApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollShowPollResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Poll get data;
}

abstract class PollShowPollResponseApplicationJson_Ocs
    implements
        $PollShowPollResponseApplicationJson_OcsInterface,
        Built<PollShowPollResponseApplicationJson_Ocs, PollShowPollResponseApplicationJson_OcsBuilder> {
  factory PollShowPollResponseApplicationJson_Ocs([void Function(PollShowPollResponseApplicationJson_OcsBuilder)? b]) =
      _$PollShowPollResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PollShowPollResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollShowPollResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollShowPollResponseApplicationJson_Ocs> get serializer =>
      _$pollShowPollResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollShowPollResponseApplicationJsonInterface {
  PollShowPollResponseApplicationJson_Ocs get ocs;
}

abstract class PollShowPollResponseApplicationJson
    implements
        $PollShowPollResponseApplicationJsonInterface,
        Built<PollShowPollResponseApplicationJson, PollShowPollResponseApplicationJsonBuilder> {
  factory PollShowPollResponseApplicationJson([void Function(PollShowPollResponseApplicationJsonBuilder)? b]) =
      _$PollShowPollResponseApplicationJson;

  // coverage:ignore-start
  const PollShowPollResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollShowPollResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollShowPollResponseApplicationJson> get serializer =>
      _$pollShowPollResponseApplicationJsonSerializer;
}

class PollVotePollApiVersion extends EnumClass {
  const PollVotePollApiVersion._(super.name);

  static const PollVotePollApiVersion v1 = _$pollVotePollApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<PollVotePollApiVersion> get values => _$pollVotePollApiVersionValues;
  // coverage:ignore-end

  static PollVotePollApiVersion valueOf(String name) => _$valueOfPollVotePollApiVersion(name);

  static Serializer<PollVotePollApiVersion> get serializer => _$pollVotePollApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollVotePollResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Poll get data;
}

abstract class PollVotePollResponseApplicationJson_Ocs
    implements
        $PollVotePollResponseApplicationJson_OcsInterface,
        Built<PollVotePollResponseApplicationJson_Ocs, PollVotePollResponseApplicationJson_OcsBuilder> {
  factory PollVotePollResponseApplicationJson_Ocs([void Function(PollVotePollResponseApplicationJson_OcsBuilder)? b]) =
      _$PollVotePollResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PollVotePollResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollVotePollResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollVotePollResponseApplicationJson_Ocs> get serializer =>
      _$pollVotePollResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollVotePollResponseApplicationJsonInterface {
  PollVotePollResponseApplicationJson_Ocs get ocs;
}

abstract class PollVotePollResponseApplicationJson
    implements
        $PollVotePollResponseApplicationJsonInterface,
        Built<PollVotePollResponseApplicationJson, PollVotePollResponseApplicationJsonBuilder> {
  factory PollVotePollResponseApplicationJson([void Function(PollVotePollResponseApplicationJsonBuilder)? b]) =
      _$PollVotePollResponseApplicationJson;

  // coverage:ignore-start
  const PollVotePollResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollVotePollResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollVotePollResponseApplicationJson> get serializer =>
      _$pollVotePollResponseApplicationJsonSerializer;
}

class PollClosePollApiVersion extends EnumClass {
  const PollClosePollApiVersion._(super.name);

  static const PollClosePollApiVersion v1 = _$pollClosePollApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<PollClosePollApiVersion> get values => _$pollClosePollApiVersionValues;
  // coverage:ignore-end

  static PollClosePollApiVersion valueOf(String name) => _$valueOfPollClosePollApiVersion(name);

  static Serializer<PollClosePollApiVersion> get serializer => _$pollClosePollApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollClosePollResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Poll get data;
}

abstract class PollClosePollResponseApplicationJson_Ocs
    implements
        $PollClosePollResponseApplicationJson_OcsInterface,
        Built<PollClosePollResponseApplicationJson_Ocs, PollClosePollResponseApplicationJson_OcsBuilder> {
  factory PollClosePollResponseApplicationJson_Ocs([
    void Function(PollClosePollResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PollClosePollResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PollClosePollResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollClosePollResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollClosePollResponseApplicationJson_Ocs> get serializer =>
      _$pollClosePollResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PollClosePollResponseApplicationJsonInterface {
  PollClosePollResponseApplicationJson_Ocs get ocs;
}

abstract class PollClosePollResponseApplicationJson
    implements
        $PollClosePollResponseApplicationJsonInterface,
        Built<PollClosePollResponseApplicationJson, PollClosePollResponseApplicationJsonBuilder> {
  factory PollClosePollResponseApplicationJson([void Function(PollClosePollResponseApplicationJsonBuilder)? b]) =
      _$PollClosePollResponseApplicationJson;

  // coverage:ignore-start
  const PollClosePollResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PollClosePollResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PollClosePollResponseApplicationJson> get serializer =>
      _$pollClosePollResponseApplicationJsonSerializer;
}

class PublicShareAuthCreateRoomApiVersion extends EnumClass {
  const PublicShareAuthCreateRoomApiVersion._(super.name);

  static const PublicShareAuthCreateRoomApiVersion v1 = _$publicShareAuthCreateRoomApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<PublicShareAuthCreateRoomApiVersion> get values => _$publicShareAuthCreateRoomApiVersionValues;
  // coverage:ignore-end

  static PublicShareAuthCreateRoomApiVersion valueOf(String name) => _$valueOfPublicShareAuthCreateRoomApiVersion(name);

  static Serializer<PublicShareAuthCreateRoomApiVersion> get serializer =>
      _$publicShareAuthCreateRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicShareAuthCreateRoomResponseApplicationJson_Ocs_DataInterface {
  String get token;
  String get name;
  String get displayName;
}

abstract class PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data
    implements
        $PublicShareAuthCreateRoomResponseApplicationJson_Ocs_DataInterface,
        Built<PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data,
            PublicShareAuthCreateRoomResponseApplicationJson_Ocs_DataBuilder> {
  factory PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data([
    void Function(PublicShareAuthCreateRoomResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data> get serializer =>
      _$publicShareAuthCreateRoomResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicShareAuthCreateRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data get data;
}

abstract class PublicShareAuthCreateRoomResponseApplicationJson_Ocs
    implements
        $PublicShareAuthCreateRoomResponseApplicationJson_OcsInterface,
        Built<PublicShareAuthCreateRoomResponseApplicationJson_Ocs,
            PublicShareAuthCreateRoomResponseApplicationJson_OcsBuilder> {
  factory PublicShareAuthCreateRoomResponseApplicationJson_Ocs([
    void Function(PublicShareAuthCreateRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PublicShareAuthCreateRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PublicShareAuthCreateRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicShareAuthCreateRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicShareAuthCreateRoomResponseApplicationJson_Ocs> get serializer =>
      _$publicShareAuthCreateRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicShareAuthCreateRoomResponseApplicationJsonInterface {
  PublicShareAuthCreateRoomResponseApplicationJson_Ocs get ocs;
}

abstract class PublicShareAuthCreateRoomResponseApplicationJson
    implements
        $PublicShareAuthCreateRoomResponseApplicationJsonInterface,
        Built<PublicShareAuthCreateRoomResponseApplicationJson,
            PublicShareAuthCreateRoomResponseApplicationJsonBuilder> {
  factory PublicShareAuthCreateRoomResponseApplicationJson([
    void Function(PublicShareAuthCreateRoomResponseApplicationJsonBuilder)? b,
  ]) = _$PublicShareAuthCreateRoomResponseApplicationJson;

  // coverage:ignore-start
  const PublicShareAuthCreateRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicShareAuthCreateRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicShareAuthCreateRoomResponseApplicationJson> get serializer =>
      _$publicShareAuthCreateRoomResponseApplicationJsonSerializer;
}

class ReactionGetReactionsApiVersion extends EnumClass {
  const ReactionGetReactionsApiVersion._(super.name);

  static const ReactionGetReactionsApiVersion v1 = _$reactionGetReactionsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ReactionGetReactionsApiVersion> get values => _$reactionGetReactionsApiVersionValues;
  // coverage:ignore-end

  static ReactionGetReactionsApiVersion valueOf(String name) => _$valueOfReactionGetReactionsApiVersion(name);

  static Serializer<ReactionGetReactionsApiVersion> get serializer => _$reactionGetReactionsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReactionInterface {
  String get actorDisplayName;
  String get actorId;
  String get actorType;
  int get timestamp;
}

abstract class Reaction implements $ReactionInterface, Built<Reaction, ReactionBuilder> {
  factory Reaction([void Function(ReactionBuilder)? b]) = _$Reaction;

  // coverage:ignore-start
  const Reaction._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Reaction.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Reaction> get serializer => _$reactionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReactionGetReactionsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, BuiltList<Reaction>> get data;
}

abstract class ReactionGetReactionsResponseApplicationJson_Ocs
    implements
        $ReactionGetReactionsResponseApplicationJson_OcsInterface,
        Built<ReactionGetReactionsResponseApplicationJson_Ocs, ReactionGetReactionsResponseApplicationJson_OcsBuilder> {
  factory ReactionGetReactionsResponseApplicationJson_Ocs([
    void Function(ReactionGetReactionsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReactionGetReactionsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReactionGetReactionsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReactionGetReactionsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReactionGetReactionsResponseApplicationJson_Ocs> get serializer =>
      _$reactionGetReactionsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReactionGetReactionsResponseApplicationJsonInterface {
  ReactionGetReactionsResponseApplicationJson_Ocs get ocs;
}

abstract class ReactionGetReactionsResponseApplicationJson
    implements
        $ReactionGetReactionsResponseApplicationJsonInterface,
        Built<ReactionGetReactionsResponseApplicationJson, ReactionGetReactionsResponseApplicationJsonBuilder> {
  factory ReactionGetReactionsResponseApplicationJson([
    void Function(ReactionGetReactionsResponseApplicationJsonBuilder)? b,
  ]) = _$ReactionGetReactionsResponseApplicationJson;

  // coverage:ignore-start
  const ReactionGetReactionsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReactionGetReactionsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReactionGetReactionsResponseApplicationJson> get serializer =>
      _$reactionGetReactionsResponseApplicationJsonSerializer;
}

class ReactionReactApiVersion extends EnumClass {
  const ReactionReactApiVersion._(super.name);

  static const ReactionReactApiVersion v1 = _$reactionReactApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ReactionReactApiVersion> get values => _$reactionReactApiVersionValues;
  // coverage:ignore-end

  static ReactionReactApiVersion valueOf(String name) => _$valueOfReactionReactApiVersion(name);

  static Serializer<ReactionReactApiVersion> get serializer => _$reactionReactApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReactionReactResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, BuiltList<Reaction>> get data;
}

abstract class ReactionReactResponseApplicationJson_Ocs
    implements
        $ReactionReactResponseApplicationJson_OcsInterface,
        Built<ReactionReactResponseApplicationJson_Ocs, ReactionReactResponseApplicationJson_OcsBuilder> {
  factory ReactionReactResponseApplicationJson_Ocs([
    void Function(ReactionReactResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReactionReactResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReactionReactResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReactionReactResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReactionReactResponseApplicationJson_Ocs> get serializer =>
      _$reactionReactResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReactionReactResponseApplicationJsonInterface {
  ReactionReactResponseApplicationJson_Ocs get ocs;
}

abstract class ReactionReactResponseApplicationJson
    implements
        $ReactionReactResponseApplicationJsonInterface,
        Built<ReactionReactResponseApplicationJson, ReactionReactResponseApplicationJsonBuilder> {
  factory ReactionReactResponseApplicationJson([void Function(ReactionReactResponseApplicationJsonBuilder)? b]) =
      _$ReactionReactResponseApplicationJson;

  // coverage:ignore-start
  const ReactionReactResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReactionReactResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReactionReactResponseApplicationJson> get serializer =>
      _$reactionReactResponseApplicationJsonSerializer;
}

class ReactionDeleteApiVersion extends EnumClass {
  const ReactionDeleteApiVersion._(super.name);

  static const ReactionDeleteApiVersion v1 = _$reactionDeleteApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ReactionDeleteApiVersion> get values => _$reactionDeleteApiVersionValues;
  // coverage:ignore-end

  static ReactionDeleteApiVersion valueOf(String name) => _$valueOfReactionDeleteApiVersion(name);

  static Serializer<ReactionDeleteApiVersion> get serializer => _$reactionDeleteApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReactionDeleteResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, BuiltList<Reaction>> get data;
}

abstract class ReactionDeleteResponseApplicationJson_Ocs
    implements
        $ReactionDeleteResponseApplicationJson_OcsInterface,
        Built<ReactionDeleteResponseApplicationJson_Ocs, ReactionDeleteResponseApplicationJson_OcsBuilder> {
  factory ReactionDeleteResponseApplicationJson_Ocs([
    void Function(ReactionDeleteResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReactionDeleteResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReactionDeleteResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReactionDeleteResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReactionDeleteResponseApplicationJson_Ocs> get serializer =>
      _$reactionDeleteResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReactionDeleteResponseApplicationJsonInterface {
  ReactionDeleteResponseApplicationJson_Ocs get ocs;
}

abstract class ReactionDeleteResponseApplicationJson
    implements
        $ReactionDeleteResponseApplicationJsonInterface,
        Built<ReactionDeleteResponseApplicationJson, ReactionDeleteResponseApplicationJsonBuilder> {
  factory ReactionDeleteResponseApplicationJson([void Function(ReactionDeleteResponseApplicationJsonBuilder)? b]) =
      _$ReactionDeleteResponseApplicationJson;

  // coverage:ignore-start
  const ReactionDeleteResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReactionDeleteResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReactionDeleteResponseApplicationJson> get serializer =>
      _$reactionDeleteResponseApplicationJsonSerializer;
}

class RecordingGetWelcomeMessageApiVersion extends EnumClass {
  const RecordingGetWelcomeMessageApiVersion._(super.name);

  static const RecordingGetWelcomeMessageApiVersion v1 = _$recordingGetWelcomeMessageApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<RecordingGetWelcomeMessageApiVersion> get values => _$recordingGetWelcomeMessageApiVersionValues;
  // coverage:ignore-end

  static RecordingGetWelcomeMessageApiVersion valueOf(String name) =>
      _$valueOfRecordingGetWelcomeMessageApiVersion(name);

  static Serializer<RecordingGetWelcomeMessageApiVersion> get serializer =>
      _$recordingGetWelcomeMessageApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingGetWelcomeMessageResponseApplicationJson_Ocs_DataInterface {
  double get version;
}

abstract class RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data
    implements
        $RecordingGetWelcomeMessageResponseApplicationJson_Ocs_DataInterface,
        Built<RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data,
            RecordingGetWelcomeMessageResponseApplicationJson_Ocs_DataBuilder> {
  factory RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data([
    void Function(RecordingGetWelcomeMessageResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data> get serializer =>
      _$recordingGetWelcomeMessageResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingGetWelcomeMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data get data;
}

abstract class RecordingGetWelcomeMessageResponseApplicationJson_Ocs
    implements
        $RecordingGetWelcomeMessageResponseApplicationJson_OcsInterface,
        Built<RecordingGetWelcomeMessageResponseApplicationJson_Ocs,
            RecordingGetWelcomeMessageResponseApplicationJson_OcsBuilder> {
  factory RecordingGetWelcomeMessageResponseApplicationJson_Ocs([
    void Function(RecordingGetWelcomeMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RecordingGetWelcomeMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RecordingGetWelcomeMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingGetWelcomeMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingGetWelcomeMessageResponseApplicationJson_Ocs> get serializer =>
      _$recordingGetWelcomeMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingGetWelcomeMessageResponseApplicationJsonInterface {
  RecordingGetWelcomeMessageResponseApplicationJson_Ocs get ocs;
}

abstract class RecordingGetWelcomeMessageResponseApplicationJson
    implements
        $RecordingGetWelcomeMessageResponseApplicationJsonInterface,
        Built<RecordingGetWelcomeMessageResponseApplicationJson,
            RecordingGetWelcomeMessageResponseApplicationJsonBuilder> {
  factory RecordingGetWelcomeMessageResponseApplicationJson([
    void Function(RecordingGetWelcomeMessageResponseApplicationJsonBuilder)? b,
  ]) = _$RecordingGetWelcomeMessageResponseApplicationJson;

  // coverage:ignore-start
  const RecordingGetWelcomeMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingGetWelcomeMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingGetWelcomeMessageResponseApplicationJson> get serializer =>
      _$recordingGetWelcomeMessageResponseApplicationJsonSerializer;
}

class RecordingStartApiVersion extends EnumClass {
  const RecordingStartApiVersion._(super.name);

  static const RecordingStartApiVersion v1 = _$recordingStartApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<RecordingStartApiVersion> get values => _$recordingStartApiVersionValues;
  // coverage:ignore-end

  static RecordingStartApiVersion valueOf(String name) => _$valueOfRecordingStartApiVersion(name);

  static Serializer<RecordingStartApiVersion> get serializer => _$recordingStartApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingStartResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RecordingStartResponseApplicationJson_Ocs
    implements
        $RecordingStartResponseApplicationJson_OcsInterface,
        Built<RecordingStartResponseApplicationJson_Ocs, RecordingStartResponseApplicationJson_OcsBuilder> {
  factory RecordingStartResponseApplicationJson_Ocs([
    void Function(RecordingStartResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RecordingStartResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RecordingStartResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingStartResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingStartResponseApplicationJson_Ocs> get serializer =>
      _$recordingStartResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingStartResponseApplicationJsonInterface {
  RecordingStartResponseApplicationJson_Ocs get ocs;
}

abstract class RecordingStartResponseApplicationJson
    implements
        $RecordingStartResponseApplicationJsonInterface,
        Built<RecordingStartResponseApplicationJson, RecordingStartResponseApplicationJsonBuilder> {
  factory RecordingStartResponseApplicationJson([void Function(RecordingStartResponseApplicationJsonBuilder)? b]) =
      _$RecordingStartResponseApplicationJson;

  // coverage:ignore-start
  const RecordingStartResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingStartResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingStartResponseApplicationJson> get serializer =>
      _$recordingStartResponseApplicationJsonSerializer;
}

class RecordingStopApiVersion extends EnumClass {
  const RecordingStopApiVersion._(super.name);

  static const RecordingStopApiVersion v1 = _$recordingStopApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<RecordingStopApiVersion> get values => _$recordingStopApiVersionValues;
  // coverage:ignore-end

  static RecordingStopApiVersion valueOf(String name) => _$valueOfRecordingStopApiVersion(name);

  static Serializer<RecordingStopApiVersion> get serializer => _$recordingStopApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingStopResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RecordingStopResponseApplicationJson_Ocs
    implements
        $RecordingStopResponseApplicationJson_OcsInterface,
        Built<RecordingStopResponseApplicationJson_Ocs, RecordingStopResponseApplicationJson_OcsBuilder> {
  factory RecordingStopResponseApplicationJson_Ocs([
    void Function(RecordingStopResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RecordingStopResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RecordingStopResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingStopResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingStopResponseApplicationJson_Ocs> get serializer =>
      _$recordingStopResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingStopResponseApplicationJsonInterface {
  RecordingStopResponseApplicationJson_Ocs get ocs;
}

abstract class RecordingStopResponseApplicationJson
    implements
        $RecordingStopResponseApplicationJsonInterface,
        Built<RecordingStopResponseApplicationJson, RecordingStopResponseApplicationJsonBuilder> {
  factory RecordingStopResponseApplicationJson([void Function(RecordingStopResponseApplicationJsonBuilder)? b]) =
      _$RecordingStopResponseApplicationJson;

  // coverage:ignore-start
  const RecordingStopResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingStopResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingStopResponseApplicationJson> get serializer =>
      _$recordingStopResponseApplicationJsonSerializer;
}

class RecordingStoreApiVersion extends EnumClass {
  const RecordingStoreApiVersion._(super.name);

  static const RecordingStoreApiVersion v1 = _$recordingStoreApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<RecordingStoreApiVersion> get values => _$recordingStoreApiVersionValues;
  // coverage:ignore-end

  static RecordingStoreApiVersion valueOf(String name) => _$valueOfRecordingStoreApiVersion(name);

  static Serializer<RecordingStoreApiVersion> get serializer => _$recordingStoreApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingStoreResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RecordingStoreResponseApplicationJson_Ocs
    implements
        $RecordingStoreResponseApplicationJson_OcsInterface,
        Built<RecordingStoreResponseApplicationJson_Ocs, RecordingStoreResponseApplicationJson_OcsBuilder> {
  factory RecordingStoreResponseApplicationJson_Ocs([
    void Function(RecordingStoreResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RecordingStoreResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RecordingStoreResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingStoreResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingStoreResponseApplicationJson_Ocs> get serializer =>
      _$recordingStoreResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingStoreResponseApplicationJsonInterface {
  RecordingStoreResponseApplicationJson_Ocs get ocs;
}

abstract class RecordingStoreResponseApplicationJson
    implements
        $RecordingStoreResponseApplicationJsonInterface,
        Built<RecordingStoreResponseApplicationJson, RecordingStoreResponseApplicationJsonBuilder> {
  factory RecordingStoreResponseApplicationJson([void Function(RecordingStoreResponseApplicationJsonBuilder)? b]) =
      _$RecordingStoreResponseApplicationJson;

  // coverage:ignore-start
  const RecordingStoreResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingStoreResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingStoreResponseApplicationJson> get serializer =>
      _$recordingStoreResponseApplicationJsonSerializer;
}

class RecordingNotificationDismissApiVersion extends EnumClass {
  const RecordingNotificationDismissApiVersion._(super.name);

  static const RecordingNotificationDismissApiVersion v1 = _$recordingNotificationDismissApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<RecordingNotificationDismissApiVersion> get values => _$recordingNotificationDismissApiVersionValues;
  // coverage:ignore-end

  static RecordingNotificationDismissApiVersion valueOf(String name) =>
      _$valueOfRecordingNotificationDismissApiVersion(name);

  static Serializer<RecordingNotificationDismissApiVersion> get serializer =>
      _$recordingNotificationDismissApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingNotificationDismissResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RecordingNotificationDismissResponseApplicationJson_Ocs
    implements
        $RecordingNotificationDismissResponseApplicationJson_OcsInterface,
        Built<RecordingNotificationDismissResponseApplicationJson_Ocs,
            RecordingNotificationDismissResponseApplicationJson_OcsBuilder> {
  factory RecordingNotificationDismissResponseApplicationJson_Ocs([
    void Function(RecordingNotificationDismissResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RecordingNotificationDismissResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RecordingNotificationDismissResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingNotificationDismissResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingNotificationDismissResponseApplicationJson_Ocs> get serializer =>
      _$recordingNotificationDismissResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingNotificationDismissResponseApplicationJsonInterface {
  RecordingNotificationDismissResponseApplicationJson_Ocs get ocs;
}

abstract class RecordingNotificationDismissResponseApplicationJson
    implements
        $RecordingNotificationDismissResponseApplicationJsonInterface,
        Built<RecordingNotificationDismissResponseApplicationJson,
            RecordingNotificationDismissResponseApplicationJsonBuilder> {
  factory RecordingNotificationDismissResponseApplicationJson([
    void Function(RecordingNotificationDismissResponseApplicationJsonBuilder)? b,
  ]) = _$RecordingNotificationDismissResponseApplicationJson;

  // coverage:ignore-start
  const RecordingNotificationDismissResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingNotificationDismissResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingNotificationDismissResponseApplicationJson> get serializer =>
      _$recordingNotificationDismissResponseApplicationJsonSerializer;
}

class RecordingShareToChatApiVersion extends EnumClass {
  const RecordingShareToChatApiVersion._(super.name);

  static const RecordingShareToChatApiVersion v1 = _$recordingShareToChatApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<RecordingShareToChatApiVersion> get values => _$recordingShareToChatApiVersionValues;
  // coverage:ignore-end

  static RecordingShareToChatApiVersion valueOf(String name) => _$valueOfRecordingShareToChatApiVersion(name);

  static Serializer<RecordingShareToChatApiVersion> get serializer => _$recordingShareToChatApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingShareToChatResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RecordingShareToChatResponseApplicationJson_Ocs
    implements
        $RecordingShareToChatResponseApplicationJson_OcsInterface,
        Built<RecordingShareToChatResponseApplicationJson_Ocs, RecordingShareToChatResponseApplicationJson_OcsBuilder> {
  factory RecordingShareToChatResponseApplicationJson_Ocs([
    void Function(RecordingShareToChatResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RecordingShareToChatResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RecordingShareToChatResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingShareToChatResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingShareToChatResponseApplicationJson_Ocs> get serializer =>
      _$recordingShareToChatResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RecordingShareToChatResponseApplicationJsonInterface {
  RecordingShareToChatResponseApplicationJson_Ocs get ocs;
}

abstract class RecordingShareToChatResponseApplicationJson
    implements
        $RecordingShareToChatResponseApplicationJsonInterface,
        Built<RecordingShareToChatResponseApplicationJson, RecordingShareToChatResponseApplicationJsonBuilder> {
  factory RecordingShareToChatResponseApplicationJson([
    void Function(RecordingShareToChatResponseApplicationJsonBuilder)? b,
  ]) = _$RecordingShareToChatResponseApplicationJson;

  // coverage:ignore-start
  const RecordingShareToChatResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RecordingShareToChatResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RecordingShareToChatResponseApplicationJson> get serializer =>
      _$recordingShareToChatResponseApplicationJsonSerializer;
}

class RoomGetRoomsApiVersion extends EnumClass {
  const RoomGetRoomsApiVersion._(super.name);

  static const RoomGetRoomsApiVersion v4 = _$roomGetRoomsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomGetRoomsApiVersion> get values => _$roomGetRoomsApiVersionValues;
  // coverage:ignore-end

  static RoomGetRoomsApiVersion valueOf(String name) => _$valueOfRoomGetRoomsApiVersion(name);

  static Serializer<RoomGetRoomsApiVersion> get serializer => _$roomGetRoomsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRoomGetRoomsHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-talk-hash')
  String? get xNextcloudTalkHash;
  @BuiltValueField(wireName: 'x-nextcloud-talk-modified-before')
  String? get xNextcloudTalkModifiedBefore;
}

abstract class RoomRoomGetRoomsHeaders
    implements $RoomRoomGetRoomsHeadersInterface, Built<RoomRoomGetRoomsHeaders, RoomRoomGetRoomsHeadersBuilder> {
  factory RoomRoomGetRoomsHeaders([void Function(RoomRoomGetRoomsHeadersBuilder)? b]) = _$RoomRoomGetRoomsHeaders;

  // coverage:ignore-start
  const RoomRoomGetRoomsHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRoomGetRoomsHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRoomGetRoomsHeaders> get serializer => _$roomRoomGetRoomsHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetRoomsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Room> get data;
}

abstract class RoomGetRoomsResponseApplicationJson_Ocs
    implements
        $RoomGetRoomsResponseApplicationJson_OcsInterface,
        Built<RoomGetRoomsResponseApplicationJson_Ocs, RoomGetRoomsResponseApplicationJson_OcsBuilder> {
  factory RoomGetRoomsResponseApplicationJson_Ocs([void Function(RoomGetRoomsResponseApplicationJson_OcsBuilder)? b]) =
      _$RoomGetRoomsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomGetRoomsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetRoomsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetRoomsResponseApplicationJson_Ocs> get serializer =>
      _$roomGetRoomsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetRoomsResponseApplicationJsonInterface {
  RoomGetRoomsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomGetRoomsResponseApplicationJson
    implements
        $RoomGetRoomsResponseApplicationJsonInterface,
        Built<RoomGetRoomsResponseApplicationJson, RoomGetRoomsResponseApplicationJsonBuilder> {
  factory RoomGetRoomsResponseApplicationJson([void Function(RoomGetRoomsResponseApplicationJsonBuilder)? b]) =
      _$RoomGetRoomsResponseApplicationJson;

  // coverage:ignore-start
  const RoomGetRoomsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetRoomsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetRoomsResponseApplicationJson> get serializer =>
      _$roomGetRoomsResponseApplicationJsonSerializer;
}

class RoomCreateRoomApiVersion extends EnumClass {
  const RoomCreateRoomApiVersion._(super.name);

  static const RoomCreateRoomApiVersion v4 = _$roomCreateRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomCreateRoomApiVersion> get values => _$roomCreateRoomApiVersionValues;
  // coverage:ignore-end

  static RoomCreateRoomApiVersion valueOf(String name) => _$valueOfRoomCreateRoomApiVersion(name);

  static Serializer<RoomCreateRoomApiVersion> get serializer => _$roomCreateRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomCreateRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomCreateRoomResponseApplicationJson_Ocs
    implements
        $RoomCreateRoomResponseApplicationJson_OcsInterface,
        Built<RoomCreateRoomResponseApplicationJson_Ocs, RoomCreateRoomResponseApplicationJson_OcsBuilder> {
  factory RoomCreateRoomResponseApplicationJson_Ocs([
    void Function(RoomCreateRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomCreateRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomCreateRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomCreateRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomCreateRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomCreateRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomCreateRoomResponseApplicationJsonInterface {
  RoomCreateRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomCreateRoomResponseApplicationJson
    implements
        $RoomCreateRoomResponseApplicationJsonInterface,
        Built<RoomCreateRoomResponseApplicationJson, RoomCreateRoomResponseApplicationJsonBuilder> {
  factory RoomCreateRoomResponseApplicationJson([void Function(RoomCreateRoomResponseApplicationJsonBuilder)? b]) =
      _$RoomCreateRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomCreateRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomCreateRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomCreateRoomResponseApplicationJson> get serializer =>
      _$roomCreateRoomResponseApplicationJsonSerializer;
}

class RoomGetListedRoomsApiVersion extends EnumClass {
  const RoomGetListedRoomsApiVersion._(super.name);

  static const RoomGetListedRoomsApiVersion v4 = _$roomGetListedRoomsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomGetListedRoomsApiVersion> get values => _$roomGetListedRoomsApiVersionValues;
  // coverage:ignore-end

  static RoomGetListedRoomsApiVersion valueOf(String name) => _$valueOfRoomGetListedRoomsApiVersion(name);

  static Serializer<RoomGetListedRoomsApiVersion> get serializer => _$roomGetListedRoomsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetListedRoomsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Room> get data;
}

abstract class RoomGetListedRoomsResponseApplicationJson_Ocs
    implements
        $RoomGetListedRoomsResponseApplicationJson_OcsInterface,
        Built<RoomGetListedRoomsResponseApplicationJson_Ocs, RoomGetListedRoomsResponseApplicationJson_OcsBuilder> {
  factory RoomGetListedRoomsResponseApplicationJson_Ocs([
    void Function(RoomGetListedRoomsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomGetListedRoomsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomGetListedRoomsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetListedRoomsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetListedRoomsResponseApplicationJson_Ocs> get serializer =>
      _$roomGetListedRoomsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetListedRoomsResponseApplicationJsonInterface {
  RoomGetListedRoomsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomGetListedRoomsResponseApplicationJson
    implements
        $RoomGetListedRoomsResponseApplicationJsonInterface,
        Built<RoomGetListedRoomsResponseApplicationJson, RoomGetListedRoomsResponseApplicationJsonBuilder> {
  factory RoomGetListedRoomsResponseApplicationJson([
    void Function(RoomGetListedRoomsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomGetListedRoomsResponseApplicationJson;

  // coverage:ignore-start
  const RoomGetListedRoomsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetListedRoomsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetListedRoomsResponseApplicationJson> get serializer =>
      _$roomGetListedRoomsResponseApplicationJsonSerializer;
}

class RoomGetNoteToSelfConversationApiVersion extends EnumClass {
  const RoomGetNoteToSelfConversationApiVersion._(super.name);

  static const RoomGetNoteToSelfConversationApiVersion v4 = _$roomGetNoteToSelfConversationApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomGetNoteToSelfConversationApiVersion> get values =>
      _$roomGetNoteToSelfConversationApiVersionValues;
  // coverage:ignore-end

  static RoomGetNoteToSelfConversationApiVersion valueOf(String name) =>
      _$valueOfRoomGetNoteToSelfConversationApiVersion(name);

  static Serializer<RoomGetNoteToSelfConversationApiVersion> get serializer =>
      _$roomGetNoteToSelfConversationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRoomGetNoteToSelfConversationHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-talk-hash')
  String? get xNextcloudTalkHash;
}

abstract class RoomRoomGetNoteToSelfConversationHeaders
    implements
        $RoomRoomGetNoteToSelfConversationHeadersInterface,
        Built<RoomRoomGetNoteToSelfConversationHeaders, RoomRoomGetNoteToSelfConversationHeadersBuilder> {
  factory RoomRoomGetNoteToSelfConversationHeaders([
    void Function(RoomRoomGetNoteToSelfConversationHeadersBuilder)? b,
  ]) = _$RoomRoomGetNoteToSelfConversationHeaders;

  // coverage:ignore-start
  const RoomRoomGetNoteToSelfConversationHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRoomGetNoteToSelfConversationHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRoomGetNoteToSelfConversationHeaders> get serializer =>
      _$roomRoomGetNoteToSelfConversationHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetNoteToSelfConversationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomGetNoteToSelfConversationResponseApplicationJson_Ocs
    implements
        $RoomGetNoteToSelfConversationResponseApplicationJson_OcsInterface,
        Built<RoomGetNoteToSelfConversationResponseApplicationJson_Ocs,
            RoomGetNoteToSelfConversationResponseApplicationJson_OcsBuilder> {
  factory RoomGetNoteToSelfConversationResponseApplicationJson_Ocs([
    void Function(RoomGetNoteToSelfConversationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomGetNoteToSelfConversationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomGetNoteToSelfConversationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetNoteToSelfConversationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetNoteToSelfConversationResponseApplicationJson_Ocs> get serializer =>
      _$roomGetNoteToSelfConversationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetNoteToSelfConversationResponseApplicationJsonInterface {
  RoomGetNoteToSelfConversationResponseApplicationJson_Ocs get ocs;
}

abstract class RoomGetNoteToSelfConversationResponseApplicationJson
    implements
        $RoomGetNoteToSelfConversationResponseApplicationJsonInterface,
        Built<RoomGetNoteToSelfConversationResponseApplicationJson,
            RoomGetNoteToSelfConversationResponseApplicationJsonBuilder> {
  factory RoomGetNoteToSelfConversationResponseApplicationJson([
    void Function(RoomGetNoteToSelfConversationResponseApplicationJsonBuilder)? b,
  ]) = _$RoomGetNoteToSelfConversationResponseApplicationJson;

  // coverage:ignore-start
  const RoomGetNoteToSelfConversationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetNoteToSelfConversationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetNoteToSelfConversationResponseApplicationJson> get serializer =>
      _$roomGetNoteToSelfConversationResponseApplicationJsonSerializer;
}

class RoomGetSingleRoomApiVersion extends EnumClass {
  const RoomGetSingleRoomApiVersion._(super.name);

  static const RoomGetSingleRoomApiVersion v4 = _$roomGetSingleRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomGetSingleRoomApiVersion> get values => _$roomGetSingleRoomApiVersionValues;
  // coverage:ignore-end

  static RoomGetSingleRoomApiVersion valueOf(String name) => _$valueOfRoomGetSingleRoomApiVersion(name);

  static Serializer<RoomGetSingleRoomApiVersion> get serializer => _$roomGetSingleRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRoomGetSingleRoomHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-talk-hash')
  String? get xNextcloudTalkHash;
}

abstract class RoomRoomGetSingleRoomHeaders
    implements
        $RoomRoomGetSingleRoomHeadersInterface,
        Built<RoomRoomGetSingleRoomHeaders, RoomRoomGetSingleRoomHeadersBuilder> {
  factory RoomRoomGetSingleRoomHeaders([void Function(RoomRoomGetSingleRoomHeadersBuilder)? b]) =
      _$RoomRoomGetSingleRoomHeaders;

  // coverage:ignore-start
  const RoomRoomGetSingleRoomHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRoomGetSingleRoomHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRoomGetSingleRoomHeaders> get serializer => _$roomRoomGetSingleRoomHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetSingleRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomGetSingleRoomResponseApplicationJson_Ocs
    implements
        $RoomGetSingleRoomResponseApplicationJson_OcsInterface,
        Built<RoomGetSingleRoomResponseApplicationJson_Ocs, RoomGetSingleRoomResponseApplicationJson_OcsBuilder> {
  factory RoomGetSingleRoomResponseApplicationJson_Ocs([
    void Function(RoomGetSingleRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomGetSingleRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomGetSingleRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetSingleRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetSingleRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomGetSingleRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetSingleRoomResponseApplicationJsonInterface {
  RoomGetSingleRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomGetSingleRoomResponseApplicationJson
    implements
        $RoomGetSingleRoomResponseApplicationJsonInterface,
        Built<RoomGetSingleRoomResponseApplicationJson, RoomGetSingleRoomResponseApplicationJsonBuilder> {
  factory RoomGetSingleRoomResponseApplicationJson([
    void Function(RoomGetSingleRoomResponseApplicationJsonBuilder)? b,
  ]) = _$RoomGetSingleRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomGetSingleRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetSingleRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetSingleRoomResponseApplicationJson> get serializer =>
      _$roomGetSingleRoomResponseApplicationJsonSerializer;
}

class RoomRenameRoomApiVersion extends EnumClass {
  const RoomRenameRoomApiVersion._(super.name);

  static const RoomRenameRoomApiVersion v4 = _$roomRenameRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomRenameRoomApiVersion> get values => _$roomRenameRoomApiVersionValues;
  // coverage:ignore-end

  static RoomRenameRoomApiVersion valueOf(String name) => _$valueOfRoomRenameRoomApiVersion(name);

  static Serializer<RoomRenameRoomApiVersion> get serializer => _$roomRenameRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRenameRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomRenameRoomResponseApplicationJson_Ocs
    implements
        $RoomRenameRoomResponseApplicationJson_OcsInterface,
        Built<RoomRenameRoomResponseApplicationJson_Ocs, RoomRenameRoomResponseApplicationJson_OcsBuilder> {
  factory RoomRenameRoomResponseApplicationJson_Ocs([
    void Function(RoomRenameRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomRenameRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomRenameRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRenameRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRenameRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomRenameRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRenameRoomResponseApplicationJsonInterface {
  RoomRenameRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomRenameRoomResponseApplicationJson
    implements
        $RoomRenameRoomResponseApplicationJsonInterface,
        Built<RoomRenameRoomResponseApplicationJson, RoomRenameRoomResponseApplicationJsonBuilder> {
  factory RoomRenameRoomResponseApplicationJson([void Function(RoomRenameRoomResponseApplicationJsonBuilder)? b]) =
      _$RoomRenameRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomRenameRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRenameRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRenameRoomResponseApplicationJson> get serializer =>
      _$roomRenameRoomResponseApplicationJsonSerializer;
}

class RoomDeleteRoomApiVersion extends EnumClass {
  const RoomDeleteRoomApiVersion._(super.name);

  static const RoomDeleteRoomApiVersion v4 = _$roomDeleteRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomDeleteRoomApiVersion> get values => _$roomDeleteRoomApiVersionValues;
  // coverage:ignore-end

  static RoomDeleteRoomApiVersion valueOf(String name) => _$valueOfRoomDeleteRoomApiVersion(name);

  static Serializer<RoomDeleteRoomApiVersion> get serializer => _$roomDeleteRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomDeleteRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomDeleteRoomResponseApplicationJson_Ocs
    implements
        $RoomDeleteRoomResponseApplicationJson_OcsInterface,
        Built<RoomDeleteRoomResponseApplicationJson_Ocs, RoomDeleteRoomResponseApplicationJson_OcsBuilder> {
  factory RoomDeleteRoomResponseApplicationJson_Ocs([
    void Function(RoomDeleteRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomDeleteRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomDeleteRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomDeleteRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomDeleteRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomDeleteRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomDeleteRoomResponseApplicationJsonInterface {
  RoomDeleteRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomDeleteRoomResponseApplicationJson
    implements
        $RoomDeleteRoomResponseApplicationJsonInterface,
        Built<RoomDeleteRoomResponseApplicationJson, RoomDeleteRoomResponseApplicationJsonBuilder> {
  factory RoomDeleteRoomResponseApplicationJson([void Function(RoomDeleteRoomResponseApplicationJsonBuilder)? b]) =
      _$RoomDeleteRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomDeleteRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomDeleteRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomDeleteRoomResponseApplicationJson> get serializer =>
      _$roomDeleteRoomResponseApplicationJsonSerializer;
}

class RoomGetBreakoutRoomsApiVersion extends EnumClass {
  const RoomGetBreakoutRoomsApiVersion._(super.name);

  static const RoomGetBreakoutRoomsApiVersion v4 = _$roomGetBreakoutRoomsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomGetBreakoutRoomsApiVersion> get values => _$roomGetBreakoutRoomsApiVersionValues;
  // coverage:ignore-end

  static RoomGetBreakoutRoomsApiVersion valueOf(String name) => _$valueOfRoomGetBreakoutRoomsApiVersion(name);

  static Serializer<RoomGetBreakoutRoomsApiVersion> get serializer => _$roomGetBreakoutRoomsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetBreakoutRoomsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Room> get data;
}

abstract class RoomGetBreakoutRoomsResponseApplicationJson_Ocs
    implements
        $RoomGetBreakoutRoomsResponseApplicationJson_OcsInterface,
        Built<RoomGetBreakoutRoomsResponseApplicationJson_Ocs, RoomGetBreakoutRoomsResponseApplicationJson_OcsBuilder> {
  factory RoomGetBreakoutRoomsResponseApplicationJson_Ocs([
    void Function(RoomGetBreakoutRoomsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomGetBreakoutRoomsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomGetBreakoutRoomsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetBreakoutRoomsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetBreakoutRoomsResponseApplicationJson_Ocs> get serializer =>
      _$roomGetBreakoutRoomsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetBreakoutRoomsResponseApplicationJsonInterface {
  RoomGetBreakoutRoomsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomGetBreakoutRoomsResponseApplicationJson
    implements
        $RoomGetBreakoutRoomsResponseApplicationJsonInterface,
        Built<RoomGetBreakoutRoomsResponseApplicationJson, RoomGetBreakoutRoomsResponseApplicationJsonBuilder> {
  factory RoomGetBreakoutRoomsResponseApplicationJson([
    void Function(RoomGetBreakoutRoomsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomGetBreakoutRoomsResponseApplicationJson;

  // coverage:ignore-start
  const RoomGetBreakoutRoomsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetBreakoutRoomsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetBreakoutRoomsResponseApplicationJson> get serializer =>
      _$roomGetBreakoutRoomsResponseApplicationJsonSerializer;
}

class RoomMakePublicApiVersion extends EnumClass {
  const RoomMakePublicApiVersion._(super.name);

  static const RoomMakePublicApiVersion v4 = _$roomMakePublicApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomMakePublicApiVersion> get values => _$roomMakePublicApiVersionValues;
  // coverage:ignore-end

  static RoomMakePublicApiVersion valueOf(String name) => _$valueOfRoomMakePublicApiVersion(name);

  static Serializer<RoomMakePublicApiVersion> get serializer => _$roomMakePublicApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomMakePublicResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomMakePublicResponseApplicationJson_Ocs
    implements
        $RoomMakePublicResponseApplicationJson_OcsInterface,
        Built<RoomMakePublicResponseApplicationJson_Ocs, RoomMakePublicResponseApplicationJson_OcsBuilder> {
  factory RoomMakePublicResponseApplicationJson_Ocs([
    void Function(RoomMakePublicResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomMakePublicResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomMakePublicResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomMakePublicResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomMakePublicResponseApplicationJson_Ocs> get serializer =>
      _$roomMakePublicResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomMakePublicResponseApplicationJsonInterface {
  RoomMakePublicResponseApplicationJson_Ocs get ocs;
}

abstract class RoomMakePublicResponseApplicationJson
    implements
        $RoomMakePublicResponseApplicationJsonInterface,
        Built<RoomMakePublicResponseApplicationJson, RoomMakePublicResponseApplicationJsonBuilder> {
  factory RoomMakePublicResponseApplicationJson([void Function(RoomMakePublicResponseApplicationJsonBuilder)? b]) =
      _$RoomMakePublicResponseApplicationJson;

  // coverage:ignore-start
  const RoomMakePublicResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomMakePublicResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomMakePublicResponseApplicationJson> get serializer =>
      _$roomMakePublicResponseApplicationJsonSerializer;
}

class RoomMakePrivateApiVersion extends EnumClass {
  const RoomMakePrivateApiVersion._(super.name);

  static const RoomMakePrivateApiVersion v4 = _$roomMakePrivateApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomMakePrivateApiVersion> get values => _$roomMakePrivateApiVersionValues;
  // coverage:ignore-end

  static RoomMakePrivateApiVersion valueOf(String name) => _$valueOfRoomMakePrivateApiVersion(name);

  static Serializer<RoomMakePrivateApiVersion> get serializer => _$roomMakePrivateApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomMakePrivateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomMakePrivateResponseApplicationJson_Ocs
    implements
        $RoomMakePrivateResponseApplicationJson_OcsInterface,
        Built<RoomMakePrivateResponseApplicationJson_Ocs, RoomMakePrivateResponseApplicationJson_OcsBuilder> {
  factory RoomMakePrivateResponseApplicationJson_Ocs([
    void Function(RoomMakePrivateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomMakePrivateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomMakePrivateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomMakePrivateResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomMakePrivateResponseApplicationJson_Ocs> get serializer =>
      _$roomMakePrivateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomMakePrivateResponseApplicationJsonInterface {
  RoomMakePrivateResponseApplicationJson_Ocs get ocs;
}

abstract class RoomMakePrivateResponseApplicationJson
    implements
        $RoomMakePrivateResponseApplicationJsonInterface,
        Built<RoomMakePrivateResponseApplicationJson, RoomMakePrivateResponseApplicationJsonBuilder> {
  factory RoomMakePrivateResponseApplicationJson([void Function(RoomMakePrivateResponseApplicationJsonBuilder)? b]) =
      _$RoomMakePrivateResponseApplicationJson;

  // coverage:ignore-start
  const RoomMakePrivateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomMakePrivateResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomMakePrivateResponseApplicationJson> get serializer =>
      _$roomMakePrivateResponseApplicationJsonSerializer;
}

class RoomSetDescriptionApiVersion extends EnumClass {
  const RoomSetDescriptionApiVersion._(super.name);

  static const RoomSetDescriptionApiVersion v4 = _$roomSetDescriptionApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetDescriptionApiVersion> get values => _$roomSetDescriptionApiVersionValues;
  // coverage:ignore-end

  static RoomSetDescriptionApiVersion valueOf(String name) => _$valueOfRoomSetDescriptionApiVersion(name);

  static Serializer<RoomSetDescriptionApiVersion> get serializer => _$roomSetDescriptionApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetDescriptionResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomSetDescriptionResponseApplicationJson_Ocs
    implements
        $RoomSetDescriptionResponseApplicationJson_OcsInterface,
        Built<RoomSetDescriptionResponseApplicationJson_Ocs, RoomSetDescriptionResponseApplicationJson_OcsBuilder> {
  factory RoomSetDescriptionResponseApplicationJson_Ocs([
    void Function(RoomSetDescriptionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetDescriptionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetDescriptionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetDescriptionResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetDescriptionResponseApplicationJson_Ocs> get serializer =>
      _$roomSetDescriptionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetDescriptionResponseApplicationJsonInterface {
  RoomSetDescriptionResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetDescriptionResponseApplicationJson
    implements
        $RoomSetDescriptionResponseApplicationJsonInterface,
        Built<RoomSetDescriptionResponseApplicationJson, RoomSetDescriptionResponseApplicationJsonBuilder> {
  factory RoomSetDescriptionResponseApplicationJson([
    void Function(RoomSetDescriptionResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetDescriptionResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetDescriptionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetDescriptionResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetDescriptionResponseApplicationJson> get serializer =>
      _$roomSetDescriptionResponseApplicationJsonSerializer;
}

class RoomSetReadOnlyApiVersion extends EnumClass {
  const RoomSetReadOnlyApiVersion._(super.name);

  static const RoomSetReadOnlyApiVersion v4 = _$roomSetReadOnlyApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetReadOnlyApiVersion> get values => _$roomSetReadOnlyApiVersionValues;
  // coverage:ignore-end

  static RoomSetReadOnlyApiVersion valueOf(String name) => _$valueOfRoomSetReadOnlyApiVersion(name);

  static Serializer<RoomSetReadOnlyApiVersion> get serializer => _$roomSetReadOnlyApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetReadOnlyResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomSetReadOnlyResponseApplicationJson_Ocs
    implements
        $RoomSetReadOnlyResponseApplicationJson_OcsInterface,
        Built<RoomSetReadOnlyResponseApplicationJson_Ocs, RoomSetReadOnlyResponseApplicationJson_OcsBuilder> {
  factory RoomSetReadOnlyResponseApplicationJson_Ocs([
    void Function(RoomSetReadOnlyResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetReadOnlyResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetReadOnlyResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetReadOnlyResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetReadOnlyResponseApplicationJson_Ocs> get serializer =>
      _$roomSetReadOnlyResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetReadOnlyResponseApplicationJsonInterface {
  RoomSetReadOnlyResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetReadOnlyResponseApplicationJson
    implements
        $RoomSetReadOnlyResponseApplicationJsonInterface,
        Built<RoomSetReadOnlyResponseApplicationJson, RoomSetReadOnlyResponseApplicationJsonBuilder> {
  factory RoomSetReadOnlyResponseApplicationJson([void Function(RoomSetReadOnlyResponseApplicationJsonBuilder)? b]) =
      _$RoomSetReadOnlyResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetReadOnlyResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetReadOnlyResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetReadOnlyResponseApplicationJson> get serializer =>
      _$roomSetReadOnlyResponseApplicationJsonSerializer;
}

class RoomSetListableApiVersion extends EnumClass {
  const RoomSetListableApiVersion._(super.name);

  static const RoomSetListableApiVersion v4 = _$roomSetListableApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetListableApiVersion> get values => _$roomSetListableApiVersionValues;
  // coverage:ignore-end

  static RoomSetListableApiVersion valueOf(String name) => _$valueOfRoomSetListableApiVersion(name);

  static Serializer<RoomSetListableApiVersion> get serializer => _$roomSetListableApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetListableResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomSetListableResponseApplicationJson_Ocs
    implements
        $RoomSetListableResponseApplicationJson_OcsInterface,
        Built<RoomSetListableResponseApplicationJson_Ocs, RoomSetListableResponseApplicationJson_OcsBuilder> {
  factory RoomSetListableResponseApplicationJson_Ocs([
    void Function(RoomSetListableResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetListableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetListableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetListableResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetListableResponseApplicationJson_Ocs> get serializer =>
      _$roomSetListableResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetListableResponseApplicationJsonInterface {
  RoomSetListableResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetListableResponseApplicationJson
    implements
        $RoomSetListableResponseApplicationJsonInterface,
        Built<RoomSetListableResponseApplicationJson, RoomSetListableResponseApplicationJsonBuilder> {
  factory RoomSetListableResponseApplicationJson([void Function(RoomSetListableResponseApplicationJsonBuilder)? b]) =
      _$RoomSetListableResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetListableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetListableResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetListableResponseApplicationJson> get serializer =>
      _$roomSetListableResponseApplicationJsonSerializer;
}

class RoomSetPasswordApiVersion extends EnumClass {
  const RoomSetPasswordApiVersion._(super.name);

  static const RoomSetPasswordApiVersion v4 = _$roomSetPasswordApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetPasswordApiVersion> get values => _$roomSetPasswordApiVersionValues;
  // coverage:ignore-end

  static RoomSetPasswordApiVersion valueOf(String name) => _$valueOfRoomSetPasswordApiVersion(name);

  static Serializer<RoomSetPasswordApiVersion> get serializer => _$roomSetPasswordApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetPasswordResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomSetPasswordResponseApplicationJson_Ocs
    implements
        $RoomSetPasswordResponseApplicationJson_OcsInterface,
        Built<RoomSetPasswordResponseApplicationJson_Ocs, RoomSetPasswordResponseApplicationJson_OcsBuilder> {
  factory RoomSetPasswordResponseApplicationJson_Ocs([
    void Function(RoomSetPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetPasswordResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetPasswordResponseApplicationJson_Ocs> get serializer =>
      _$roomSetPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetPasswordResponseApplicationJsonInterface {
  RoomSetPasswordResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetPasswordResponseApplicationJson
    implements
        $RoomSetPasswordResponseApplicationJsonInterface,
        Built<RoomSetPasswordResponseApplicationJson, RoomSetPasswordResponseApplicationJsonBuilder> {
  factory RoomSetPasswordResponseApplicationJson([void Function(RoomSetPasswordResponseApplicationJsonBuilder)? b]) =
      _$RoomSetPasswordResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetPasswordResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetPasswordResponseApplicationJson> get serializer =>
      _$roomSetPasswordResponseApplicationJsonSerializer;
}

class RoomSetPermissionsApiVersion extends EnumClass {
  const RoomSetPermissionsApiVersion._(super.name);

  static const RoomSetPermissionsApiVersion v4 = _$roomSetPermissionsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetPermissionsApiVersion> get values => _$roomSetPermissionsApiVersionValues;
  // coverage:ignore-end

  static RoomSetPermissionsApiVersion valueOf(String name) => _$valueOfRoomSetPermissionsApiVersion(name);

  static Serializer<RoomSetPermissionsApiVersion> get serializer => _$roomSetPermissionsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetPermissionsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomSetPermissionsResponseApplicationJson_Ocs
    implements
        $RoomSetPermissionsResponseApplicationJson_OcsInterface,
        Built<RoomSetPermissionsResponseApplicationJson_Ocs, RoomSetPermissionsResponseApplicationJson_OcsBuilder> {
  factory RoomSetPermissionsResponseApplicationJson_Ocs([
    void Function(RoomSetPermissionsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetPermissionsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetPermissionsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetPermissionsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetPermissionsResponseApplicationJson_Ocs> get serializer =>
      _$roomSetPermissionsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetPermissionsResponseApplicationJsonInterface {
  RoomSetPermissionsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetPermissionsResponseApplicationJson
    implements
        $RoomSetPermissionsResponseApplicationJsonInterface,
        Built<RoomSetPermissionsResponseApplicationJson, RoomSetPermissionsResponseApplicationJsonBuilder> {
  factory RoomSetPermissionsResponseApplicationJson([
    void Function(RoomSetPermissionsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetPermissionsResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetPermissionsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetPermissionsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetPermissionsResponseApplicationJson> get serializer =>
      _$roomSetPermissionsResponseApplicationJsonSerializer;
}

class RoomGetParticipantsApiVersion extends EnumClass {
  const RoomGetParticipantsApiVersion._(super.name);

  static const RoomGetParticipantsApiVersion v4 = _$roomGetParticipantsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomGetParticipantsApiVersion> get values => _$roomGetParticipantsApiVersionValues;
  // coverage:ignore-end

  static RoomGetParticipantsApiVersion valueOf(String name) => _$valueOfRoomGetParticipantsApiVersion(name);

  static Serializer<RoomGetParticipantsApiVersion> get serializer => _$roomGetParticipantsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRoomGetParticipantsHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-has-user-statuses')
  Header<bool>? get xNextcloudHasUserStatuses;
}

abstract class RoomRoomGetParticipantsHeaders
    implements
        $RoomRoomGetParticipantsHeadersInterface,
        Built<RoomRoomGetParticipantsHeaders, RoomRoomGetParticipantsHeadersBuilder> {
  factory RoomRoomGetParticipantsHeaders([void Function(RoomRoomGetParticipantsHeadersBuilder)? b]) =
      _$RoomRoomGetParticipantsHeaders;

  // coverage:ignore-start
  const RoomRoomGetParticipantsHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRoomGetParticipantsHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRoomGetParticipantsHeaders> get serializer => _$roomRoomGetParticipantsHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ParticipantInterface {
  String get actorId;
  String get actorType;
  int get attendeeId;
  int get attendeePermissions;
  String get attendeePin;
  String get displayName;
  int get inCall;
  int get lastPing;
  int get participantType;
  int get permissions;
  String get roomToken;
  BuiltList<String> get sessionIds;
  String? get status;
  int? get statusClearAt;
  String? get statusIcon;
  String? get statusMessage;
  String? get phoneNumber;
  String? get callId;
}

abstract class Participant implements $ParticipantInterface, Built<Participant, ParticipantBuilder> {
  factory Participant([void Function(ParticipantBuilder)? b]) = _$Participant;

  // coverage:ignore-start
  const Participant._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Participant.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Participant> get serializer => _$participantSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetParticipantsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Participant> get data;
}

abstract class RoomGetParticipantsResponseApplicationJson_Ocs
    implements
        $RoomGetParticipantsResponseApplicationJson_OcsInterface,
        Built<RoomGetParticipantsResponseApplicationJson_Ocs, RoomGetParticipantsResponseApplicationJson_OcsBuilder> {
  factory RoomGetParticipantsResponseApplicationJson_Ocs([
    void Function(RoomGetParticipantsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomGetParticipantsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomGetParticipantsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetParticipantsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetParticipantsResponseApplicationJson_Ocs> get serializer =>
      _$roomGetParticipantsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetParticipantsResponseApplicationJsonInterface {
  RoomGetParticipantsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomGetParticipantsResponseApplicationJson
    implements
        $RoomGetParticipantsResponseApplicationJsonInterface,
        Built<RoomGetParticipantsResponseApplicationJson, RoomGetParticipantsResponseApplicationJsonBuilder> {
  factory RoomGetParticipantsResponseApplicationJson([
    void Function(RoomGetParticipantsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomGetParticipantsResponseApplicationJson;

  // coverage:ignore-start
  const RoomGetParticipantsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetParticipantsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetParticipantsResponseApplicationJson> get serializer =>
      _$roomGetParticipantsResponseApplicationJsonSerializer;
}

class RoomAddParticipantToRoomApiVersion extends EnumClass {
  const RoomAddParticipantToRoomApiVersion._(super.name);

  static const RoomAddParticipantToRoomApiVersion v4 = _$roomAddParticipantToRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomAddParticipantToRoomApiVersion> get values => _$roomAddParticipantToRoomApiVersionValues;
  // coverage:ignore-end

  static RoomAddParticipantToRoomApiVersion valueOf(String name) => _$valueOfRoomAddParticipantToRoomApiVersion(name);

  static Serializer<RoomAddParticipantToRoomApiVersion> get serializer =>
      _$roomAddParticipantToRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0Interface {
  int get type;
}

abstract class RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0
    implements
        $RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0Interface,
        Built<RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0,
            RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0Builder> {
  factory RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0([
    void Function(RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0Builder)? b,
  ]) = _$RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0;

  // coverage:ignore-start
  const RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0> get serializer =>
      _$roomAddParticipantToRoomResponseApplicationJsonOcsData0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomAddParticipantToRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data get data;
}

abstract class RoomAddParticipantToRoomResponseApplicationJson_Ocs
    implements
        $RoomAddParticipantToRoomResponseApplicationJson_OcsInterface,
        Built<RoomAddParticipantToRoomResponseApplicationJson_Ocs,
            RoomAddParticipantToRoomResponseApplicationJson_OcsBuilder> {
  factory RoomAddParticipantToRoomResponseApplicationJson_Ocs([
    void Function(RoomAddParticipantToRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomAddParticipantToRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomAddParticipantToRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomAddParticipantToRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomAddParticipantToRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomAddParticipantToRoomResponseApplicationJsonOcsSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(RoomAddParticipantToRoomResponseApplicationJson_OcsBuilder b) {
    b.data?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $RoomAddParticipantToRoomResponseApplicationJsonInterface {
  RoomAddParticipantToRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomAddParticipantToRoomResponseApplicationJson
    implements
        $RoomAddParticipantToRoomResponseApplicationJsonInterface,
        Built<RoomAddParticipantToRoomResponseApplicationJson, RoomAddParticipantToRoomResponseApplicationJsonBuilder> {
  factory RoomAddParticipantToRoomResponseApplicationJson([
    void Function(RoomAddParticipantToRoomResponseApplicationJsonBuilder)? b,
  ]) = _$RoomAddParticipantToRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomAddParticipantToRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomAddParticipantToRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomAddParticipantToRoomResponseApplicationJson> get serializer =>
      _$roomAddParticipantToRoomResponseApplicationJsonSerializer;
}

class RoomGetBreakoutRoomParticipantsApiVersion extends EnumClass {
  const RoomGetBreakoutRoomParticipantsApiVersion._(super.name);

  static const RoomGetBreakoutRoomParticipantsApiVersion v4 = _$roomGetBreakoutRoomParticipantsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomGetBreakoutRoomParticipantsApiVersion> get values =>
      _$roomGetBreakoutRoomParticipantsApiVersionValues;
  // coverage:ignore-end

  static RoomGetBreakoutRoomParticipantsApiVersion valueOf(String name) =>
      _$valueOfRoomGetBreakoutRoomParticipantsApiVersion(name);

  static Serializer<RoomGetBreakoutRoomParticipantsApiVersion> get serializer =>
      _$roomGetBreakoutRoomParticipantsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRoomGetBreakoutRoomParticipantsHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-has-user-statuses')
  Header<bool>? get xNextcloudHasUserStatuses;
}

abstract class RoomRoomGetBreakoutRoomParticipantsHeaders
    implements
        $RoomRoomGetBreakoutRoomParticipantsHeadersInterface,
        Built<RoomRoomGetBreakoutRoomParticipantsHeaders, RoomRoomGetBreakoutRoomParticipantsHeadersBuilder> {
  factory RoomRoomGetBreakoutRoomParticipantsHeaders([
    void Function(RoomRoomGetBreakoutRoomParticipantsHeadersBuilder)? b,
  ]) = _$RoomRoomGetBreakoutRoomParticipantsHeaders;

  // coverage:ignore-start
  const RoomRoomGetBreakoutRoomParticipantsHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRoomGetBreakoutRoomParticipantsHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRoomGetBreakoutRoomParticipantsHeaders> get serializer =>
      _$roomRoomGetBreakoutRoomParticipantsHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetBreakoutRoomParticipantsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Participant> get data;
}

abstract class RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs
    implements
        $RoomGetBreakoutRoomParticipantsResponseApplicationJson_OcsInterface,
        Built<RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs,
            RoomGetBreakoutRoomParticipantsResponseApplicationJson_OcsBuilder> {
  factory RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs([
    void Function(RoomGetBreakoutRoomParticipantsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs> get serializer =>
      _$roomGetBreakoutRoomParticipantsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomGetBreakoutRoomParticipantsResponseApplicationJsonInterface {
  RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomGetBreakoutRoomParticipantsResponseApplicationJson
    implements
        $RoomGetBreakoutRoomParticipantsResponseApplicationJsonInterface,
        Built<RoomGetBreakoutRoomParticipantsResponseApplicationJson,
            RoomGetBreakoutRoomParticipantsResponseApplicationJsonBuilder> {
  factory RoomGetBreakoutRoomParticipantsResponseApplicationJson([
    void Function(RoomGetBreakoutRoomParticipantsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomGetBreakoutRoomParticipantsResponseApplicationJson;

  // coverage:ignore-start
  const RoomGetBreakoutRoomParticipantsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomGetBreakoutRoomParticipantsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomGetBreakoutRoomParticipantsResponseApplicationJson> get serializer =>
      _$roomGetBreakoutRoomParticipantsResponseApplicationJsonSerializer;
}

class RoomRemoveSelfFromRoomApiVersion extends EnumClass {
  const RoomRemoveSelfFromRoomApiVersion._(super.name);

  static const RoomRemoveSelfFromRoomApiVersion v4 = _$roomRemoveSelfFromRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomRemoveSelfFromRoomApiVersion> get values => _$roomRemoveSelfFromRoomApiVersionValues;
  // coverage:ignore-end

  static RoomRemoveSelfFromRoomApiVersion valueOf(String name) => _$valueOfRoomRemoveSelfFromRoomApiVersion(name);

  static Serializer<RoomRemoveSelfFromRoomApiVersion> get serializer => _$roomRemoveSelfFromRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRemoveSelfFromRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomRemoveSelfFromRoomResponseApplicationJson_Ocs
    implements
        $RoomRemoveSelfFromRoomResponseApplicationJson_OcsInterface,
        Built<RoomRemoveSelfFromRoomResponseApplicationJson_Ocs,
            RoomRemoveSelfFromRoomResponseApplicationJson_OcsBuilder> {
  factory RoomRemoveSelfFromRoomResponseApplicationJson_Ocs([
    void Function(RoomRemoveSelfFromRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomRemoveSelfFromRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomRemoveSelfFromRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRemoveSelfFromRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRemoveSelfFromRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomRemoveSelfFromRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRemoveSelfFromRoomResponseApplicationJsonInterface {
  RoomRemoveSelfFromRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomRemoveSelfFromRoomResponseApplicationJson
    implements
        $RoomRemoveSelfFromRoomResponseApplicationJsonInterface,
        Built<RoomRemoveSelfFromRoomResponseApplicationJson, RoomRemoveSelfFromRoomResponseApplicationJsonBuilder> {
  factory RoomRemoveSelfFromRoomResponseApplicationJson([
    void Function(RoomRemoveSelfFromRoomResponseApplicationJsonBuilder)? b,
  ]) = _$RoomRemoveSelfFromRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomRemoveSelfFromRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRemoveSelfFromRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRemoveSelfFromRoomResponseApplicationJson> get serializer =>
      _$roomRemoveSelfFromRoomResponseApplicationJsonSerializer;
}

class RoomRemoveAttendeeFromRoomApiVersion extends EnumClass {
  const RoomRemoveAttendeeFromRoomApiVersion._(super.name);

  static const RoomRemoveAttendeeFromRoomApiVersion v4 = _$roomRemoveAttendeeFromRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomRemoveAttendeeFromRoomApiVersion> get values => _$roomRemoveAttendeeFromRoomApiVersionValues;
  // coverage:ignore-end

  static RoomRemoveAttendeeFromRoomApiVersion valueOf(String name) =>
      _$valueOfRoomRemoveAttendeeFromRoomApiVersion(name);

  static Serializer<RoomRemoveAttendeeFromRoomApiVersion> get serializer =>
      _$roomRemoveAttendeeFromRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRemoveAttendeeFromRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs
    implements
        $RoomRemoveAttendeeFromRoomResponseApplicationJson_OcsInterface,
        Built<RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs,
            RoomRemoveAttendeeFromRoomResponseApplicationJson_OcsBuilder> {
  factory RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs([
    void Function(RoomRemoveAttendeeFromRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomRemoveAttendeeFromRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRemoveAttendeeFromRoomResponseApplicationJsonInterface {
  RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomRemoveAttendeeFromRoomResponseApplicationJson
    implements
        $RoomRemoveAttendeeFromRoomResponseApplicationJsonInterface,
        Built<RoomRemoveAttendeeFromRoomResponseApplicationJson,
            RoomRemoveAttendeeFromRoomResponseApplicationJsonBuilder> {
  factory RoomRemoveAttendeeFromRoomResponseApplicationJson([
    void Function(RoomRemoveAttendeeFromRoomResponseApplicationJsonBuilder)? b,
  ]) = _$RoomRemoveAttendeeFromRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomRemoveAttendeeFromRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRemoveAttendeeFromRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRemoveAttendeeFromRoomResponseApplicationJson> get serializer =>
      _$roomRemoveAttendeeFromRoomResponseApplicationJsonSerializer;
}

class RoomSetAttendeePermissionsApiVersion extends EnumClass {
  const RoomSetAttendeePermissionsApiVersion._(super.name);

  static const RoomSetAttendeePermissionsApiVersion v4 = _$roomSetAttendeePermissionsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetAttendeePermissionsApiVersion> get values => _$roomSetAttendeePermissionsApiVersionValues;
  // coverage:ignore-end

  static RoomSetAttendeePermissionsApiVersion valueOf(String name) =>
      _$valueOfRoomSetAttendeePermissionsApiVersion(name);

  static Serializer<RoomSetAttendeePermissionsApiVersion> get serializer =>
      _$roomSetAttendeePermissionsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetAttendeePermissionsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomSetAttendeePermissionsResponseApplicationJson_Ocs
    implements
        $RoomSetAttendeePermissionsResponseApplicationJson_OcsInterface,
        Built<RoomSetAttendeePermissionsResponseApplicationJson_Ocs,
            RoomSetAttendeePermissionsResponseApplicationJson_OcsBuilder> {
  factory RoomSetAttendeePermissionsResponseApplicationJson_Ocs([
    void Function(RoomSetAttendeePermissionsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetAttendeePermissionsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetAttendeePermissionsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetAttendeePermissionsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetAttendeePermissionsResponseApplicationJson_Ocs> get serializer =>
      _$roomSetAttendeePermissionsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetAttendeePermissionsResponseApplicationJsonInterface {
  RoomSetAttendeePermissionsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetAttendeePermissionsResponseApplicationJson
    implements
        $RoomSetAttendeePermissionsResponseApplicationJsonInterface,
        Built<RoomSetAttendeePermissionsResponseApplicationJson,
            RoomSetAttendeePermissionsResponseApplicationJsonBuilder> {
  factory RoomSetAttendeePermissionsResponseApplicationJson([
    void Function(RoomSetAttendeePermissionsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetAttendeePermissionsResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetAttendeePermissionsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetAttendeePermissionsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetAttendeePermissionsResponseApplicationJson> get serializer =>
      _$roomSetAttendeePermissionsResponseApplicationJsonSerializer;
}

class RoomSetAllAttendeesPermissionsApiVersion extends EnumClass {
  const RoomSetAllAttendeesPermissionsApiVersion._(super.name);

  static const RoomSetAllAttendeesPermissionsApiVersion v4 = _$roomSetAllAttendeesPermissionsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetAllAttendeesPermissionsApiVersion> get values =>
      _$roomSetAllAttendeesPermissionsApiVersionValues;
  // coverage:ignore-end

  static RoomSetAllAttendeesPermissionsApiVersion valueOf(String name) =>
      _$valueOfRoomSetAllAttendeesPermissionsApiVersion(name);

  static Serializer<RoomSetAllAttendeesPermissionsApiVersion> get serializer =>
      _$roomSetAllAttendeesPermissionsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetAllAttendeesPermissionsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs
    implements
        $RoomSetAllAttendeesPermissionsResponseApplicationJson_OcsInterface,
        Built<RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs,
            RoomSetAllAttendeesPermissionsResponseApplicationJson_OcsBuilder> {
  factory RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs([
    void Function(RoomSetAllAttendeesPermissionsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs> get serializer =>
      _$roomSetAllAttendeesPermissionsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetAllAttendeesPermissionsResponseApplicationJsonInterface {
  RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetAllAttendeesPermissionsResponseApplicationJson
    implements
        $RoomSetAllAttendeesPermissionsResponseApplicationJsonInterface,
        Built<RoomSetAllAttendeesPermissionsResponseApplicationJson,
            RoomSetAllAttendeesPermissionsResponseApplicationJsonBuilder> {
  factory RoomSetAllAttendeesPermissionsResponseApplicationJson([
    void Function(RoomSetAllAttendeesPermissionsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetAllAttendeesPermissionsResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetAllAttendeesPermissionsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetAllAttendeesPermissionsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetAllAttendeesPermissionsResponseApplicationJson> get serializer =>
      _$roomSetAllAttendeesPermissionsResponseApplicationJsonSerializer;
}

class RoomJoinRoomApiVersion extends EnumClass {
  const RoomJoinRoomApiVersion._(super.name);

  static const RoomJoinRoomApiVersion v4 = _$roomJoinRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomJoinRoomApiVersion> get values => _$roomJoinRoomApiVersionValues;
  // coverage:ignore-end

  static RoomJoinRoomApiVersion valueOf(String name) => _$valueOfRoomJoinRoomApiVersion(name);

  static Serializer<RoomJoinRoomApiVersion> get serializer => _$roomJoinRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomJoinRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomJoinRoomResponseApplicationJson_Ocs
    implements
        $RoomJoinRoomResponseApplicationJson_OcsInterface,
        Built<RoomJoinRoomResponseApplicationJson_Ocs, RoomJoinRoomResponseApplicationJson_OcsBuilder> {
  factory RoomJoinRoomResponseApplicationJson_Ocs([void Function(RoomJoinRoomResponseApplicationJson_OcsBuilder)? b]) =
      _$RoomJoinRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomJoinRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomJoinRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomJoinRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomJoinRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomJoinRoomResponseApplicationJsonInterface {
  RoomJoinRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomJoinRoomResponseApplicationJson
    implements
        $RoomJoinRoomResponseApplicationJsonInterface,
        Built<RoomJoinRoomResponseApplicationJson, RoomJoinRoomResponseApplicationJsonBuilder> {
  factory RoomJoinRoomResponseApplicationJson([void Function(RoomJoinRoomResponseApplicationJsonBuilder)? b]) =
      _$RoomJoinRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomJoinRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomJoinRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomJoinRoomResponseApplicationJson> get serializer =>
      _$roomJoinRoomResponseApplicationJsonSerializer;
}

class RoomLeaveRoomApiVersion extends EnumClass {
  const RoomLeaveRoomApiVersion._(super.name);

  static const RoomLeaveRoomApiVersion v4 = _$roomLeaveRoomApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomLeaveRoomApiVersion> get values => _$roomLeaveRoomApiVersionValues;
  // coverage:ignore-end

  static RoomLeaveRoomApiVersion valueOf(String name) => _$valueOfRoomLeaveRoomApiVersion(name);

  static Serializer<RoomLeaveRoomApiVersion> get serializer => _$roomLeaveRoomApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomLeaveRoomResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomLeaveRoomResponseApplicationJson_Ocs
    implements
        $RoomLeaveRoomResponseApplicationJson_OcsInterface,
        Built<RoomLeaveRoomResponseApplicationJson_Ocs, RoomLeaveRoomResponseApplicationJson_OcsBuilder> {
  factory RoomLeaveRoomResponseApplicationJson_Ocs([
    void Function(RoomLeaveRoomResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomLeaveRoomResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomLeaveRoomResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomLeaveRoomResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomLeaveRoomResponseApplicationJson_Ocs> get serializer =>
      _$roomLeaveRoomResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomLeaveRoomResponseApplicationJsonInterface {
  RoomLeaveRoomResponseApplicationJson_Ocs get ocs;
}

abstract class RoomLeaveRoomResponseApplicationJson
    implements
        $RoomLeaveRoomResponseApplicationJsonInterface,
        Built<RoomLeaveRoomResponseApplicationJson, RoomLeaveRoomResponseApplicationJsonBuilder> {
  factory RoomLeaveRoomResponseApplicationJson([void Function(RoomLeaveRoomResponseApplicationJsonBuilder)? b]) =
      _$RoomLeaveRoomResponseApplicationJson;

  // coverage:ignore-start
  const RoomLeaveRoomResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomLeaveRoomResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomLeaveRoomResponseApplicationJson> get serializer =>
      _$roomLeaveRoomResponseApplicationJsonSerializer;
}

class RoomResendInvitationsApiVersion extends EnumClass {
  const RoomResendInvitationsApiVersion._(super.name);

  static const RoomResendInvitationsApiVersion v4 = _$roomResendInvitationsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomResendInvitationsApiVersion> get values => _$roomResendInvitationsApiVersionValues;
  // coverage:ignore-end

  static RoomResendInvitationsApiVersion valueOf(String name) => _$valueOfRoomResendInvitationsApiVersion(name);

  static Serializer<RoomResendInvitationsApiVersion> get serializer => _$roomResendInvitationsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomResendInvitationsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomResendInvitationsResponseApplicationJson_Ocs
    implements
        $RoomResendInvitationsResponseApplicationJson_OcsInterface,
        Built<RoomResendInvitationsResponseApplicationJson_Ocs,
            RoomResendInvitationsResponseApplicationJson_OcsBuilder> {
  factory RoomResendInvitationsResponseApplicationJson_Ocs([
    void Function(RoomResendInvitationsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomResendInvitationsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomResendInvitationsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomResendInvitationsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomResendInvitationsResponseApplicationJson_Ocs> get serializer =>
      _$roomResendInvitationsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomResendInvitationsResponseApplicationJsonInterface {
  RoomResendInvitationsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomResendInvitationsResponseApplicationJson
    implements
        $RoomResendInvitationsResponseApplicationJsonInterface,
        Built<RoomResendInvitationsResponseApplicationJson, RoomResendInvitationsResponseApplicationJsonBuilder> {
  factory RoomResendInvitationsResponseApplicationJson([
    void Function(RoomResendInvitationsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomResendInvitationsResponseApplicationJson;

  // coverage:ignore-start
  const RoomResendInvitationsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomResendInvitationsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomResendInvitationsResponseApplicationJson> get serializer =>
      _$roomResendInvitationsResponseApplicationJsonSerializer;
}

class RoomSetSessionStateApiVersion extends EnumClass {
  const RoomSetSessionStateApiVersion._(super.name);

  static const RoomSetSessionStateApiVersion v4 = _$roomSetSessionStateApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetSessionStateApiVersion> get values => _$roomSetSessionStateApiVersionValues;
  // coverage:ignore-end

  static RoomSetSessionStateApiVersion valueOf(String name) => _$valueOfRoomSetSessionStateApiVersion(name);

  static Serializer<RoomSetSessionStateApiVersion> get serializer => _$roomSetSessionStateApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetSessionStateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomSetSessionStateResponseApplicationJson_Ocs
    implements
        $RoomSetSessionStateResponseApplicationJson_OcsInterface,
        Built<RoomSetSessionStateResponseApplicationJson_Ocs, RoomSetSessionStateResponseApplicationJson_OcsBuilder> {
  factory RoomSetSessionStateResponseApplicationJson_Ocs([
    void Function(RoomSetSessionStateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetSessionStateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetSessionStateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetSessionStateResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetSessionStateResponseApplicationJson_Ocs> get serializer =>
      _$roomSetSessionStateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetSessionStateResponseApplicationJsonInterface {
  RoomSetSessionStateResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetSessionStateResponseApplicationJson
    implements
        $RoomSetSessionStateResponseApplicationJsonInterface,
        Built<RoomSetSessionStateResponseApplicationJson, RoomSetSessionStateResponseApplicationJsonBuilder> {
  factory RoomSetSessionStateResponseApplicationJson([
    void Function(RoomSetSessionStateResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetSessionStateResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetSessionStateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetSessionStateResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetSessionStateResponseApplicationJson> get serializer =>
      _$roomSetSessionStateResponseApplicationJsonSerializer;
}

class RoomPromoteModeratorApiVersion extends EnumClass {
  const RoomPromoteModeratorApiVersion._(super.name);

  static const RoomPromoteModeratorApiVersion v4 = _$roomPromoteModeratorApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomPromoteModeratorApiVersion> get values => _$roomPromoteModeratorApiVersionValues;
  // coverage:ignore-end

  static RoomPromoteModeratorApiVersion valueOf(String name) => _$valueOfRoomPromoteModeratorApiVersion(name);

  static Serializer<RoomPromoteModeratorApiVersion> get serializer => _$roomPromoteModeratorApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomPromoteModeratorResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomPromoteModeratorResponseApplicationJson_Ocs
    implements
        $RoomPromoteModeratorResponseApplicationJson_OcsInterface,
        Built<RoomPromoteModeratorResponseApplicationJson_Ocs, RoomPromoteModeratorResponseApplicationJson_OcsBuilder> {
  factory RoomPromoteModeratorResponseApplicationJson_Ocs([
    void Function(RoomPromoteModeratorResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomPromoteModeratorResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomPromoteModeratorResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomPromoteModeratorResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomPromoteModeratorResponseApplicationJson_Ocs> get serializer =>
      _$roomPromoteModeratorResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomPromoteModeratorResponseApplicationJsonInterface {
  RoomPromoteModeratorResponseApplicationJson_Ocs get ocs;
}

abstract class RoomPromoteModeratorResponseApplicationJson
    implements
        $RoomPromoteModeratorResponseApplicationJsonInterface,
        Built<RoomPromoteModeratorResponseApplicationJson, RoomPromoteModeratorResponseApplicationJsonBuilder> {
  factory RoomPromoteModeratorResponseApplicationJson([
    void Function(RoomPromoteModeratorResponseApplicationJsonBuilder)? b,
  ]) = _$RoomPromoteModeratorResponseApplicationJson;

  // coverage:ignore-start
  const RoomPromoteModeratorResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomPromoteModeratorResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomPromoteModeratorResponseApplicationJson> get serializer =>
      _$roomPromoteModeratorResponseApplicationJsonSerializer;
}

class RoomDemoteModeratorApiVersion extends EnumClass {
  const RoomDemoteModeratorApiVersion._(super.name);

  static const RoomDemoteModeratorApiVersion v4 = _$roomDemoteModeratorApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomDemoteModeratorApiVersion> get values => _$roomDemoteModeratorApiVersionValues;
  // coverage:ignore-end

  static RoomDemoteModeratorApiVersion valueOf(String name) => _$valueOfRoomDemoteModeratorApiVersion(name);

  static Serializer<RoomDemoteModeratorApiVersion> get serializer => _$roomDemoteModeratorApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomDemoteModeratorResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomDemoteModeratorResponseApplicationJson_Ocs
    implements
        $RoomDemoteModeratorResponseApplicationJson_OcsInterface,
        Built<RoomDemoteModeratorResponseApplicationJson_Ocs, RoomDemoteModeratorResponseApplicationJson_OcsBuilder> {
  factory RoomDemoteModeratorResponseApplicationJson_Ocs([
    void Function(RoomDemoteModeratorResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomDemoteModeratorResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomDemoteModeratorResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomDemoteModeratorResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomDemoteModeratorResponseApplicationJson_Ocs> get serializer =>
      _$roomDemoteModeratorResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomDemoteModeratorResponseApplicationJsonInterface {
  RoomDemoteModeratorResponseApplicationJson_Ocs get ocs;
}

abstract class RoomDemoteModeratorResponseApplicationJson
    implements
        $RoomDemoteModeratorResponseApplicationJsonInterface,
        Built<RoomDemoteModeratorResponseApplicationJson, RoomDemoteModeratorResponseApplicationJsonBuilder> {
  factory RoomDemoteModeratorResponseApplicationJson([
    void Function(RoomDemoteModeratorResponseApplicationJsonBuilder)? b,
  ]) = _$RoomDemoteModeratorResponseApplicationJson;

  // coverage:ignore-start
  const RoomDemoteModeratorResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomDemoteModeratorResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomDemoteModeratorResponseApplicationJson> get serializer =>
      _$roomDemoteModeratorResponseApplicationJsonSerializer;
}

class RoomAddToFavoritesApiVersion extends EnumClass {
  const RoomAddToFavoritesApiVersion._(super.name);

  static const RoomAddToFavoritesApiVersion v4 = _$roomAddToFavoritesApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomAddToFavoritesApiVersion> get values => _$roomAddToFavoritesApiVersionValues;
  // coverage:ignore-end

  static RoomAddToFavoritesApiVersion valueOf(String name) => _$valueOfRoomAddToFavoritesApiVersion(name);

  static Serializer<RoomAddToFavoritesApiVersion> get serializer => _$roomAddToFavoritesApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomAddToFavoritesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomAddToFavoritesResponseApplicationJson_Ocs
    implements
        $RoomAddToFavoritesResponseApplicationJson_OcsInterface,
        Built<RoomAddToFavoritesResponseApplicationJson_Ocs, RoomAddToFavoritesResponseApplicationJson_OcsBuilder> {
  factory RoomAddToFavoritesResponseApplicationJson_Ocs([
    void Function(RoomAddToFavoritesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomAddToFavoritesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomAddToFavoritesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomAddToFavoritesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomAddToFavoritesResponseApplicationJson_Ocs> get serializer =>
      _$roomAddToFavoritesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomAddToFavoritesResponseApplicationJsonInterface {
  RoomAddToFavoritesResponseApplicationJson_Ocs get ocs;
}

abstract class RoomAddToFavoritesResponseApplicationJson
    implements
        $RoomAddToFavoritesResponseApplicationJsonInterface,
        Built<RoomAddToFavoritesResponseApplicationJson, RoomAddToFavoritesResponseApplicationJsonBuilder> {
  factory RoomAddToFavoritesResponseApplicationJson([
    void Function(RoomAddToFavoritesResponseApplicationJsonBuilder)? b,
  ]) = _$RoomAddToFavoritesResponseApplicationJson;

  // coverage:ignore-start
  const RoomAddToFavoritesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomAddToFavoritesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomAddToFavoritesResponseApplicationJson> get serializer =>
      _$roomAddToFavoritesResponseApplicationJsonSerializer;
}

class RoomRemoveFromFavoritesApiVersion extends EnumClass {
  const RoomRemoveFromFavoritesApiVersion._(super.name);

  static const RoomRemoveFromFavoritesApiVersion v4 = _$roomRemoveFromFavoritesApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomRemoveFromFavoritesApiVersion> get values => _$roomRemoveFromFavoritesApiVersionValues;
  // coverage:ignore-end

  static RoomRemoveFromFavoritesApiVersion valueOf(String name) => _$valueOfRoomRemoveFromFavoritesApiVersion(name);

  static Serializer<RoomRemoveFromFavoritesApiVersion> get serializer => _$roomRemoveFromFavoritesApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRemoveFromFavoritesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomRemoveFromFavoritesResponseApplicationJson_Ocs
    implements
        $RoomRemoveFromFavoritesResponseApplicationJson_OcsInterface,
        Built<RoomRemoveFromFavoritesResponseApplicationJson_Ocs,
            RoomRemoveFromFavoritesResponseApplicationJson_OcsBuilder> {
  factory RoomRemoveFromFavoritesResponseApplicationJson_Ocs([
    void Function(RoomRemoveFromFavoritesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomRemoveFromFavoritesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomRemoveFromFavoritesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRemoveFromFavoritesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRemoveFromFavoritesResponseApplicationJson_Ocs> get serializer =>
      _$roomRemoveFromFavoritesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomRemoveFromFavoritesResponseApplicationJsonInterface {
  RoomRemoveFromFavoritesResponseApplicationJson_Ocs get ocs;
}

abstract class RoomRemoveFromFavoritesResponseApplicationJson
    implements
        $RoomRemoveFromFavoritesResponseApplicationJsonInterface,
        Built<RoomRemoveFromFavoritesResponseApplicationJson, RoomRemoveFromFavoritesResponseApplicationJsonBuilder> {
  factory RoomRemoveFromFavoritesResponseApplicationJson([
    void Function(RoomRemoveFromFavoritesResponseApplicationJsonBuilder)? b,
  ]) = _$RoomRemoveFromFavoritesResponseApplicationJson;

  // coverage:ignore-start
  const RoomRemoveFromFavoritesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomRemoveFromFavoritesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomRemoveFromFavoritesResponseApplicationJson> get serializer =>
      _$roomRemoveFromFavoritesResponseApplicationJsonSerializer;
}

class RoomSetNotificationLevelApiVersion extends EnumClass {
  const RoomSetNotificationLevelApiVersion._(super.name);

  static const RoomSetNotificationLevelApiVersion v4 = _$roomSetNotificationLevelApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetNotificationLevelApiVersion> get values => _$roomSetNotificationLevelApiVersionValues;
  // coverage:ignore-end

  static RoomSetNotificationLevelApiVersion valueOf(String name) => _$valueOfRoomSetNotificationLevelApiVersion(name);

  static Serializer<RoomSetNotificationLevelApiVersion> get serializer =>
      _$roomSetNotificationLevelApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetNotificationLevelResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomSetNotificationLevelResponseApplicationJson_Ocs
    implements
        $RoomSetNotificationLevelResponseApplicationJson_OcsInterface,
        Built<RoomSetNotificationLevelResponseApplicationJson_Ocs,
            RoomSetNotificationLevelResponseApplicationJson_OcsBuilder> {
  factory RoomSetNotificationLevelResponseApplicationJson_Ocs([
    void Function(RoomSetNotificationLevelResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetNotificationLevelResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetNotificationLevelResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetNotificationLevelResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetNotificationLevelResponseApplicationJson_Ocs> get serializer =>
      _$roomSetNotificationLevelResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetNotificationLevelResponseApplicationJsonInterface {
  RoomSetNotificationLevelResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetNotificationLevelResponseApplicationJson
    implements
        $RoomSetNotificationLevelResponseApplicationJsonInterface,
        Built<RoomSetNotificationLevelResponseApplicationJson, RoomSetNotificationLevelResponseApplicationJsonBuilder> {
  factory RoomSetNotificationLevelResponseApplicationJson([
    void Function(RoomSetNotificationLevelResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetNotificationLevelResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetNotificationLevelResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetNotificationLevelResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetNotificationLevelResponseApplicationJson> get serializer =>
      _$roomSetNotificationLevelResponseApplicationJsonSerializer;
}

class RoomSetNotificationCallsApiVersion extends EnumClass {
  const RoomSetNotificationCallsApiVersion._(super.name);

  static const RoomSetNotificationCallsApiVersion v4 = _$roomSetNotificationCallsApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetNotificationCallsApiVersion> get values => _$roomSetNotificationCallsApiVersionValues;
  // coverage:ignore-end

  static RoomSetNotificationCallsApiVersion valueOf(String name) => _$valueOfRoomSetNotificationCallsApiVersion(name);

  static Serializer<RoomSetNotificationCallsApiVersion> get serializer =>
      _$roomSetNotificationCallsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetNotificationCallsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomSetNotificationCallsResponseApplicationJson_Ocs
    implements
        $RoomSetNotificationCallsResponseApplicationJson_OcsInterface,
        Built<RoomSetNotificationCallsResponseApplicationJson_Ocs,
            RoomSetNotificationCallsResponseApplicationJson_OcsBuilder> {
  factory RoomSetNotificationCallsResponseApplicationJson_Ocs([
    void Function(RoomSetNotificationCallsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetNotificationCallsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetNotificationCallsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetNotificationCallsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetNotificationCallsResponseApplicationJson_Ocs> get serializer =>
      _$roomSetNotificationCallsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetNotificationCallsResponseApplicationJsonInterface {
  RoomSetNotificationCallsResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetNotificationCallsResponseApplicationJson
    implements
        $RoomSetNotificationCallsResponseApplicationJsonInterface,
        Built<RoomSetNotificationCallsResponseApplicationJson, RoomSetNotificationCallsResponseApplicationJsonBuilder> {
  factory RoomSetNotificationCallsResponseApplicationJson([
    void Function(RoomSetNotificationCallsResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetNotificationCallsResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetNotificationCallsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetNotificationCallsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetNotificationCallsResponseApplicationJson> get serializer =>
      _$roomSetNotificationCallsResponseApplicationJsonSerializer;
}

class RoomSetLobbyApiVersion extends EnumClass {
  const RoomSetLobbyApiVersion._(super.name);

  static const RoomSetLobbyApiVersion v4 = _$roomSetLobbyApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetLobbyApiVersion> get values => _$roomSetLobbyApiVersionValues;
  // coverage:ignore-end

  static RoomSetLobbyApiVersion valueOf(String name) => _$valueOfRoomSetLobbyApiVersion(name);

  static Serializer<RoomSetLobbyApiVersion> get serializer => _$roomSetLobbyApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetLobbyResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomSetLobbyResponseApplicationJson_Ocs
    implements
        $RoomSetLobbyResponseApplicationJson_OcsInterface,
        Built<RoomSetLobbyResponseApplicationJson_Ocs, RoomSetLobbyResponseApplicationJson_OcsBuilder> {
  factory RoomSetLobbyResponseApplicationJson_Ocs([void Function(RoomSetLobbyResponseApplicationJson_OcsBuilder)? b]) =
      _$RoomSetLobbyResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetLobbyResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetLobbyResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetLobbyResponseApplicationJson_Ocs> get serializer =>
      _$roomSetLobbyResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetLobbyResponseApplicationJsonInterface {
  RoomSetLobbyResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetLobbyResponseApplicationJson
    implements
        $RoomSetLobbyResponseApplicationJsonInterface,
        Built<RoomSetLobbyResponseApplicationJson, RoomSetLobbyResponseApplicationJsonBuilder> {
  factory RoomSetLobbyResponseApplicationJson([void Function(RoomSetLobbyResponseApplicationJsonBuilder)? b]) =
      _$RoomSetLobbyResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetLobbyResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetLobbyResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetLobbyResponseApplicationJson> get serializer =>
      _$roomSetLobbyResponseApplicationJsonSerializer;
}

class RoomSetsipEnabledApiVersion extends EnumClass {
  const RoomSetsipEnabledApiVersion._(super.name);

  static const RoomSetsipEnabledApiVersion v4 = _$roomSetsipEnabledApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetsipEnabledApiVersion> get values => _$roomSetsipEnabledApiVersionValues;
  // coverage:ignore-end

  static RoomSetsipEnabledApiVersion valueOf(String name) => _$valueOfRoomSetsipEnabledApiVersion(name);

  static Serializer<RoomSetsipEnabledApiVersion> get serializer => _$roomSetsipEnabledApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetsipEnabledResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomSetsipEnabledResponseApplicationJson_Ocs
    implements
        $RoomSetsipEnabledResponseApplicationJson_OcsInterface,
        Built<RoomSetsipEnabledResponseApplicationJson_Ocs, RoomSetsipEnabledResponseApplicationJson_OcsBuilder> {
  factory RoomSetsipEnabledResponseApplicationJson_Ocs([
    void Function(RoomSetsipEnabledResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetsipEnabledResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetsipEnabledResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetsipEnabledResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetsipEnabledResponseApplicationJson_Ocs> get serializer =>
      _$roomSetsipEnabledResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetsipEnabledResponseApplicationJsonInterface {
  RoomSetsipEnabledResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetsipEnabledResponseApplicationJson
    implements
        $RoomSetsipEnabledResponseApplicationJsonInterface,
        Built<RoomSetsipEnabledResponseApplicationJson, RoomSetsipEnabledResponseApplicationJsonBuilder> {
  factory RoomSetsipEnabledResponseApplicationJson([
    void Function(RoomSetsipEnabledResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetsipEnabledResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetsipEnabledResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetsipEnabledResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetsipEnabledResponseApplicationJson> get serializer =>
      _$roomSetsipEnabledResponseApplicationJsonSerializer;
}

class RoomSetRecordingConsentApiVersion extends EnumClass {
  const RoomSetRecordingConsentApiVersion._(super.name);

  static const RoomSetRecordingConsentApiVersion v4 = _$roomSetRecordingConsentApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetRecordingConsentApiVersion> get values => _$roomSetRecordingConsentApiVersionValues;
  // coverage:ignore-end

  static RoomSetRecordingConsentApiVersion valueOf(String name) => _$valueOfRoomSetRecordingConsentApiVersion(name);

  static Serializer<RoomSetRecordingConsentApiVersion> get serializer => _$roomSetRecordingConsentApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetRecordingConsentResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Room get data;
}

abstract class RoomSetRecordingConsentResponseApplicationJson_Ocs
    implements
        $RoomSetRecordingConsentResponseApplicationJson_OcsInterface,
        Built<RoomSetRecordingConsentResponseApplicationJson_Ocs,
            RoomSetRecordingConsentResponseApplicationJson_OcsBuilder> {
  factory RoomSetRecordingConsentResponseApplicationJson_Ocs([
    void Function(RoomSetRecordingConsentResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetRecordingConsentResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetRecordingConsentResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetRecordingConsentResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetRecordingConsentResponseApplicationJson_Ocs> get serializer =>
      _$roomSetRecordingConsentResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetRecordingConsentResponseApplicationJsonInterface {
  RoomSetRecordingConsentResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetRecordingConsentResponseApplicationJson
    implements
        $RoomSetRecordingConsentResponseApplicationJsonInterface,
        Built<RoomSetRecordingConsentResponseApplicationJson, RoomSetRecordingConsentResponseApplicationJsonBuilder> {
  factory RoomSetRecordingConsentResponseApplicationJson([
    void Function(RoomSetRecordingConsentResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetRecordingConsentResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetRecordingConsentResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetRecordingConsentResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetRecordingConsentResponseApplicationJson> get serializer =>
      _$roomSetRecordingConsentResponseApplicationJsonSerializer;
}

class RoomSetMessageExpirationApiVersion extends EnumClass {
  const RoomSetMessageExpirationApiVersion._(super.name);

  static const RoomSetMessageExpirationApiVersion v4 = _$roomSetMessageExpirationApiVersionV4;

  // coverage:ignore-start
  static BuiltSet<RoomSetMessageExpirationApiVersion> get values => _$roomSetMessageExpirationApiVersionValues;
  // coverage:ignore-end

  static RoomSetMessageExpirationApiVersion valueOf(String name) => _$valueOfRoomSetMessageExpirationApiVersion(name);

  static Serializer<RoomSetMessageExpirationApiVersion> get serializer =>
      _$roomSetMessageExpirationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetMessageExpirationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RoomSetMessageExpirationResponseApplicationJson_Ocs
    implements
        $RoomSetMessageExpirationResponseApplicationJson_OcsInterface,
        Built<RoomSetMessageExpirationResponseApplicationJson_Ocs,
            RoomSetMessageExpirationResponseApplicationJson_OcsBuilder> {
  factory RoomSetMessageExpirationResponseApplicationJson_Ocs([
    void Function(RoomSetMessageExpirationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RoomSetMessageExpirationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RoomSetMessageExpirationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetMessageExpirationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetMessageExpirationResponseApplicationJson_Ocs> get serializer =>
      _$roomSetMessageExpirationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RoomSetMessageExpirationResponseApplicationJsonInterface {
  RoomSetMessageExpirationResponseApplicationJson_Ocs get ocs;
}

abstract class RoomSetMessageExpirationResponseApplicationJson
    implements
        $RoomSetMessageExpirationResponseApplicationJsonInterface,
        Built<RoomSetMessageExpirationResponseApplicationJson, RoomSetMessageExpirationResponseApplicationJsonBuilder> {
  factory RoomSetMessageExpirationResponseApplicationJson([
    void Function(RoomSetMessageExpirationResponseApplicationJsonBuilder)? b,
  ]) = _$RoomSetMessageExpirationResponseApplicationJson;

  // coverage:ignore-start
  const RoomSetMessageExpirationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RoomSetMessageExpirationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RoomSetMessageExpirationResponseApplicationJson> get serializer =>
      _$roomSetMessageExpirationResponseApplicationJsonSerializer;
}

class SettingsSetsipSettingsApiVersion extends EnumClass {
  const SettingsSetsipSettingsApiVersion._(super.name);

  static const SettingsSetsipSettingsApiVersion v1 = _$settingsSetsipSettingsApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<SettingsSetsipSettingsApiVersion> get values => _$settingsSetsipSettingsApiVersionValues;
  // coverage:ignore-end

  static SettingsSetsipSettingsApiVersion valueOf(String name) => _$valueOfSettingsSetsipSettingsApiVersion(name);

  static Serializer<SettingsSetsipSettingsApiVersion> get serializer => _$settingsSetsipSettingsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsSetsipSettingsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class SettingsSetsipSettingsResponseApplicationJson_Ocs
    implements
        $SettingsSetsipSettingsResponseApplicationJson_OcsInterface,
        Built<SettingsSetsipSettingsResponseApplicationJson_Ocs,
            SettingsSetsipSettingsResponseApplicationJson_OcsBuilder> {
  factory SettingsSetsipSettingsResponseApplicationJson_Ocs([
    void Function(SettingsSetsipSettingsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SettingsSetsipSettingsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SettingsSetsipSettingsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsSetsipSettingsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SettingsSetsipSettingsResponseApplicationJson_Ocs> get serializer =>
      _$settingsSetsipSettingsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsSetsipSettingsResponseApplicationJsonInterface {
  SettingsSetsipSettingsResponseApplicationJson_Ocs get ocs;
}

abstract class SettingsSetsipSettingsResponseApplicationJson
    implements
        $SettingsSetsipSettingsResponseApplicationJsonInterface,
        Built<SettingsSetsipSettingsResponseApplicationJson, SettingsSetsipSettingsResponseApplicationJsonBuilder> {
  factory SettingsSetsipSettingsResponseApplicationJson([
    void Function(SettingsSetsipSettingsResponseApplicationJsonBuilder)? b,
  ]) = _$SettingsSetsipSettingsResponseApplicationJson;

  // coverage:ignore-start
  const SettingsSetsipSettingsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsSetsipSettingsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SettingsSetsipSettingsResponseApplicationJson> get serializer =>
      _$settingsSetsipSettingsResponseApplicationJsonSerializer;
}

class SettingsSetUserSettingApiVersion extends EnumClass {
  const SettingsSetUserSettingApiVersion._(super.name);

  static const SettingsSetUserSettingApiVersion v1 = _$settingsSetUserSettingApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<SettingsSetUserSettingApiVersion> get values => _$settingsSetUserSettingApiVersionValues;
  // coverage:ignore-end

  static SettingsSetUserSettingApiVersion valueOf(String name) => _$valueOfSettingsSetUserSettingApiVersion(name);

  static Serializer<SettingsSetUserSettingApiVersion> get serializer => _$settingsSetUserSettingApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsSetUserSettingResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class SettingsSetUserSettingResponseApplicationJson_Ocs
    implements
        $SettingsSetUserSettingResponseApplicationJson_OcsInterface,
        Built<SettingsSetUserSettingResponseApplicationJson_Ocs,
            SettingsSetUserSettingResponseApplicationJson_OcsBuilder> {
  factory SettingsSetUserSettingResponseApplicationJson_Ocs([
    void Function(SettingsSetUserSettingResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SettingsSetUserSettingResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SettingsSetUserSettingResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsSetUserSettingResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SettingsSetUserSettingResponseApplicationJson_Ocs> get serializer =>
      _$settingsSetUserSettingResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsSetUserSettingResponseApplicationJsonInterface {
  SettingsSetUserSettingResponseApplicationJson_Ocs get ocs;
}

abstract class SettingsSetUserSettingResponseApplicationJson
    implements
        $SettingsSetUserSettingResponseApplicationJsonInterface,
        Built<SettingsSetUserSettingResponseApplicationJson, SettingsSetUserSettingResponseApplicationJsonBuilder> {
  factory SettingsSetUserSettingResponseApplicationJson([
    void Function(SettingsSetUserSettingResponseApplicationJsonBuilder)? b,
  ]) = _$SettingsSetUserSettingResponseApplicationJson;

  // coverage:ignore-start
  const SettingsSetUserSettingResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsSetUserSettingResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SettingsSetUserSettingResponseApplicationJson> get serializer =>
      _$settingsSetUserSettingResponseApplicationJsonSerializer;
}

class SignalingGetSettingsApiVersion extends EnumClass {
  const SignalingGetSettingsApiVersion._(super.name);

  static const SignalingGetSettingsApiVersion v3 = _$signalingGetSettingsApiVersionV3;

  // coverage:ignore-start
  static BuiltSet<SignalingGetSettingsApiVersion> get values => _$signalingGetSettingsApiVersionValues;
  // coverage:ignore-end

  static SignalingGetSettingsApiVersion valueOf(String name) => _$valueOfSignalingGetSettingsApiVersion(name);

  static Serializer<SignalingGetSettingsApiVersion> get serializer => _$signalingGetSettingsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSettings_HelloAuthParams_$10Interface {
  String? get userid;
  String get ticket;
}

abstract class SignalingSettings_HelloAuthParams_$10
    implements
        $SignalingSettings_HelloAuthParams_$10Interface,
        Built<SignalingSettings_HelloAuthParams_$10, SignalingSettings_HelloAuthParams_$10Builder> {
  factory SignalingSettings_HelloAuthParams_$10([void Function(SignalingSettings_HelloAuthParams_$10Builder)? b]) =
      _$SignalingSettings_HelloAuthParams_$10;

  // coverage:ignore-start
  const SignalingSettings_HelloAuthParams_$10._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSettings_HelloAuthParams_$10.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSettings_HelloAuthParams_$10> get serializer =>
      _$signalingSettingsHelloAuthParams$10Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSettings_HelloAuthParams_$20Interface {
  String get token;
}

abstract class SignalingSettings_HelloAuthParams_$20
    implements
        $SignalingSettings_HelloAuthParams_$20Interface,
        Built<SignalingSettings_HelloAuthParams_$20, SignalingSettings_HelloAuthParams_$20Builder> {
  factory SignalingSettings_HelloAuthParams_$20([void Function(SignalingSettings_HelloAuthParams_$20Builder)? b]) =
      _$SignalingSettings_HelloAuthParams_$20;

  // coverage:ignore-start
  const SignalingSettings_HelloAuthParams_$20._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSettings_HelloAuthParams_$20.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSettings_HelloAuthParams_$20> get serializer =>
      _$signalingSettingsHelloAuthParams$20Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSettings_HelloAuthParamsInterface {
  @BuiltValueField(wireName: '1.0')
  SignalingSettings_HelloAuthParams_$10 get $10;
  @BuiltValueField(wireName: '2.0')
  SignalingSettings_HelloAuthParams_$20 get $20;
}

abstract class SignalingSettings_HelloAuthParams
    implements
        $SignalingSettings_HelloAuthParamsInterface,
        Built<SignalingSettings_HelloAuthParams, SignalingSettings_HelloAuthParamsBuilder> {
  factory SignalingSettings_HelloAuthParams([void Function(SignalingSettings_HelloAuthParamsBuilder)? b]) =
      _$SignalingSettings_HelloAuthParams;

  // coverage:ignore-start
  const SignalingSettings_HelloAuthParams._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSettings_HelloAuthParams.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSettings_HelloAuthParams> get serializer => _$signalingSettingsHelloAuthParamsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSettings_StunserversInterface {
  BuiltList<String> get urls;
}

abstract class SignalingSettings_Stunservers
    implements
        $SignalingSettings_StunserversInterface,
        Built<SignalingSettings_Stunservers, SignalingSettings_StunserversBuilder> {
  factory SignalingSettings_Stunservers([void Function(SignalingSettings_StunserversBuilder)? b]) =
      _$SignalingSettings_Stunservers;

  // coverage:ignore-start
  const SignalingSettings_Stunservers._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSettings_Stunservers.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSettings_Stunservers> get serializer => _$signalingSettingsStunserversSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSettings_TurnserversInterface {
  BuiltList<String> get urls;
  String get username;
  JsonObject get credential;
}

abstract class SignalingSettings_Turnservers
    implements
        $SignalingSettings_TurnserversInterface,
        Built<SignalingSettings_Turnservers, SignalingSettings_TurnserversBuilder> {
  factory SignalingSettings_Turnservers([void Function(SignalingSettings_TurnserversBuilder)? b]) =
      _$SignalingSettings_Turnservers;

  // coverage:ignore-start
  const SignalingSettings_Turnservers._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSettings_Turnservers.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSettings_Turnservers> get serializer => _$signalingSettingsTurnserversSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSettingsInterface {
  SignalingSettings_HelloAuthParams get helloAuthParams;
  bool get hideWarning;
  String get server;
  String get signalingMode;
  String get sipDialinInfo;
  BuiltList<SignalingSettings_Stunservers> get stunservers;
  String get ticket;
  BuiltList<SignalingSettings_Turnservers> get turnservers;
  String? get userId;
}

abstract class SignalingSettings
    implements $SignalingSettingsInterface, Built<SignalingSettings, SignalingSettingsBuilder> {
  factory SignalingSettings([void Function(SignalingSettingsBuilder)? b]) = _$SignalingSettings;

  // coverage:ignore-start
  const SignalingSettings._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSettings.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSettings> get serializer => _$signalingSettingsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingGetSettingsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  SignalingSettings get data;
}

abstract class SignalingGetSettingsResponseApplicationJson_Ocs
    implements
        $SignalingGetSettingsResponseApplicationJson_OcsInterface,
        Built<SignalingGetSettingsResponseApplicationJson_Ocs, SignalingGetSettingsResponseApplicationJson_OcsBuilder> {
  factory SignalingGetSettingsResponseApplicationJson_Ocs([
    void Function(SignalingGetSettingsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SignalingGetSettingsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SignalingGetSettingsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingGetSettingsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingGetSettingsResponseApplicationJson_Ocs> get serializer =>
      _$signalingGetSettingsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingGetSettingsResponseApplicationJsonInterface {
  SignalingGetSettingsResponseApplicationJson_Ocs get ocs;
}

abstract class SignalingGetSettingsResponseApplicationJson
    implements
        $SignalingGetSettingsResponseApplicationJsonInterface,
        Built<SignalingGetSettingsResponseApplicationJson, SignalingGetSettingsResponseApplicationJsonBuilder> {
  factory SignalingGetSettingsResponseApplicationJson([
    void Function(SignalingGetSettingsResponseApplicationJsonBuilder)? b,
  ]) = _$SignalingGetSettingsResponseApplicationJson;

  // coverage:ignore-start
  const SignalingGetSettingsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingGetSettingsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingGetSettingsResponseApplicationJson> get serializer =>
      _$signalingGetSettingsResponseApplicationJsonSerializer;
}

class SignalingGetWelcomeMessageApiVersion extends EnumClass {
  const SignalingGetWelcomeMessageApiVersion._(super.name);

  static const SignalingGetWelcomeMessageApiVersion v3 = _$signalingGetWelcomeMessageApiVersionV3;

  // coverage:ignore-start
  static BuiltSet<SignalingGetWelcomeMessageApiVersion> get values => _$signalingGetWelcomeMessageApiVersionValues;
  // coverage:ignore-end

  static SignalingGetWelcomeMessageApiVersion valueOf(String name) =>
      _$valueOfSignalingGetWelcomeMessageApiVersion(name);

  static Serializer<SignalingGetWelcomeMessageApiVersion> get serializer =>
      _$signalingGetWelcomeMessageApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingGetWelcomeMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, JsonObject> get data;
}

abstract class SignalingGetWelcomeMessageResponseApplicationJson_Ocs
    implements
        $SignalingGetWelcomeMessageResponseApplicationJson_OcsInterface,
        Built<SignalingGetWelcomeMessageResponseApplicationJson_Ocs,
            SignalingGetWelcomeMessageResponseApplicationJson_OcsBuilder> {
  factory SignalingGetWelcomeMessageResponseApplicationJson_Ocs([
    void Function(SignalingGetWelcomeMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SignalingGetWelcomeMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SignalingGetWelcomeMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingGetWelcomeMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingGetWelcomeMessageResponseApplicationJson_Ocs> get serializer =>
      _$signalingGetWelcomeMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingGetWelcomeMessageResponseApplicationJsonInterface {
  SignalingGetWelcomeMessageResponseApplicationJson_Ocs get ocs;
}

abstract class SignalingGetWelcomeMessageResponseApplicationJson
    implements
        $SignalingGetWelcomeMessageResponseApplicationJsonInterface,
        Built<SignalingGetWelcomeMessageResponseApplicationJson,
            SignalingGetWelcomeMessageResponseApplicationJsonBuilder> {
  factory SignalingGetWelcomeMessageResponseApplicationJson([
    void Function(SignalingGetWelcomeMessageResponseApplicationJsonBuilder)? b,
  ]) = _$SignalingGetWelcomeMessageResponseApplicationJson;

  // coverage:ignore-start
  const SignalingGetWelcomeMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingGetWelcomeMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingGetWelcomeMessageResponseApplicationJson> get serializer =>
      _$signalingGetWelcomeMessageResponseApplicationJsonSerializer;
}

class SignalingPullMessagesApiVersion extends EnumClass {
  const SignalingPullMessagesApiVersion._(super.name);

  static const SignalingPullMessagesApiVersion v3 = _$signalingPullMessagesApiVersionV3;

  // coverage:ignore-start
  static BuiltSet<SignalingPullMessagesApiVersion> get values => _$signalingPullMessagesApiVersionValues;
  // coverage:ignore-end

  static SignalingPullMessagesApiVersion valueOf(String name) => _$valueOfSignalingPullMessagesApiVersion(name);

  static Serializer<SignalingPullMessagesApiVersion> get serializer => _$signalingPullMessagesApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSessionInterface {
  int get inCall;
  int get lastPing;
  int get participantPermissions;
  int get roomId;
  String get sessionId;
  String get userId;
}

abstract class SignalingSession
    implements $SignalingSessionInterface, Built<SignalingSession, SignalingSessionBuilder> {
  factory SignalingSession([void Function(SignalingSessionBuilder)? b]) = _$SignalingSession;

  // coverage:ignore-start
  const SignalingSession._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSession.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSession> get serializer => _$signalingSessionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingPullMessagesResponseApplicationJson_Ocs_DataInterface {
  String get type;
  SignalingPullMessagesResponseApplicationJson_Ocs_Data_Data get data;
}

abstract class SignalingPullMessagesResponseApplicationJson_Ocs_Data
    implements
        $SignalingPullMessagesResponseApplicationJson_Ocs_DataInterface,
        Built<SignalingPullMessagesResponseApplicationJson_Ocs_Data,
            SignalingPullMessagesResponseApplicationJson_Ocs_DataBuilder> {
  factory SignalingPullMessagesResponseApplicationJson_Ocs_Data([
    void Function(SignalingPullMessagesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$SignalingPullMessagesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const SignalingPullMessagesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingPullMessagesResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingPullMessagesResponseApplicationJson_Ocs_Data> get serializer =>
      _$signalingPullMessagesResponseApplicationJsonOcsDataSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(SignalingPullMessagesResponseApplicationJson_Ocs_DataBuilder b) {
    b.data?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingPullMessagesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<SignalingPullMessagesResponseApplicationJson_Ocs_Data> get data;
}

abstract class SignalingPullMessagesResponseApplicationJson_Ocs
    implements
        $SignalingPullMessagesResponseApplicationJson_OcsInterface,
        Built<SignalingPullMessagesResponseApplicationJson_Ocs,
            SignalingPullMessagesResponseApplicationJson_OcsBuilder> {
  factory SignalingPullMessagesResponseApplicationJson_Ocs([
    void Function(SignalingPullMessagesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SignalingPullMessagesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SignalingPullMessagesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingPullMessagesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingPullMessagesResponseApplicationJson_Ocs> get serializer =>
      _$signalingPullMessagesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingPullMessagesResponseApplicationJsonInterface {
  SignalingPullMessagesResponseApplicationJson_Ocs get ocs;
}

abstract class SignalingPullMessagesResponseApplicationJson
    implements
        $SignalingPullMessagesResponseApplicationJsonInterface,
        Built<SignalingPullMessagesResponseApplicationJson, SignalingPullMessagesResponseApplicationJsonBuilder> {
  factory SignalingPullMessagesResponseApplicationJson([
    void Function(SignalingPullMessagesResponseApplicationJsonBuilder)? b,
  ]) = _$SignalingPullMessagesResponseApplicationJson;

  // coverage:ignore-start
  const SignalingPullMessagesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingPullMessagesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingPullMessagesResponseApplicationJson> get serializer =>
      _$signalingPullMessagesResponseApplicationJsonSerializer;
}

class SignalingSendMessagesApiVersion extends EnumClass {
  const SignalingSendMessagesApiVersion._(super.name);

  static const SignalingSendMessagesApiVersion v3 = _$signalingSendMessagesApiVersionV3;

  // coverage:ignore-start
  static BuiltSet<SignalingSendMessagesApiVersion> get values => _$signalingSendMessagesApiVersionValues;
  // coverage:ignore-end

  static SignalingSendMessagesApiVersion valueOf(String name) => _$valueOfSignalingSendMessagesApiVersion(name);

  static Serializer<SignalingSendMessagesApiVersion> get serializer => _$signalingSendMessagesApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSendMessagesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class SignalingSendMessagesResponseApplicationJson_Ocs
    implements
        $SignalingSendMessagesResponseApplicationJson_OcsInterface,
        Built<SignalingSendMessagesResponseApplicationJson_Ocs,
            SignalingSendMessagesResponseApplicationJson_OcsBuilder> {
  factory SignalingSendMessagesResponseApplicationJson_Ocs([
    void Function(SignalingSendMessagesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SignalingSendMessagesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SignalingSendMessagesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSendMessagesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSendMessagesResponseApplicationJson_Ocs> get serializer =>
      _$signalingSendMessagesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SignalingSendMessagesResponseApplicationJsonInterface {
  SignalingSendMessagesResponseApplicationJson_Ocs get ocs;
}

abstract class SignalingSendMessagesResponseApplicationJson
    implements
        $SignalingSendMessagesResponseApplicationJsonInterface,
        Built<SignalingSendMessagesResponseApplicationJson, SignalingSendMessagesResponseApplicationJsonBuilder> {
  factory SignalingSendMessagesResponseApplicationJson([
    void Function(SignalingSendMessagesResponseApplicationJsonBuilder)? b,
  ]) = _$SignalingSendMessagesResponseApplicationJson;

  // coverage:ignore-start
  const SignalingSendMessagesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SignalingSendMessagesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SignalingSendMessagesResponseApplicationJson> get serializer =>
      _$signalingSendMessagesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TempAvatarPostAvatarResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class TempAvatarPostAvatarResponseApplicationJson_Ocs
    implements
        $TempAvatarPostAvatarResponseApplicationJson_OcsInterface,
        Built<TempAvatarPostAvatarResponseApplicationJson_Ocs, TempAvatarPostAvatarResponseApplicationJson_OcsBuilder> {
  factory TempAvatarPostAvatarResponseApplicationJson_Ocs([
    void Function(TempAvatarPostAvatarResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TempAvatarPostAvatarResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TempAvatarPostAvatarResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TempAvatarPostAvatarResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TempAvatarPostAvatarResponseApplicationJson_Ocs> get serializer =>
      _$tempAvatarPostAvatarResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TempAvatarPostAvatarResponseApplicationJsonInterface {
  TempAvatarPostAvatarResponseApplicationJson_Ocs get ocs;
}

abstract class TempAvatarPostAvatarResponseApplicationJson
    implements
        $TempAvatarPostAvatarResponseApplicationJsonInterface,
        Built<TempAvatarPostAvatarResponseApplicationJson, TempAvatarPostAvatarResponseApplicationJsonBuilder> {
  factory TempAvatarPostAvatarResponseApplicationJson([
    void Function(TempAvatarPostAvatarResponseApplicationJsonBuilder)? b,
  ]) = _$TempAvatarPostAvatarResponseApplicationJson;

  // coverage:ignore-start
  const TempAvatarPostAvatarResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TempAvatarPostAvatarResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TempAvatarPostAvatarResponseApplicationJson> get serializer =>
      _$tempAvatarPostAvatarResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TempAvatarDeleteAvatarResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class TempAvatarDeleteAvatarResponseApplicationJson_Ocs
    implements
        $TempAvatarDeleteAvatarResponseApplicationJson_OcsInterface,
        Built<TempAvatarDeleteAvatarResponseApplicationJson_Ocs,
            TempAvatarDeleteAvatarResponseApplicationJson_OcsBuilder> {
  factory TempAvatarDeleteAvatarResponseApplicationJson_Ocs([
    void Function(TempAvatarDeleteAvatarResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TempAvatarDeleteAvatarResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TempAvatarDeleteAvatarResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TempAvatarDeleteAvatarResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TempAvatarDeleteAvatarResponseApplicationJson_Ocs> get serializer =>
      _$tempAvatarDeleteAvatarResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TempAvatarDeleteAvatarResponseApplicationJsonInterface {
  TempAvatarDeleteAvatarResponseApplicationJson_Ocs get ocs;
}

abstract class TempAvatarDeleteAvatarResponseApplicationJson
    implements
        $TempAvatarDeleteAvatarResponseApplicationJsonInterface,
        Built<TempAvatarDeleteAvatarResponseApplicationJson, TempAvatarDeleteAvatarResponseApplicationJsonBuilder> {
  factory TempAvatarDeleteAvatarResponseApplicationJson([
    void Function(TempAvatarDeleteAvatarResponseApplicationJsonBuilder)? b,
  ]) = _$TempAvatarDeleteAvatarResponseApplicationJson;

  // coverage:ignore-start
  const TempAvatarDeleteAvatarResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TempAvatarDeleteAvatarResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TempAvatarDeleteAvatarResponseApplicationJson> get serializer =>
      _$tempAvatarDeleteAvatarResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BotWithDetailsAndSecret_1Interface {
  String get secret;
}

@BuiltValue(instantiable: false)
abstract interface class $BotWithDetailsAndSecretInterface
    implements $BotWithDetailsInterface, $BotWithDetailsAndSecret_1Interface {}

abstract class BotWithDetailsAndSecret
    implements $BotWithDetailsAndSecretInterface, Built<BotWithDetailsAndSecret, BotWithDetailsAndSecretBuilder> {
  factory BotWithDetailsAndSecret([void Function(BotWithDetailsAndSecretBuilder)? b]) = _$BotWithDetailsAndSecret;

  // coverage:ignore-start
  const BotWithDetailsAndSecret._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BotWithDetailsAndSecret.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BotWithDetailsAndSecret> get serializer => _$botWithDetailsAndSecretSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0_Spreed_Config_AttachmentsInterface {
  bool get allowed;
  String? get folder;
}

abstract class PublicCapabilities0_Spreed_Config_Attachments
    implements
        $PublicCapabilities0_Spreed_Config_AttachmentsInterface,
        Built<PublicCapabilities0_Spreed_Config_Attachments, PublicCapabilities0_Spreed_Config_AttachmentsBuilder> {
  factory PublicCapabilities0_Spreed_Config_Attachments([
    void Function(PublicCapabilities0_Spreed_Config_AttachmentsBuilder)? b,
  ]) = _$PublicCapabilities0_Spreed_Config_Attachments;

  // coverage:ignore-start
  const PublicCapabilities0_Spreed_Config_Attachments._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0_Spreed_Config_Attachments.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0_Spreed_Config_Attachments> get serializer =>
      _$publicCapabilities0SpreedConfigAttachmentsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0_Spreed_Config_CallInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'breakout-rooms')
  bool get breakoutRooms;
  bool get recording;
  @BuiltValueField(wireName: 'recording-consent')
  int? get recordingConsent;
  @BuiltValueField(wireName: 'supported-reactions')
  BuiltList<String>? get supportedReactions;
  @BuiltValueField(wireName: 'predefined-backgrounds')
  BuiltList<String>? get predefinedBackgrounds;
  @BuiltValueField(wireName: 'can-upload-background')
  bool? get canUploadBackground;
  @BuiltValueField(wireName: 'sip-enabled')
  bool? get sipEnabled;
  @BuiltValueField(wireName: 'sip-dialout-enabled')
  bool? get sipDialoutEnabled;
  @BuiltValueField(wireName: 'can-enable-sip')
  bool? get canEnableSip;
}

abstract class PublicCapabilities0_Spreed_Config_Call
    implements
        $PublicCapabilities0_Spreed_Config_CallInterface,
        Built<PublicCapabilities0_Spreed_Config_Call, PublicCapabilities0_Spreed_Config_CallBuilder> {
  factory PublicCapabilities0_Spreed_Config_Call([void Function(PublicCapabilities0_Spreed_Config_CallBuilder)? b]) =
      _$PublicCapabilities0_Spreed_Config_Call;

  // coverage:ignore-start
  const PublicCapabilities0_Spreed_Config_Call._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0_Spreed_Config_Call.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0_Spreed_Config_Call> get serializer =>
      _$publicCapabilities0SpreedConfigCallSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0_Spreed_Config_ChatInterface {
  @BuiltValueField(wireName: 'max-length')
  int get maxLength;
  @BuiltValueField(wireName: 'read-privacy')
  int get readPrivacy;
  @BuiltValueField(wireName: 'has-translation-providers')
  bool? get hasTranslationProviders;
  @BuiltValueField(wireName: 'typing-privacy')
  int? get typingPrivacy;
  BuiltList<String>? get translations;
}

abstract class PublicCapabilities0_Spreed_Config_Chat
    implements
        $PublicCapabilities0_Spreed_Config_ChatInterface,
        Built<PublicCapabilities0_Spreed_Config_Chat, PublicCapabilities0_Spreed_Config_ChatBuilder> {
  factory PublicCapabilities0_Spreed_Config_Chat([void Function(PublicCapabilities0_Spreed_Config_ChatBuilder)? b]) =
      _$PublicCapabilities0_Spreed_Config_Chat;

  // coverage:ignore-start
  const PublicCapabilities0_Spreed_Config_Chat._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0_Spreed_Config_Chat.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0_Spreed_Config_Chat> get serializer =>
      _$publicCapabilities0SpreedConfigChatSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0_Spreed_Config_ConversationsInterface {
  @BuiltValueField(wireName: 'can-create')
  bool get canCreate;
}

abstract class PublicCapabilities0_Spreed_Config_Conversations
    implements
        $PublicCapabilities0_Spreed_Config_ConversationsInterface,
        Built<PublicCapabilities0_Spreed_Config_Conversations, PublicCapabilities0_Spreed_Config_ConversationsBuilder> {
  factory PublicCapabilities0_Spreed_Config_Conversations([
    void Function(PublicCapabilities0_Spreed_Config_ConversationsBuilder)? b,
  ]) = _$PublicCapabilities0_Spreed_Config_Conversations;

  // coverage:ignore-start
  const PublicCapabilities0_Spreed_Config_Conversations._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0_Spreed_Config_Conversations.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0_Spreed_Config_Conversations> get serializer =>
      _$publicCapabilities0SpreedConfigConversationsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0_Spreed_Config_PreviewsInterface {
  @BuiltValueField(wireName: 'max-gif-size')
  int get maxGifSize;
}

abstract class PublicCapabilities0_Spreed_Config_Previews
    implements
        $PublicCapabilities0_Spreed_Config_PreviewsInterface,
        Built<PublicCapabilities0_Spreed_Config_Previews, PublicCapabilities0_Spreed_Config_PreviewsBuilder> {
  factory PublicCapabilities0_Spreed_Config_Previews([
    void Function(PublicCapabilities0_Spreed_Config_PreviewsBuilder)? b,
  ]) = _$PublicCapabilities0_Spreed_Config_Previews;

  // coverage:ignore-start
  const PublicCapabilities0_Spreed_Config_Previews._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0_Spreed_Config_Previews.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0_Spreed_Config_Previews> get serializer =>
      _$publicCapabilities0SpreedConfigPreviewsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0_Spreed_Config_SignalingInterface {
  @BuiltValueField(wireName: 'session-ping-limit')
  int get sessionPingLimit;
  @BuiltValueField(wireName: 'hello-v2-token-key')
  String? get helloV2TokenKey;
}

abstract class PublicCapabilities0_Spreed_Config_Signaling
    implements
        $PublicCapabilities0_Spreed_Config_SignalingInterface,
        Built<PublicCapabilities0_Spreed_Config_Signaling, PublicCapabilities0_Spreed_Config_SignalingBuilder> {
  factory PublicCapabilities0_Spreed_Config_Signaling([
    void Function(PublicCapabilities0_Spreed_Config_SignalingBuilder)? b,
  ]) = _$PublicCapabilities0_Spreed_Config_Signaling;

  // coverage:ignore-start
  const PublicCapabilities0_Spreed_Config_Signaling._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0_Spreed_Config_Signaling.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0_Spreed_Config_Signaling> get serializer =>
      _$publicCapabilities0SpreedConfigSignalingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0_Spreed_ConfigInterface {
  PublicCapabilities0_Spreed_Config_Attachments get attachments;
  PublicCapabilities0_Spreed_Config_Call get call;
  PublicCapabilities0_Spreed_Config_Chat get chat;
  PublicCapabilities0_Spreed_Config_Conversations get conversations;
  PublicCapabilities0_Spreed_Config_Previews get previews;
  PublicCapabilities0_Spreed_Config_Signaling get signaling;
}

abstract class PublicCapabilities0_Spreed_Config
    implements
        $PublicCapabilities0_Spreed_ConfigInterface,
        Built<PublicCapabilities0_Spreed_Config, PublicCapabilities0_Spreed_ConfigBuilder> {
  factory PublicCapabilities0_Spreed_Config([void Function(PublicCapabilities0_Spreed_ConfigBuilder)? b]) =
      _$PublicCapabilities0_Spreed_Config;

  // coverage:ignore-start
  const PublicCapabilities0_Spreed_Config._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0_Spreed_Config.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0_Spreed_Config> get serializer => _$publicCapabilities0SpreedConfigSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0_SpreedInterface {
  BuiltList<String> get features;
  PublicCapabilities0_Spreed_Config get config;
  String get version;
}

abstract class PublicCapabilities0_Spreed
    implements
        $PublicCapabilities0_SpreedInterface,
        Built<PublicCapabilities0_Spreed, PublicCapabilities0_SpreedBuilder> {
  factory PublicCapabilities0_Spreed([void Function(PublicCapabilities0_SpreedBuilder)? b]) =
      _$PublicCapabilities0_Spreed;

  // coverage:ignore-start
  const PublicCapabilities0_Spreed._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0_Spreed.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0_Spreed> get serializer => _$publicCapabilities0SpreedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities0Interface {
  PublicCapabilities0_Spreed get spreed;
}

abstract class PublicCapabilities0
    implements $PublicCapabilities0Interface, Built<PublicCapabilities0, PublicCapabilities0Builder> {
  factory PublicCapabilities0([void Function(PublicCapabilities0Builder)? b]) = _$PublicCapabilities0;

  // coverage:ignore-start
  const PublicCapabilities0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities0.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities0> get serializer => _$publicCapabilities0Serializer;
}

typedef Room_LastMessage = ({BuiltList<Never>? builtListNever, ChatMessage? chatMessage});

typedef RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data = ({
  BuiltList<Never>? builtListNever,
  RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0? roomAddParticipantToRoomResponseApplicationJsonOcsData0
});

typedef SettingsSetUserSettingValue = ({int? $int, String? string});

typedef SignalingPullMessagesResponseApplicationJson_Ocs_Data_Data = ({
  BuiltList<SignalingSession>? builtListSignalingSession,
  String? string
});

typedef PublicCapabilities = ({BuiltList<Never>? builtListNever, PublicCapabilities0? publicCapabilities0});

typedef $BuiltListChatMessage = ({BuiltList<Never>? builtListNever, ChatMessage? chatMessage});

extension $BuiltListChatMessageExtension on $BuiltListChatMessage {
  List<dynamic> get _values => [builtListNever, chatMessage];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListChatMessage> get serializer => const _$BuiltListChatMessageSerializer();
  static $BuiltListChatMessage fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListChatMessageSerializer implements PrimitiveSerializer<$BuiltListChatMessage> {
  const _$BuiltListChatMessageSerializer();

  @override
  Iterable<Type> get types => const [$BuiltListChatMessage];

  @override
  String get wireName => r'$BuiltListChatMessage';

  @override
  Object serialize(
    Serializers serializers,
    $BuiltListChatMessage object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListNever;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Never)]))!;
    }
    value = object.chatMessage;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(ChatMessage))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListChatMessage deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<Never>? builtListNever;
    try {
      builtListNever = serializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(Never)]))!
          as BuiltList<Never>;
    } catch (_) {}
    ChatMessage? chatMessage;
    try {
      chatMessage = serializers.deserialize(data, specifiedType: const FullType(ChatMessage))! as ChatMessage;
    } catch (_) {}
    return (builtListNever: builtListNever, chatMessage: chatMessage);
  }
}

typedef $BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0 = ({
  BuiltList<Never>? builtListNever,
  RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0? roomAddParticipantToRoomResponseApplicationJsonOcsData0
});

extension $BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0Extension
    on $BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0 {
  List<dynamic> get _values => [builtListNever, roomAddParticipantToRoomResponseApplicationJsonOcsData0];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0> get serializer =>
      const _$BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0Serializer();
  static $BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0 fromJson(Object? json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0Serializer
    implements PrimitiveSerializer<$BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0> {
  const _$BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0Serializer();

  @override
  Iterable<Type> get types => const [$BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0];

  @override
  String get wireName => r'$BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0';

  @override
  Object serialize(
    Serializers serializers,
    $BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListNever;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Never)]))!;
    }
    value = object.roomAddParticipantToRoomResponseApplicationJsonOcsData0;
    if (value != null) {
      return serializers.serialize(
        value,
        specifiedType: const FullType(RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0),
      )!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<Never>? builtListNever;
    try {
      builtListNever = serializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(Never)]))!
          as BuiltList<Never>;
    } catch (_) {}
    RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0? roomAddParticipantToRoomResponseApplicationJsonOcsData0;
    try {
      roomAddParticipantToRoomResponseApplicationJsonOcsData0 = serializers.deserialize(
        data,
        specifiedType: const FullType(RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0),
      )! as RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0;
    } catch (_) {}
    return (
      builtListNever: builtListNever,
      roomAddParticipantToRoomResponseApplicationJsonOcsData0: roomAddParticipantToRoomResponseApplicationJsonOcsData0
    );
  }
}

typedef $IntString = ({int? $int, String? string});

extension $IntStringExtension on $IntString {
  List<dynamic> get _values => [$int, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$IntString> get serializer => const _$IntStringSerializer();
  static $IntString fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$IntStringSerializer implements PrimitiveSerializer<$IntString> {
  const _$IntStringSerializer();

  @override
  Iterable<Type> get types => const [$IntString];

  @override
  String get wireName => r'$IntString';

  @override
  Object serialize(
    Serializers serializers,
    $IntString object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.$int;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(int))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $IntString deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    int? $int;
    try {
      $int = serializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return ($int: $int, string: string);
  }
}

typedef $BuiltListString = ({BuiltList<SignalingSession>? builtListSignalingSession, String? string});

extension $BuiltListStringExtension on $BuiltListString {
  List<dynamic> get _values => [builtListSignalingSession, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListString> get serializer => const _$BuiltListStringSerializer();
  static $BuiltListString fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListStringSerializer implements PrimitiveSerializer<$BuiltListString> {
  const _$BuiltListStringSerializer();

  @override
  Iterable<Type> get types => const [$BuiltListString];

  @override
  String get wireName => r'$BuiltListString';

  @override
  Object serialize(
    Serializers serializers,
    $BuiltListString object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListSignalingSession;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(SignalingSession)]))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListString deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<SignalingSession>? builtListSignalingSession;
    try {
      builtListSignalingSession = serializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(SignalingSession)]),
      )! as BuiltList<SignalingSession>;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return (builtListSignalingSession: builtListSignalingSession, string: string);
  }
}

typedef $BuiltListPublicCapabilities0 = ({BuiltList<Never>? builtListNever, PublicCapabilities0? publicCapabilities0});

extension $BuiltListPublicCapabilities0Extension on $BuiltListPublicCapabilities0 {
  List<dynamic> get _values => [builtListNever, publicCapabilities0];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListPublicCapabilities0> get serializer => const _$BuiltListPublicCapabilities0Serializer();
  static $BuiltListPublicCapabilities0 fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListPublicCapabilities0Serializer implements PrimitiveSerializer<$BuiltListPublicCapabilities0> {
  const _$BuiltListPublicCapabilities0Serializer();

  @override
  Iterable<Type> get types => const [$BuiltListPublicCapabilities0];

  @override
  String get wireName => r'$BuiltListPublicCapabilities0';

  @override
  Object serialize(
    Serializers serializers,
    $BuiltListPublicCapabilities0 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListNever;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Never)]))!;
    }
    value = object.publicCapabilities0;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(PublicCapabilities0))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListPublicCapabilities0 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<Never>? builtListNever;
    try {
      builtListNever = serializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(Never)]))!
          as BuiltList<Never>;
    } catch (_) {}
    PublicCapabilities0? publicCapabilities0;
    try {
      publicCapabilities0 =
          serializers.deserialize(data, specifiedType: const FullType(PublicCapabilities0))! as PublicCapabilities0;
    } catch (_) {}
    return (builtListNever: builtListNever, publicCapabilities0: publicCapabilities0);
  }
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..add(AvatarGetAvatarApiVersion.serializer)
      ..add(AvatarUploadAvatarApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(AvatarUploadAvatarResponseApplicationJson),
        AvatarUploadAvatarResponseApplicationJsonBuilder.new,
      )
      ..add(AvatarUploadAvatarResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AvatarUploadAvatarResponseApplicationJson_Ocs),
        AvatarUploadAvatarResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AvatarUploadAvatarResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(Room), RoomBuilder.new)
      ..add(Room.serializer)
      ..addBuilderFactory(const FullType(ChatMessage), ChatMessageBuilder.new)
      ..add(ChatMessage.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
        MapBuilder<String, BuiltMap<String, JsonObject>>.new,
      )
      ..addBuilderFactory(const FullType(BuiltMap, [FullType(String), FullType(int)]), MapBuilder<String, int>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Never)]), ListBuilder<Never>.new)
      ..add($BuiltListChatMessageExtension.serializer)
      ..add(AvatarDeleteAvatarApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(AvatarDeleteAvatarResponseApplicationJson),
        AvatarDeleteAvatarResponseApplicationJsonBuilder.new,
      )
      ..add(AvatarDeleteAvatarResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AvatarDeleteAvatarResponseApplicationJson_Ocs),
        AvatarDeleteAvatarResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AvatarDeleteAvatarResponseApplicationJson_Ocs.serializer)
      ..add(AvatarEmojiAvatarApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(AvatarEmojiAvatarResponseApplicationJson),
        AvatarEmojiAvatarResponseApplicationJsonBuilder.new,
      )
      ..add(AvatarEmojiAvatarResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AvatarEmojiAvatarResponseApplicationJson_Ocs),
        AvatarEmojiAvatarResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AvatarEmojiAvatarResponseApplicationJson_Ocs.serializer)
      ..add(AvatarGetAvatarDarkApiVersion.serializer)
      ..add(BotSendMessageApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BotSendMessageResponseApplicationJson),
        BotSendMessageResponseApplicationJsonBuilder.new,
      )
      ..add(BotSendMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BotSendMessageResponseApplicationJson_Ocs),
        BotSendMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BotSendMessageResponseApplicationJson_Ocs.serializer)
      ..add(BotReactApiVersion.serializer)
      ..addBuilderFactory(const FullType(BotReactResponseApplicationJson), BotReactResponseApplicationJsonBuilder.new)
      ..add(BotReactResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BotReactResponseApplicationJson_Ocs),
        BotReactResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BotReactResponseApplicationJson_Ocs.serializer)
      ..add(BotDeleteReactionApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BotDeleteReactionResponseApplicationJson),
        BotDeleteReactionResponseApplicationJsonBuilder.new,
      )
      ..add(BotDeleteReactionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BotDeleteReactionResponseApplicationJson_Ocs),
        BotDeleteReactionResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BotDeleteReactionResponseApplicationJson_Ocs.serializer)
      ..add(BotAdminListBotsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BotAdminListBotsResponseApplicationJson),
        BotAdminListBotsResponseApplicationJsonBuilder.new,
      )
      ..add(BotAdminListBotsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BotAdminListBotsResponseApplicationJson_Ocs),
        BotAdminListBotsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BotAdminListBotsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BotWithDetails), BotWithDetailsBuilder.new)
      ..add(BotWithDetails.serializer)
      ..addBuilderFactory(const FullType(Bot), BotBuilder.new)
      ..add(Bot.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(BotWithDetails)]), ListBuilder<BotWithDetails>.new)
      ..add(BotListBotsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BotListBotsResponseApplicationJson),
        BotListBotsResponseApplicationJsonBuilder.new,
      )
      ..add(BotListBotsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BotListBotsResponseApplicationJson_Ocs),
        BotListBotsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BotListBotsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Bot)]), ListBuilder<Bot>.new)
      ..add(BotEnableBotApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BotEnableBotResponseApplicationJson),
        BotEnableBotResponseApplicationJsonBuilder.new,
      )
      ..add(BotEnableBotResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BotEnableBotResponseApplicationJson_Ocs),
        BotEnableBotResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BotEnableBotResponseApplicationJson_Ocs.serializer)
      ..add(BotDisableBotApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BotDisableBotResponseApplicationJson),
        BotDisableBotResponseApplicationJsonBuilder.new,
      )
      ..add(BotDisableBotResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BotDisableBotResponseApplicationJson_Ocs),
        BotDisableBotResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BotDisableBotResponseApplicationJson_Ocs.serializer)
      ..add(BreakoutRoomConfigureBreakoutRoomsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson),
        BreakoutRoomConfigureBreakoutRoomsResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs),
        BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomConfigureBreakoutRoomsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Room)]), ListBuilder<Room>.new)
      ..add(BreakoutRoomRemoveBreakoutRoomsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson),
        BreakoutRoomRemoveBreakoutRoomsResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs),
        BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomRemoveBreakoutRoomsResponseApplicationJson_Ocs.serializer)
      ..add(BreakoutRoomBroadcastChatMessageApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomBroadcastChatMessageResponseApplicationJson),
        BreakoutRoomBroadcastChatMessageResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomBroadcastChatMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs),
        BreakoutRoomBroadcastChatMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomBroadcastChatMessageResponseApplicationJson_Ocs.serializer)
      ..add(BreakoutRoomApplyAttendeeMapApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomApplyAttendeeMapResponseApplicationJson),
        BreakoutRoomApplyAttendeeMapResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomApplyAttendeeMapResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs),
        BreakoutRoomApplyAttendeeMapResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomApplyAttendeeMapResponseApplicationJson_Ocs.serializer)
      ..add(BreakoutRoomRequestAssistanceApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomRequestAssistanceResponseApplicationJson),
        BreakoutRoomRequestAssistanceResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomRequestAssistanceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs),
        BreakoutRoomRequestAssistanceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomRequestAssistanceResponseApplicationJson_Ocs.serializer)
      ..add(BreakoutRoomResetRequestForAssistanceApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomResetRequestForAssistanceResponseApplicationJson),
        BreakoutRoomResetRequestForAssistanceResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomResetRequestForAssistanceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs),
        BreakoutRoomResetRequestForAssistanceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomResetRequestForAssistanceResponseApplicationJson_Ocs.serializer)
      ..add(BreakoutRoomStartBreakoutRoomsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomStartBreakoutRoomsResponseApplicationJson),
        BreakoutRoomStartBreakoutRoomsResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomStartBreakoutRoomsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs),
        BreakoutRoomStartBreakoutRoomsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomStartBreakoutRoomsResponseApplicationJson_Ocs.serializer)
      ..add(BreakoutRoomStopBreakoutRoomsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomStopBreakoutRoomsResponseApplicationJson),
        BreakoutRoomStopBreakoutRoomsResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomStopBreakoutRoomsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs),
        BreakoutRoomStopBreakoutRoomsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomStopBreakoutRoomsResponseApplicationJson_Ocs.serializer)
      ..add(BreakoutRoomSwitchBreakoutRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomSwitchBreakoutRoomResponseApplicationJson),
        BreakoutRoomSwitchBreakoutRoomResponseApplicationJsonBuilder.new,
      )
      ..add(BreakoutRoomSwitchBreakoutRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs),
        BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(BreakoutRoomSwitchBreakoutRoomResponseApplicationJson_Ocs.serializer)
      ..add(CallGetPeersForCallApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(CallGetPeersForCallResponseApplicationJson),
        CallGetPeersForCallResponseApplicationJsonBuilder.new,
      )
      ..add(CallGetPeersForCallResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CallGetPeersForCallResponseApplicationJson_Ocs),
        CallGetPeersForCallResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CallGetPeersForCallResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CallPeer), CallPeerBuilder.new)
      ..add(CallPeer.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(CallPeer)]), ListBuilder<CallPeer>.new)
      ..add(CallUpdateCallFlagsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(CallUpdateCallFlagsResponseApplicationJson),
        CallUpdateCallFlagsResponseApplicationJsonBuilder.new,
      )
      ..add(CallUpdateCallFlagsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CallUpdateCallFlagsResponseApplicationJson_Ocs),
        CallUpdateCallFlagsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CallUpdateCallFlagsResponseApplicationJson_Ocs.serializer)
      ..add(CallJoinCallApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(CallJoinCallResponseApplicationJson),
        CallJoinCallResponseApplicationJsonBuilder.new,
      )
      ..add(CallJoinCallResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CallJoinCallResponseApplicationJson_Ocs),
        CallJoinCallResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CallJoinCallResponseApplicationJson_Ocs.serializer)
      ..add(CallLeaveCallApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(CallLeaveCallResponseApplicationJson),
        CallLeaveCallResponseApplicationJsonBuilder.new,
      )
      ..add(CallLeaveCallResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CallLeaveCallResponseApplicationJson_Ocs),
        CallLeaveCallResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CallLeaveCallResponseApplicationJson_Ocs.serializer)
      ..add(CallRingAttendeeApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(CallRingAttendeeResponseApplicationJson),
        CallRingAttendeeResponseApplicationJsonBuilder.new,
      )
      ..add(CallRingAttendeeResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CallRingAttendeeResponseApplicationJson_Ocs),
        CallRingAttendeeResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CallRingAttendeeResponseApplicationJson_Ocs.serializer)
      ..add(CallSipDialOutApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(CallSipDialOutResponseApplicationJson),
        CallSipDialOutResponseApplicationJsonBuilder.new,
      )
      ..add(CallSipDialOutResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CallSipDialOutResponseApplicationJson_Ocs),
        CallSipDialOutResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CallSipDialOutResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CallSipDialOutResponseApplicationJson_Ocs_Data),
        CallSipDialOutResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(CallSipDialOutResponseApplicationJson_Ocs_Data.serializer)
      ..add(CertificateGetCertificateExpirationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(CertificateGetCertificateExpirationResponseApplicationJson),
        CertificateGetCertificateExpirationResponseApplicationJsonBuilder.new,
      )
      ..add(CertificateGetCertificateExpirationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CertificateGetCertificateExpirationResponseApplicationJson_Ocs),
        CertificateGetCertificateExpirationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CertificateGetCertificateExpirationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data),
        CertificateGetCertificateExpirationResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(CertificateGetCertificateExpirationResponseApplicationJson_Ocs_Data.serializer)
      ..add(ChatReceiveMessagesApiVersion.serializer)
      ..addBuilderFactory(const FullType(ChatChatReceiveMessagesHeaders), ChatChatReceiveMessagesHeadersBuilder.new)
      ..add(ChatChatReceiveMessagesHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatReceiveMessagesResponseApplicationJson),
        ChatReceiveMessagesResponseApplicationJsonBuilder.new,
      )
      ..add(ChatReceiveMessagesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatReceiveMessagesResponseApplicationJson_Ocs),
        ChatReceiveMessagesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatReceiveMessagesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ChatMessageWithParent), ChatMessageWithParentBuilder.new)
      ..add(ChatMessageWithParent.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ChatMessageWithParent)]),
        ListBuilder<ChatMessageWithParent>.new,
      )
      ..add(ChatSendMessageApiVersion.serializer)
      ..addBuilderFactory(const FullType(ChatChatSendMessageHeaders), ChatChatSendMessageHeadersBuilder.new)
      ..add(ChatChatSendMessageHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatSendMessageResponseApplicationJson),
        ChatSendMessageResponseApplicationJsonBuilder.new,
      )
      ..add(ChatSendMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatSendMessageResponseApplicationJson_Ocs),
        ChatSendMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatSendMessageResponseApplicationJson_Ocs.serializer)
      ..add(ChatClearHistoryApiVersion.serializer)
      ..addBuilderFactory(const FullType(ChatChatClearHistoryHeaders), ChatChatClearHistoryHeadersBuilder.new)
      ..add(ChatChatClearHistoryHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatClearHistoryResponseApplicationJson),
        ChatClearHistoryResponseApplicationJsonBuilder.new,
      )
      ..add(ChatClearHistoryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatClearHistoryResponseApplicationJson_Ocs),
        ChatClearHistoryResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatClearHistoryResponseApplicationJson_Ocs.serializer)
      ..add(ChatDeleteMessageApiVersion.serializer)
      ..addBuilderFactory(const FullType(ChatChatDeleteMessageHeaders), ChatChatDeleteMessageHeadersBuilder.new)
      ..add(ChatChatDeleteMessageHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatDeleteMessageResponseApplicationJson),
        ChatDeleteMessageResponseApplicationJsonBuilder.new,
      )
      ..add(ChatDeleteMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatDeleteMessageResponseApplicationJson_Ocs),
        ChatDeleteMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatDeleteMessageResponseApplicationJson_Ocs.serializer)
      ..add(ChatGetMessageContextApiVersion.serializer)
      ..addBuilderFactory(const FullType(ChatChatGetMessageContextHeaders), ChatChatGetMessageContextHeadersBuilder.new)
      ..add(ChatChatGetMessageContextHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatGetMessageContextResponseApplicationJson),
        ChatGetMessageContextResponseApplicationJsonBuilder.new,
      )
      ..add(ChatGetMessageContextResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatGetMessageContextResponseApplicationJson_Ocs),
        ChatGetMessageContextResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatGetMessageContextResponseApplicationJson_Ocs.serializer)
      ..add(ChatGetReminderApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ChatGetReminderResponseApplicationJson),
        ChatGetReminderResponseApplicationJsonBuilder.new,
      )
      ..add(ChatGetReminderResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatGetReminderResponseApplicationJson_Ocs),
        ChatGetReminderResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatGetReminderResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ChatReminder), ChatReminderBuilder.new)
      ..add(ChatReminder.serializer)
      ..add(ChatSetReminderApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ChatSetReminderResponseApplicationJson),
        ChatSetReminderResponseApplicationJsonBuilder.new,
      )
      ..add(ChatSetReminderResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatSetReminderResponseApplicationJson_Ocs),
        ChatSetReminderResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatSetReminderResponseApplicationJson_Ocs.serializer)
      ..add(ChatDeleteReminderApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ChatDeleteReminderResponseApplicationJson),
        ChatDeleteReminderResponseApplicationJsonBuilder.new,
      )
      ..add(ChatDeleteReminderResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatDeleteReminderResponseApplicationJson_Ocs),
        ChatDeleteReminderResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatDeleteReminderResponseApplicationJson_Ocs.serializer)
      ..add(ChatSetReadMarkerApiVersion.serializer)
      ..addBuilderFactory(const FullType(ChatChatSetReadMarkerHeaders), ChatChatSetReadMarkerHeadersBuilder.new)
      ..add(ChatChatSetReadMarkerHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatSetReadMarkerResponseApplicationJson),
        ChatSetReadMarkerResponseApplicationJsonBuilder.new,
      )
      ..add(ChatSetReadMarkerResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatSetReadMarkerResponseApplicationJson_Ocs),
        ChatSetReadMarkerResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatSetReadMarkerResponseApplicationJson_Ocs.serializer)
      ..add(ChatMarkUnreadApiVersion.serializer)
      ..addBuilderFactory(const FullType(ChatChatMarkUnreadHeaders), ChatChatMarkUnreadHeadersBuilder.new)
      ..add(ChatChatMarkUnreadHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatMarkUnreadResponseApplicationJson),
        ChatMarkUnreadResponseApplicationJsonBuilder.new,
      )
      ..add(ChatMarkUnreadResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatMarkUnreadResponseApplicationJson_Ocs),
        ChatMarkUnreadResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatMarkUnreadResponseApplicationJson_Ocs.serializer)
      ..add(ChatMentionsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ChatMentionsResponseApplicationJson),
        ChatMentionsResponseApplicationJsonBuilder.new,
      )
      ..add(ChatMentionsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatMentionsResponseApplicationJson_Ocs),
        ChatMentionsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatMentionsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ChatMentionSuggestion), ChatMentionSuggestionBuilder.new)
      ..add(ChatMentionSuggestion.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ChatMentionSuggestion)]),
        ListBuilder<ChatMentionSuggestion>.new,
      )
      ..add(ChatGetObjectsSharedInRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ChatChatGetObjectsSharedInRoomHeaders),
        ChatChatGetObjectsSharedInRoomHeadersBuilder.new,
      )
      ..add(ChatChatGetObjectsSharedInRoomHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatGetObjectsSharedInRoomResponseApplicationJson),
        ChatGetObjectsSharedInRoomResponseApplicationJsonBuilder.new,
      )
      ..add(ChatGetObjectsSharedInRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs),
        ChatGetObjectsSharedInRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatGetObjectsSharedInRoomResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ChatMessage)]), ListBuilder<ChatMessage>.new)
      ..add(ChatShareObjectToChatApiVersion.serializer)
      ..addBuilderFactory(const FullType(ChatChatShareObjectToChatHeaders), ChatChatShareObjectToChatHeadersBuilder.new)
      ..add(ChatChatShareObjectToChatHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ChatShareObjectToChatResponseApplicationJson),
        ChatShareObjectToChatResponseApplicationJsonBuilder.new,
      )
      ..add(ChatShareObjectToChatResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatShareObjectToChatResponseApplicationJson_Ocs),
        ChatShareObjectToChatResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatShareObjectToChatResponseApplicationJson_Ocs.serializer)
      ..add(ChatGetObjectsSharedInRoomOverviewApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ChatGetObjectsSharedInRoomOverviewResponseApplicationJson),
        ChatGetObjectsSharedInRoomOverviewResponseApplicationJsonBuilder.new,
      )
      ..add(ChatGetObjectsSharedInRoomOverviewResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs),
        ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ChatGetObjectsSharedInRoomOverviewResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(ChatMessage)]),
        ]),
        MapBuilder<String, BuiltList<ChatMessage>>.new,
      )
      ..add(FederationAcceptShareApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(FederationAcceptShareResponseApplicationJson),
        FederationAcceptShareResponseApplicationJsonBuilder.new,
      )
      ..add(FederationAcceptShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FederationAcceptShareResponseApplicationJson_Ocs),
        FederationAcceptShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(FederationAcceptShareResponseApplicationJson_Ocs.serializer)
      ..add(FederationRejectShareApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(FederationRejectShareResponseApplicationJson),
        FederationRejectShareResponseApplicationJsonBuilder.new,
      )
      ..add(FederationRejectShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FederationRejectShareResponseApplicationJson_Ocs),
        FederationRejectShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(FederationRejectShareResponseApplicationJson_Ocs.serializer)
      ..add(FederationGetSharesApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(FederationGetSharesResponseApplicationJson),
        FederationGetSharesResponseApplicationJsonBuilder.new,
      )
      ..add(FederationGetSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FederationGetSharesResponseApplicationJson_Ocs),
        FederationGetSharesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(FederationGetSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FederationInvite), FederationInviteBuilder.new)
      ..add(FederationInvite.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(FederationInvite)]), ListBuilder<FederationInvite>.new)
      ..add(FilesIntegrationGetRoomByFileIdApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(FilesIntegrationGetRoomByFileIdResponseApplicationJson),
        FilesIntegrationGetRoomByFileIdResponseApplicationJsonBuilder.new,
      )
      ..add(FilesIntegrationGetRoomByFileIdResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs),
        FilesIntegrationGetRoomByFileIdResponseApplicationJson_OcsBuilder.new,
      )
      ..add(FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data),
        FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(FilesIntegrationGetRoomByFileIdResponseApplicationJson_Ocs_Data.serializer)
      ..add(FilesIntegrationGetRoomByShareTokenApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(FilesIntegrationGetRoomByShareTokenResponseApplicationJson),
        FilesIntegrationGetRoomByShareTokenResponseApplicationJsonBuilder.new,
      )
      ..add(FilesIntegrationGetRoomByShareTokenResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs),
        FilesIntegrationGetRoomByShareTokenResponseApplicationJson_OcsBuilder.new,
      )
      ..add(FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data),
        FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(FilesIntegrationGetRoomByShareTokenResponseApplicationJson_Ocs_Data.serializer)
      ..add(GuestSetDisplayNameApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(GuestSetDisplayNameResponseApplicationJson),
        GuestSetDisplayNameResponseApplicationJsonBuilder.new,
      )
      ..add(GuestSetDisplayNameResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GuestSetDisplayNameResponseApplicationJson_Ocs),
        GuestSetDisplayNameResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GuestSetDisplayNameResponseApplicationJson_Ocs.serializer)
      ..add(HostedSignalingServerRequestTrialApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(HostedSignalingServerRequestTrialResponseApplicationJson),
        HostedSignalingServerRequestTrialResponseApplicationJsonBuilder.new,
      )
      ..add(HostedSignalingServerRequestTrialResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(HostedSignalingServerRequestTrialResponseApplicationJson_Ocs),
        HostedSignalingServerRequestTrialResponseApplicationJson_OcsBuilder.new,
      )
      ..add(HostedSignalingServerRequestTrialResponseApplicationJson_Ocs.serializer)
      ..add(HostedSignalingServerDeleteAccountApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(HostedSignalingServerDeleteAccountResponseApplicationJson),
        HostedSignalingServerDeleteAccountResponseApplicationJsonBuilder.new,
      )
      ..add(HostedSignalingServerDeleteAccountResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs),
        HostedSignalingServerDeleteAccountResponseApplicationJson_OcsBuilder.new,
      )
      ..add(HostedSignalingServerDeleteAccountResponseApplicationJson_Ocs.serializer)
      ..add(MatterbridgeGetBridgeOfRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeGetBridgeOfRoomResponseApplicationJson),
        MatterbridgeGetBridgeOfRoomResponseApplicationJsonBuilder.new,
      )
      ..add(MatterbridgeGetBridgeOfRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs),
        MatterbridgeGetBridgeOfRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(MatterbridgeGetBridgeOfRoomResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(MatterbridgeWithProcessState), MatterbridgeWithProcessStateBuilder.new)
      ..add(MatterbridgeWithProcessState.serializer)
      ..addBuilderFactory(const FullType(Matterbridge), MatterbridgeBuilder.new)
      ..add(Matterbridge.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
        ListBuilder<BuiltMap<String, JsonObject>>.new,
      )
      ..addBuilderFactory(const FullType(MatterbridgeProcessState), MatterbridgeProcessStateBuilder.new)
      ..add(MatterbridgeProcessState.serializer)
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltList, [
            FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
          ]),
        ]),
        ContentStringBuilder<BuiltList<BuiltMap<String, JsonObject>>>.new,
      )
      ..add(ContentString.serializer)
      ..add(MatterbridgeEditBridgeOfRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeEditBridgeOfRoomResponseApplicationJson),
        MatterbridgeEditBridgeOfRoomResponseApplicationJsonBuilder.new,
      )
      ..add(MatterbridgeEditBridgeOfRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs),
        MatterbridgeEditBridgeOfRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(MatterbridgeEditBridgeOfRoomResponseApplicationJson_Ocs.serializer)
      ..add(MatterbridgeDeleteBridgeOfRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeDeleteBridgeOfRoomResponseApplicationJson),
        MatterbridgeDeleteBridgeOfRoomResponseApplicationJsonBuilder.new,
      )
      ..add(MatterbridgeDeleteBridgeOfRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs),
        MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(MatterbridgeDeleteBridgeOfRoomResponseApplicationJson_Ocs.serializer)
      ..add(MatterbridgeGetBridgeProcessStateApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeGetBridgeProcessStateResponseApplicationJson),
        MatterbridgeGetBridgeProcessStateResponseApplicationJsonBuilder.new,
      )
      ..add(MatterbridgeGetBridgeProcessStateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs),
        MatterbridgeGetBridgeProcessStateResponseApplicationJson_OcsBuilder.new,
      )
      ..add(MatterbridgeGetBridgeProcessStateResponseApplicationJson_Ocs.serializer)
      ..add(MatterbridgeSettingsStopAllBridgesApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeSettingsStopAllBridgesResponseApplicationJson),
        MatterbridgeSettingsStopAllBridgesResponseApplicationJsonBuilder.new,
      )
      ..add(MatterbridgeSettingsStopAllBridgesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs),
        MatterbridgeSettingsStopAllBridgesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(MatterbridgeSettingsStopAllBridgesResponseApplicationJson_Ocs.serializer)
      ..add(MatterbridgeSettingsGetMatterbridgeVersionApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson),
        MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJsonBuilder.new,
      )
      ..add(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs),
        MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_OcsBuilder.new,
      )
      ..add(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data),
        MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(MatterbridgeSettingsGetMatterbridgeVersionResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..add(PollCreatePollApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PollCreatePollResponseApplicationJson),
        PollCreatePollResponseApplicationJsonBuilder.new,
      )
      ..add(PollCreatePollResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PollCreatePollResponseApplicationJson_Ocs),
        PollCreatePollResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PollCreatePollResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Poll), PollBuilder.new)
      ..add(Poll.serializer)
      ..addBuilderFactory(const FullType(PollVote), PollVoteBuilder.new)
      ..add(PollVote.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(PollVote)]), ListBuilder<PollVote>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..add(PollShowPollApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PollShowPollResponseApplicationJson),
        PollShowPollResponseApplicationJsonBuilder.new,
      )
      ..add(PollShowPollResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PollShowPollResponseApplicationJson_Ocs),
        PollShowPollResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PollShowPollResponseApplicationJson_Ocs.serializer)
      ..add(PollVotePollApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PollVotePollResponseApplicationJson),
        PollVotePollResponseApplicationJsonBuilder.new,
      )
      ..add(PollVotePollResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PollVotePollResponseApplicationJson_Ocs),
        PollVotePollResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PollVotePollResponseApplicationJson_Ocs.serializer)
      ..add(PollClosePollApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PollClosePollResponseApplicationJson),
        PollClosePollResponseApplicationJsonBuilder.new,
      )
      ..add(PollClosePollResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PollClosePollResponseApplicationJson_Ocs),
        PollClosePollResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PollClosePollResponseApplicationJson_Ocs.serializer)
      ..add(PublicShareAuthCreateRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PublicShareAuthCreateRoomResponseApplicationJson),
        PublicShareAuthCreateRoomResponseApplicationJsonBuilder.new,
      )
      ..add(PublicShareAuthCreateRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PublicShareAuthCreateRoomResponseApplicationJson_Ocs),
        PublicShareAuthCreateRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PublicShareAuthCreateRoomResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data),
        PublicShareAuthCreateRoomResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(PublicShareAuthCreateRoomResponseApplicationJson_Ocs_Data.serializer)
      ..add(ReactionGetReactionsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ReactionGetReactionsResponseApplicationJson),
        ReactionGetReactionsResponseApplicationJsonBuilder.new,
      )
      ..add(ReactionGetReactionsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReactionGetReactionsResponseApplicationJson_Ocs),
        ReactionGetReactionsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ReactionGetReactionsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Reaction), ReactionBuilder.new)
      ..add(Reaction.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Reaction)]), ListBuilder<Reaction>.new)
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(Reaction)]),
        ]),
        MapBuilder<String, BuiltList<Reaction>>.new,
      )
      ..add(ReactionReactApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ReactionReactResponseApplicationJson),
        ReactionReactResponseApplicationJsonBuilder.new,
      )
      ..add(ReactionReactResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReactionReactResponseApplicationJson_Ocs),
        ReactionReactResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ReactionReactResponseApplicationJson_Ocs.serializer)
      ..add(ReactionDeleteApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ReactionDeleteResponseApplicationJson),
        ReactionDeleteResponseApplicationJsonBuilder.new,
      )
      ..add(ReactionDeleteResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReactionDeleteResponseApplicationJson_Ocs),
        ReactionDeleteResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ReactionDeleteResponseApplicationJson_Ocs.serializer)
      ..add(RecordingGetWelcomeMessageApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RecordingGetWelcomeMessageResponseApplicationJson),
        RecordingGetWelcomeMessageResponseApplicationJsonBuilder.new,
      )
      ..add(RecordingGetWelcomeMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RecordingGetWelcomeMessageResponseApplicationJson_Ocs),
        RecordingGetWelcomeMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RecordingGetWelcomeMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data),
        RecordingGetWelcomeMessageResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(RecordingGetWelcomeMessageResponseApplicationJson_Ocs_Data.serializer)
      ..add(RecordingStartApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RecordingStartResponseApplicationJson),
        RecordingStartResponseApplicationJsonBuilder.new,
      )
      ..add(RecordingStartResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RecordingStartResponseApplicationJson_Ocs),
        RecordingStartResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RecordingStartResponseApplicationJson_Ocs.serializer)
      ..add(RecordingStopApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RecordingStopResponseApplicationJson),
        RecordingStopResponseApplicationJsonBuilder.new,
      )
      ..add(RecordingStopResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RecordingStopResponseApplicationJson_Ocs),
        RecordingStopResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RecordingStopResponseApplicationJson_Ocs.serializer)
      ..add(RecordingStoreApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RecordingStoreResponseApplicationJson),
        RecordingStoreResponseApplicationJsonBuilder.new,
      )
      ..add(RecordingStoreResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RecordingStoreResponseApplicationJson_Ocs),
        RecordingStoreResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RecordingStoreResponseApplicationJson_Ocs.serializer)
      ..add(RecordingNotificationDismissApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RecordingNotificationDismissResponseApplicationJson),
        RecordingNotificationDismissResponseApplicationJsonBuilder.new,
      )
      ..add(RecordingNotificationDismissResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RecordingNotificationDismissResponseApplicationJson_Ocs),
        RecordingNotificationDismissResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RecordingNotificationDismissResponseApplicationJson_Ocs.serializer)
      ..add(RecordingShareToChatApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RecordingShareToChatResponseApplicationJson),
        RecordingShareToChatResponseApplicationJsonBuilder.new,
      )
      ..add(RecordingShareToChatResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RecordingShareToChatResponseApplicationJson_Ocs),
        RecordingShareToChatResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RecordingShareToChatResponseApplicationJson_Ocs.serializer)
      ..add(RoomGetRoomsApiVersion.serializer)
      ..addBuilderFactory(const FullType(RoomRoomGetRoomsHeaders), RoomRoomGetRoomsHeadersBuilder.new)
      ..add(RoomRoomGetRoomsHeaders.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetRoomsResponseApplicationJson),
        RoomGetRoomsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomGetRoomsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetRoomsResponseApplicationJson_Ocs),
        RoomGetRoomsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomGetRoomsResponseApplicationJson_Ocs.serializer)
      ..add(RoomCreateRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomCreateRoomResponseApplicationJson),
        RoomCreateRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomCreateRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomCreateRoomResponseApplicationJson_Ocs),
        RoomCreateRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomCreateRoomResponseApplicationJson_Ocs.serializer)
      ..add(RoomGetListedRoomsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetListedRoomsResponseApplicationJson),
        RoomGetListedRoomsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomGetListedRoomsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetListedRoomsResponseApplicationJson_Ocs),
        RoomGetListedRoomsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomGetListedRoomsResponseApplicationJson_Ocs.serializer)
      ..add(RoomGetNoteToSelfConversationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomRoomGetNoteToSelfConversationHeaders),
        RoomRoomGetNoteToSelfConversationHeadersBuilder.new,
      )
      ..add(RoomRoomGetNoteToSelfConversationHeaders.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetNoteToSelfConversationResponseApplicationJson),
        RoomGetNoteToSelfConversationResponseApplicationJsonBuilder.new,
      )
      ..add(RoomGetNoteToSelfConversationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetNoteToSelfConversationResponseApplicationJson_Ocs),
        RoomGetNoteToSelfConversationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomGetNoteToSelfConversationResponseApplicationJson_Ocs.serializer)
      ..add(RoomGetSingleRoomApiVersion.serializer)
      ..addBuilderFactory(const FullType(RoomRoomGetSingleRoomHeaders), RoomRoomGetSingleRoomHeadersBuilder.new)
      ..add(RoomRoomGetSingleRoomHeaders.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetSingleRoomResponseApplicationJson),
        RoomGetSingleRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomGetSingleRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetSingleRoomResponseApplicationJson_Ocs),
        RoomGetSingleRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomGetSingleRoomResponseApplicationJson_Ocs.serializer)
      ..add(RoomRenameRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomRenameRoomResponseApplicationJson),
        RoomRenameRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomRenameRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomRenameRoomResponseApplicationJson_Ocs),
        RoomRenameRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomRenameRoomResponseApplicationJson_Ocs.serializer)
      ..add(RoomDeleteRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomDeleteRoomResponseApplicationJson),
        RoomDeleteRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomDeleteRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomDeleteRoomResponseApplicationJson_Ocs),
        RoomDeleteRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomDeleteRoomResponseApplicationJson_Ocs.serializer)
      ..add(RoomGetBreakoutRoomsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetBreakoutRoomsResponseApplicationJson),
        RoomGetBreakoutRoomsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomGetBreakoutRoomsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetBreakoutRoomsResponseApplicationJson_Ocs),
        RoomGetBreakoutRoomsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomGetBreakoutRoomsResponseApplicationJson_Ocs.serializer)
      ..add(RoomMakePublicApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomMakePublicResponseApplicationJson),
        RoomMakePublicResponseApplicationJsonBuilder.new,
      )
      ..add(RoomMakePublicResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomMakePublicResponseApplicationJson_Ocs),
        RoomMakePublicResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomMakePublicResponseApplicationJson_Ocs.serializer)
      ..add(RoomMakePrivateApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomMakePrivateResponseApplicationJson),
        RoomMakePrivateResponseApplicationJsonBuilder.new,
      )
      ..add(RoomMakePrivateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomMakePrivateResponseApplicationJson_Ocs),
        RoomMakePrivateResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomMakePrivateResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetDescriptionApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetDescriptionResponseApplicationJson),
        RoomSetDescriptionResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetDescriptionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetDescriptionResponseApplicationJson_Ocs),
        RoomSetDescriptionResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetDescriptionResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetReadOnlyApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetReadOnlyResponseApplicationJson),
        RoomSetReadOnlyResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetReadOnlyResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetReadOnlyResponseApplicationJson_Ocs),
        RoomSetReadOnlyResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetReadOnlyResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetListableApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetListableResponseApplicationJson),
        RoomSetListableResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetListableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetListableResponseApplicationJson_Ocs),
        RoomSetListableResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetListableResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetPasswordApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetPasswordResponseApplicationJson),
        RoomSetPasswordResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetPasswordResponseApplicationJson_Ocs),
        RoomSetPasswordResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetPasswordResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetPermissionsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetPermissionsResponseApplicationJson),
        RoomSetPermissionsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetPermissionsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetPermissionsResponseApplicationJson_Ocs),
        RoomSetPermissionsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetPermissionsResponseApplicationJson_Ocs.serializer)
      ..add(RoomGetParticipantsApiVersion.serializer)
      ..addBuilderFactory(const FullType(RoomRoomGetParticipantsHeaders), RoomRoomGetParticipantsHeadersBuilder.new)
      ..add(RoomRoomGetParticipantsHeaders.serializer)
      ..addBuilderFactory(const FullType(Header, [FullType(bool)]), HeaderBuilder<bool>.new)
      ..add(Header.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetParticipantsResponseApplicationJson),
        RoomGetParticipantsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomGetParticipantsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetParticipantsResponseApplicationJson_Ocs),
        RoomGetParticipantsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomGetParticipantsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Participant), ParticipantBuilder.new)
      ..add(Participant.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Participant)]), ListBuilder<Participant>.new)
      ..add(RoomAddParticipantToRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomAddParticipantToRoomResponseApplicationJson),
        RoomAddParticipantToRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomAddParticipantToRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomAddParticipantToRoomResponseApplicationJson_Ocs),
        RoomAddParticipantToRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomAddParticipantToRoomResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0),
        RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0Builder.new,
      )
      ..add(RoomAddParticipantToRoomResponseApplicationJson_Ocs_Data0.serializer)
      ..add($BuiltListRoomAddParticipantToRoomResponseApplicationJsonOcsData0Extension.serializer)
      ..add(RoomGetBreakoutRoomParticipantsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomRoomGetBreakoutRoomParticipantsHeaders),
        RoomRoomGetBreakoutRoomParticipantsHeadersBuilder.new,
      )
      ..add(RoomRoomGetBreakoutRoomParticipantsHeaders.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetBreakoutRoomParticipantsResponseApplicationJson),
        RoomGetBreakoutRoomParticipantsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomGetBreakoutRoomParticipantsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs),
        RoomGetBreakoutRoomParticipantsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomGetBreakoutRoomParticipantsResponseApplicationJson_Ocs.serializer)
      ..add(RoomRemoveSelfFromRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomRemoveSelfFromRoomResponseApplicationJson),
        RoomRemoveSelfFromRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomRemoveSelfFromRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomRemoveSelfFromRoomResponseApplicationJson_Ocs),
        RoomRemoveSelfFromRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomRemoveSelfFromRoomResponseApplicationJson_Ocs.serializer)
      ..add(RoomRemoveAttendeeFromRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomRemoveAttendeeFromRoomResponseApplicationJson),
        RoomRemoveAttendeeFromRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomRemoveAttendeeFromRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs),
        RoomRemoveAttendeeFromRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomRemoveAttendeeFromRoomResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetAttendeePermissionsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetAttendeePermissionsResponseApplicationJson),
        RoomSetAttendeePermissionsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetAttendeePermissionsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetAttendeePermissionsResponseApplicationJson_Ocs),
        RoomSetAttendeePermissionsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetAttendeePermissionsResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetAllAttendeesPermissionsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetAllAttendeesPermissionsResponseApplicationJson),
        RoomSetAllAttendeesPermissionsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetAllAttendeesPermissionsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs),
        RoomSetAllAttendeesPermissionsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetAllAttendeesPermissionsResponseApplicationJson_Ocs.serializer)
      ..add(RoomJoinRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomJoinRoomResponseApplicationJson),
        RoomJoinRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomJoinRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomJoinRoomResponseApplicationJson_Ocs),
        RoomJoinRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomJoinRoomResponseApplicationJson_Ocs.serializer)
      ..add(RoomLeaveRoomApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomLeaveRoomResponseApplicationJson),
        RoomLeaveRoomResponseApplicationJsonBuilder.new,
      )
      ..add(RoomLeaveRoomResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomLeaveRoomResponseApplicationJson_Ocs),
        RoomLeaveRoomResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomLeaveRoomResponseApplicationJson_Ocs.serializer)
      ..add(RoomResendInvitationsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomResendInvitationsResponseApplicationJson),
        RoomResendInvitationsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomResendInvitationsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomResendInvitationsResponseApplicationJson_Ocs),
        RoomResendInvitationsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomResendInvitationsResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetSessionStateApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetSessionStateResponseApplicationJson),
        RoomSetSessionStateResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetSessionStateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetSessionStateResponseApplicationJson_Ocs),
        RoomSetSessionStateResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetSessionStateResponseApplicationJson_Ocs.serializer)
      ..add(RoomPromoteModeratorApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomPromoteModeratorResponseApplicationJson),
        RoomPromoteModeratorResponseApplicationJsonBuilder.new,
      )
      ..add(RoomPromoteModeratorResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomPromoteModeratorResponseApplicationJson_Ocs),
        RoomPromoteModeratorResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomPromoteModeratorResponseApplicationJson_Ocs.serializer)
      ..add(RoomDemoteModeratorApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomDemoteModeratorResponseApplicationJson),
        RoomDemoteModeratorResponseApplicationJsonBuilder.new,
      )
      ..add(RoomDemoteModeratorResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomDemoteModeratorResponseApplicationJson_Ocs),
        RoomDemoteModeratorResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomDemoteModeratorResponseApplicationJson_Ocs.serializer)
      ..add(RoomAddToFavoritesApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomAddToFavoritesResponseApplicationJson),
        RoomAddToFavoritesResponseApplicationJsonBuilder.new,
      )
      ..add(RoomAddToFavoritesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomAddToFavoritesResponseApplicationJson_Ocs),
        RoomAddToFavoritesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomAddToFavoritesResponseApplicationJson_Ocs.serializer)
      ..add(RoomRemoveFromFavoritesApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomRemoveFromFavoritesResponseApplicationJson),
        RoomRemoveFromFavoritesResponseApplicationJsonBuilder.new,
      )
      ..add(RoomRemoveFromFavoritesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomRemoveFromFavoritesResponseApplicationJson_Ocs),
        RoomRemoveFromFavoritesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomRemoveFromFavoritesResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetNotificationLevelApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetNotificationLevelResponseApplicationJson),
        RoomSetNotificationLevelResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetNotificationLevelResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetNotificationLevelResponseApplicationJson_Ocs),
        RoomSetNotificationLevelResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetNotificationLevelResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetNotificationCallsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetNotificationCallsResponseApplicationJson),
        RoomSetNotificationCallsResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetNotificationCallsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetNotificationCallsResponseApplicationJson_Ocs),
        RoomSetNotificationCallsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetNotificationCallsResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetLobbyApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetLobbyResponseApplicationJson),
        RoomSetLobbyResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetLobbyResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetLobbyResponseApplicationJson_Ocs),
        RoomSetLobbyResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetLobbyResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetsipEnabledApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetsipEnabledResponseApplicationJson),
        RoomSetsipEnabledResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetsipEnabledResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetsipEnabledResponseApplicationJson_Ocs),
        RoomSetsipEnabledResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetsipEnabledResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetRecordingConsentApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetRecordingConsentResponseApplicationJson),
        RoomSetRecordingConsentResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetRecordingConsentResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetRecordingConsentResponseApplicationJson_Ocs),
        RoomSetRecordingConsentResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetRecordingConsentResponseApplicationJson_Ocs.serializer)
      ..add(RoomSetMessageExpirationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetMessageExpirationResponseApplicationJson),
        RoomSetMessageExpirationResponseApplicationJsonBuilder.new,
      )
      ..add(RoomSetMessageExpirationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RoomSetMessageExpirationResponseApplicationJson_Ocs),
        RoomSetMessageExpirationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RoomSetMessageExpirationResponseApplicationJson_Ocs.serializer)
      ..add(SettingsSetsipSettingsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SettingsSetsipSettingsResponseApplicationJson),
        SettingsSetsipSettingsResponseApplicationJsonBuilder.new,
      )
      ..add(SettingsSetsipSettingsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SettingsSetsipSettingsResponseApplicationJson_Ocs),
        SettingsSetsipSettingsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(SettingsSetsipSettingsResponseApplicationJson_Ocs.serializer)
      ..add($IntStringExtension.serializer)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(SettingsSetUserSettingValue)]),
        ContentStringBuilder<SettingsSetUserSettingValue>.new,
      )
      ..add(SettingsSetUserSettingApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SettingsSetUserSettingResponseApplicationJson),
        SettingsSetUserSettingResponseApplicationJsonBuilder.new,
      )
      ..add(SettingsSetUserSettingResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SettingsSetUserSettingResponseApplicationJson_Ocs),
        SettingsSetUserSettingResponseApplicationJson_OcsBuilder.new,
      )
      ..add(SettingsSetUserSettingResponseApplicationJson_Ocs.serializer)
      ..add(SignalingGetSettingsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SignalingGetSettingsResponseApplicationJson),
        SignalingGetSettingsResponseApplicationJsonBuilder.new,
      )
      ..add(SignalingGetSettingsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SignalingGetSettingsResponseApplicationJson_Ocs),
        SignalingGetSettingsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(SignalingGetSettingsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(SignalingSettings), SignalingSettingsBuilder.new)
      ..add(SignalingSettings.serializer)
      ..addBuilderFactory(
        const FullType(SignalingSettings_HelloAuthParams),
        SignalingSettings_HelloAuthParamsBuilder.new,
      )
      ..add(SignalingSettings_HelloAuthParams.serializer)
      ..addBuilderFactory(
        const FullType(SignalingSettings_HelloAuthParams_$10),
        SignalingSettings_HelloAuthParams_$10Builder.new,
      )
      ..add(SignalingSettings_HelloAuthParams_$10.serializer)
      ..addBuilderFactory(
        const FullType(SignalingSettings_HelloAuthParams_$20),
        SignalingSettings_HelloAuthParams_$20Builder.new,
      )
      ..add(SignalingSettings_HelloAuthParams_$20.serializer)
      ..addBuilderFactory(const FullType(SignalingSettings_Stunservers), SignalingSettings_StunserversBuilder.new)
      ..add(SignalingSettings_Stunservers.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SignalingSettings_Stunservers)]),
        ListBuilder<SignalingSettings_Stunservers>.new,
      )
      ..addBuilderFactory(const FullType(SignalingSettings_Turnservers), SignalingSettings_TurnserversBuilder.new)
      ..add(SignalingSettings_Turnservers.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SignalingSettings_Turnservers)]),
        ListBuilder<SignalingSettings_Turnservers>.new,
      )
      ..add(SignalingGetWelcomeMessageApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SignalingGetWelcomeMessageResponseApplicationJson),
        SignalingGetWelcomeMessageResponseApplicationJsonBuilder.new,
      )
      ..add(SignalingGetWelcomeMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SignalingGetWelcomeMessageResponseApplicationJson_Ocs),
        SignalingGetWelcomeMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(SignalingGetWelcomeMessageResponseApplicationJson_Ocs.serializer)
      ..add(SignalingPullMessagesApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SignalingPullMessagesResponseApplicationJson),
        SignalingPullMessagesResponseApplicationJsonBuilder.new,
      )
      ..add(SignalingPullMessagesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SignalingPullMessagesResponseApplicationJson_Ocs),
        SignalingPullMessagesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(SignalingPullMessagesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(SignalingPullMessagesResponseApplicationJson_Ocs_Data),
        SignalingPullMessagesResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(SignalingPullMessagesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(SignalingSession), SignalingSessionBuilder.new)
      ..add(SignalingSession.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(SignalingSession)]), ListBuilder<SignalingSession>.new)
      ..add($BuiltListStringExtension.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SignalingPullMessagesResponseApplicationJson_Ocs_Data)]),
        ListBuilder<SignalingPullMessagesResponseApplicationJson_Ocs_Data>.new,
      )
      ..add(SignalingSendMessagesApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SignalingSendMessagesResponseApplicationJson),
        SignalingSendMessagesResponseApplicationJsonBuilder.new,
      )
      ..add(SignalingSendMessagesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SignalingSendMessagesResponseApplicationJson_Ocs),
        SignalingSendMessagesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(SignalingSendMessagesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TempAvatarPostAvatarResponseApplicationJson),
        TempAvatarPostAvatarResponseApplicationJsonBuilder.new,
      )
      ..add(TempAvatarPostAvatarResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TempAvatarPostAvatarResponseApplicationJson_Ocs),
        TempAvatarPostAvatarResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TempAvatarPostAvatarResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TempAvatarDeleteAvatarResponseApplicationJson),
        TempAvatarDeleteAvatarResponseApplicationJsonBuilder.new,
      )
      ..add(TempAvatarDeleteAvatarResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TempAvatarDeleteAvatarResponseApplicationJson_Ocs),
        TempAvatarDeleteAvatarResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TempAvatarDeleteAvatarResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BotWithDetailsAndSecret), BotWithDetailsAndSecretBuilder.new)
      ..add(BotWithDetailsAndSecret.serializer)
      ..addBuilderFactory(const FullType(PublicCapabilities0), PublicCapabilities0Builder.new)
      ..add(PublicCapabilities0.serializer)
      ..addBuilderFactory(const FullType(PublicCapabilities0_Spreed), PublicCapabilities0_SpreedBuilder.new)
      ..add(PublicCapabilities0_Spreed.serializer)
      ..addBuilderFactory(
        const FullType(PublicCapabilities0_Spreed_Config),
        PublicCapabilities0_Spreed_ConfigBuilder.new,
      )
      ..add(PublicCapabilities0_Spreed_Config.serializer)
      ..addBuilderFactory(
        const FullType(PublicCapabilities0_Spreed_Config_Attachments),
        PublicCapabilities0_Spreed_Config_AttachmentsBuilder.new,
      )
      ..add(PublicCapabilities0_Spreed_Config_Attachments.serializer)
      ..addBuilderFactory(
        const FullType(PublicCapabilities0_Spreed_Config_Call),
        PublicCapabilities0_Spreed_Config_CallBuilder.new,
      )
      ..add(PublicCapabilities0_Spreed_Config_Call.serializer)
      ..addBuilderFactory(
        const FullType(PublicCapabilities0_Spreed_Config_Chat),
        PublicCapabilities0_Spreed_Config_ChatBuilder.new,
      )
      ..add(PublicCapabilities0_Spreed_Config_Chat.serializer)
      ..addBuilderFactory(
        const FullType(PublicCapabilities0_Spreed_Config_Conversations),
        PublicCapabilities0_Spreed_Config_ConversationsBuilder.new,
      )
      ..add(PublicCapabilities0_Spreed_Config_Conversations.serializer)
      ..addBuilderFactory(
        const FullType(PublicCapabilities0_Spreed_Config_Previews),
        PublicCapabilities0_Spreed_Config_PreviewsBuilder.new,
      )
      ..add(PublicCapabilities0_Spreed_Config_Previews.serializer)
      ..addBuilderFactory(
        const FullType(PublicCapabilities0_Spreed_Config_Signaling),
        PublicCapabilities0_Spreed_Config_SignalingBuilder.new,
      )
      ..add(PublicCapabilities0_Spreed_Config_Signaling.serializer)
      ..add($BuiltListPublicCapabilities0Extension.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
