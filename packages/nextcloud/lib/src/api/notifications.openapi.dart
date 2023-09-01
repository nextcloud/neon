// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'notifications.openapi.g.dart';

class NotificationsResponse<T, U> extends DynamiteResponse<T, U> {
  NotificationsResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'NotificationsResponse(data: $data, headers: $headers)';
}

class NotificationsApiException extends DynamiteApiException {
  NotificationsApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<NotificationsApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return NotificationsApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'NotificationsApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class NotificationsClient extends DynamiteClient {
  NotificationsClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  NotificationsClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  Future<NotificationsListNotifications> listNotifications() async {
    const path = '/ocs/v2.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers);
    } else if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer or basic_auth');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsListNotifications),
      )! as NotificationsListNotifications;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteAllNotifications() async {
    const path = '/ocs/v2.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers);
    } else {
      throw Exception('Missing authentication for bearer');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotificationsGetNotification> getNotification({required final int id}) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers);
    } else if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsGetNotification),
      )! as NotificationsGetNotification;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotificationsEmptyOCS> deleteNotification({required final int id}) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers);
    } else {
      throw Exception('Missing authentication for bearer');
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsEmptyOCS),
      )! as NotificationsEmptyOCS;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotificationsPushServerRegistration> registerDevice({
    required final String pushTokenHash,
    required final String devicePublicKey,
    required final String proxyServer,
  }) async {
    const path = '/ocs/v2.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers);
    } else {
      throw Exception('Missing authentication for bearer');
    }
    // coverage:ignore-end
    queryParameters['pushTokenHash'] = pushTokenHash;
    queryParameters['devicePublicKey'] = devicePublicKey;
    queryParameters['proxyServer'] = proxyServer;
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 201) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsPushServerRegistration),
      )! as NotificationsPushServerRegistration;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> removeDevice() async {
    const path = '/ocs/v2.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers);
    } else {
      throw Exception('Missing authentication for bearer');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 202) {
      return response.body;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotificationsEmptyOCS> sendAdminNotification({
    required final String userId,
    required final String shortMessage,
    final String longMessage = '',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/admin_notifications/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers);
    } else {
      throw Exception('Missing authentication for bearer');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    queryParameters['shortMessage'] = shortMessage;
    if (longMessage != '') {
      queryParameters['longMessage'] = longMessage;
    }
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsEmptyOCS),
      )! as NotificationsEmptyOCS;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class NotificationsOCSMeta implements Built<NotificationsOCSMeta, NotificationsOCSMetaBuilder> {
  factory NotificationsOCSMeta([final void Function(NotificationsOCSMetaBuilder)? b]) = _$NotificationsOCSMeta;

  // coverage:ignore-start
  const NotificationsOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<NotificationsOCSMeta> get serializer => _$notificationsOCSMetaSerializer;
}

abstract class NotificationsNotificationAction
    implements Built<NotificationsNotificationAction, NotificationsNotificationActionBuilder> {
  factory NotificationsNotificationAction([final void Function(NotificationsNotificationActionBuilder)? b]) =
      _$NotificationsNotificationAction;

  // coverage:ignore-start
  const NotificationsNotificationAction._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsNotificationAction.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get label;
  String get link;
  String get type;
  bool? get primary;
  static Serializer<NotificationsNotificationAction> get serializer => _$notificationsNotificationActionSerializer;
}

abstract class NotificationsNotification implements Built<NotificationsNotification, NotificationsNotificationBuilder> {
  factory NotificationsNotification([final void Function(NotificationsNotificationBuilder)? b]) =
      _$NotificationsNotification;

  // coverage:ignore-start
  const NotificationsNotification._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsNotification.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'notification_id')
  int get notificationId;
  String get app;
  String get user;
  String get datetime;
  @BuiltValueField(wireName: 'object_type')
  String get objectType;
  @BuiltValueField(wireName: 'object_id')
  String get objectId;
  String get subject;
  String get message;
  String get link;
  String? get subjectRich;
  JsonObject? get subjectRichParameters;
  String? get messageRich;
  JsonObject? get messageRichParameters;
  String? get icon;
  bool? get shouldNotify;
  BuiltList<NotificationsNotificationAction> get actions;
  static Serializer<NotificationsNotification> get serializer => _$notificationsNotificationSerializer;
}

abstract class NotificationsListNotifications_Ocs
    implements Built<NotificationsListNotifications_Ocs, NotificationsListNotifications_OcsBuilder> {
  factory NotificationsListNotifications_Ocs([final void Function(NotificationsListNotifications_OcsBuilder)? b]) =
      _$NotificationsListNotifications_Ocs;

  // coverage:ignore-start
  const NotificationsListNotifications_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsListNotifications_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsOCSMeta get meta;
  BuiltList<NotificationsNotification> get data;
  static Serializer<NotificationsListNotifications_Ocs> get serializer => _$notificationsListNotificationsOcsSerializer;
}

abstract class NotificationsListNotifications
    implements Built<NotificationsListNotifications, NotificationsListNotificationsBuilder> {
  factory NotificationsListNotifications([final void Function(NotificationsListNotificationsBuilder)? b]) =
      _$NotificationsListNotifications;

  // coverage:ignore-start
  const NotificationsListNotifications._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsListNotifications.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsListNotifications_Ocs get ocs;
  static Serializer<NotificationsListNotifications> get serializer => _$notificationsListNotificationsSerializer;
}

abstract class NotificationsGetNotification_Ocs
    implements Built<NotificationsGetNotification_Ocs, NotificationsGetNotification_OcsBuilder> {
  factory NotificationsGetNotification_Ocs([final void Function(NotificationsGetNotification_OcsBuilder)? b]) =
      _$NotificationsGetNotification_Ocs;

  // coverage:ignore-start
  const NotificationsGetNotification_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsGetNotification_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsOCSMeta get meta;
  NotificationsNotification get data;
  static Serializer<NotificationsGetNotification_Ocs> get serializer => _$notificationsGetNotificationOcsSerializer;
}

abstract class NotificationsGetNotification
    implements Built<NotificationsGetNotification, NotificationsGetNotificationBuilder> {
  factory NotificationsGetNotification([final void Function(NotificationsGetNotificationBuilder)? b]) =
      _$NotificationsGetNotification;

  // coverage:ignore-start
  const NotificationsGetNotification._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsGetNotification.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsGetNotification_Ocs get ocs;
  static Serializer<NotificationsGetNotification> get serializer => _$notificationsGetNotificationSerializer;
}

abstract class NotificationsEmptyOCS_Ocs implements Built<NotificationsEmptyOCS_Ocs, NotificationsEmptyOCS_OcsBuilder> {
  factory NotificationsEmptyOCS_Ocs([final void Function(NotificationsEmptyOCS_OcsBuilder)? b]) =
      _$NotificationsEmptyOCS_Ocs;

  // coverage:ignore-start
  const NotificationsEmptyOCS_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsOCSMeta get meta;
  BuiltList<JsonObject> get data;
  static Serializer<NotificationsEmptyOCS_Ocs> get serializer => _$notificationsEmptyOCSOcsSerializer;
}

abstract class NotificationsEmptyOCS implements Built<NotificationsEmptyOCS, NotificationsEmptyOCSBuilder> {
  factory NotificationsEmptyOCS([final void Function(NotificationsEmptyOCSBuilder)? b]) = _$NotificationsEmptyOCS;

  // coverage:ignore-start
  const NotificationsEmptyOCS._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEmptyOCS.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsEmptyOCS_Ocs get ocs;
  static Serializer<NotificationsEmptyOCS> get serializer => _$notificationsEmptyOCSSerializer;
}

abstract class NotificationsPushServerSubscription
    implements Built<NotificationsPushServerSubscription, NotificationsPushServerSubscriptionBuilder> {
  factory NotificationsPushServerSubscription([final void Function(NotificationsPushServerSubscriptionBuilder)? b]) =
      _$NotificationsPushServerSubscription;

  // coverage:ignore-start
  const NotificationsPushServerSubscription._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsPushServerSubscription.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get publicKey;
  String get deviceIdentifier;
  String get signature;
  String? get message;
  static Serializer<NotificationsPushServerSubscription> get serializer =>
      _$notificationsPushServerSubscriptionSerializer;
}

abstract class NotificationsPushServerRegistration_Ocs
    implements Built<NotificationsPushServerRegistration_Ocs, NotificationsPushServerRegistration_OcsBuilder> {
  factory NotificationsPushServerRegistration_Ocs([
    final void Function(NotificationsPushServerRegistration_OcsBuilder)? b,
  ]) = _$NotificationsPushServerRegistration_Ocs;

  // coverage:ignore-start
  const NotificationsPushServerRegistration_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsPushServerRegistration_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsOCSMeta get meta;
  NotificationsPushServerSubscription get data;
  static Serializer<NotificationsPushServerRegistration_Ocs> get serializer =>
      _$notificationsPushServerRegistrationOcsSerializer;
}

abstract class NotificationsPushServerRegistration
    implements Built<NotificationsPushServerRegistration, NotificationsPushServerRegistrationBuilder> {
  factory NotificationsPushServerRegistration([final void Function(NotificationsPushServerRegistrationBuilder)? b]) =
      _$NotificationsPushServerRegistration;

  // coverage:ignore-start
  const NotificationsPushServerRegistration._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsPushServerRegistration.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsPushServerRegistration_Ocs get ocs;
  static Serializer<NotificationsPushServerRegistration> get serializer =>
      _$notificationsPushServerRegistrationSerializer;
}

abstract class NotificationsCapabilities_Notifications
    implements Built<NotificationsCapabilities_Notifications, NotificationsCapabilities_NotificationsBuilder> {
  factory NotificationsCapabilities_Notifications([
    final void Function(NotificationsCapabilities_NotificationsBuilder)? b,
  ]) = _$NotificationsCapabilities_Notifications;

  // coverage:ignore-start
  const NotificationsCapabilities_Notifications._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsCapabilities_Notifications.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String>? get ocsEndpoints;
  BuiltList<String>? get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String>? get adminNotifications;
  static Serializer<NotificationsCapabilities_Notifications> get serializer =>
      _$notificationsCapabilitiesNotificationsSerializer;
}

abstract class NotificationsCapabilities implements Built<NotificationsCapabilities, NotificationsCapabilitiesBuilder> {
  factory NotificationsCapabilities([final void Function(NotificationsCapabilitiesBuilder)? b]) =
      _$NotificationsCapabilities;

  // coverage:ignore-start
  const NotificationsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotificationsCapabilities_Notifications get notifications;
  static Serializer<NotificationsCapabilities> get serializer => _$notificationsCapabilitiesSerializer;
}

abstract class NotificationsNotificationDecryptedSubject
    implements Built<NotificationsNotificationDecryptedSubject, NotificationsNotificationDecryptedSubjectBuilder> {
  factory NotificationsNotificationDecryptedSubject([
    final void Function(NotificationsNotificationDecryptedSubjectBuilder)? b,
  ]) = _$NotificationsNotificationDecryptedSubject;

  // coverage:ignore-start
  const NotificationsNotificationDecryptedSubject._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsNotificationDecryptedSubject.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  int? get nid;
  String? get app;
  String? get subject;
  String? get type;
  String? get id;
  bool? get delete;
  @BuiltValueField(wireName: 'delete-all')
  bool? get deleteAll;
  static Serializer<NotificationsNotificationDecryptedSubject> get serializer =>
      _$notificationsNotificationDecryptedSubjectSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(NotificationsListNotifications), NotificationsListNotifications.new)
      ..add(NotificationsListNotifications.serializer)
      ..addBuilderFactory(const FullType(NotificationsListNotifications_Ocs), NotificationsListNotifications_Ocs.new)
      ..add(NotificationsListNotifications_Ocs.serializer)
      ..addBuilderFactory(const FullType(NotificationsOCSMeta), NotificationsOCSMeta.new)
      ..add(NotificationsOCSMeta.serializer)
      ..addBuilderFactory(const FullType(NotificationsNotification), NotificationsNotification.new)
      ..add(NotificationsNotification.serializer)
      ..addBuilderFactory(const FullType(NotificationsNotificationAction), NotificationsNotificationAction.new)
      ..add(NotificationsNotificationAction.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(NotificationsNotificationAction)]),
        ListBuilder<NotificationsNotificationAction>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(NotificationsNotification)]),
        ListBuilder<NotificationsNotification>.new,
      )
      ..addBuilderFactory(const FullType(NotificationsGetNotification), NotificationsGetNotification.new)
      ..add(NotificationsGetNotification.serializer)
      ..addBuilderFactory(const FullType(NotificationsGetNotification_Ocs), NotificationsGetNotification_Ocs.new)
      ..add(NotificationsGetNotification_Ocs.serializer)
      ..addBuilderFactory(const FullType(NotificationsEmptyOCS), NotificationsEmptyOCS.new)
      ..add(NotificationsEmptyOCS.serializer)
      ..addBuilderFactory(const FullType(NotificationsEmptyOCS_Ocs), NotificationsEmptyOCS_Ocs.new)
      ..add(NotificationsEmptyOCS_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(const FullType(NotificationsPushServerRegistration), NotificationsPushServerRegistration.new)
      ..add(NotificationsPushServerRegistration.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsPushServerRegistration_Ocs),
        NotificationsPushServerRegistration_Ocs.new,
      )
      ..add(NotificationsPushServerRegistration_Ocs.serializer)
      ..addBuilderFactory(const FullType(NotificationsPushServerSubscription), NotificationsPushServerSubscription.new)
      ..add(NotificationsPushServerSubscription.serializer)
      ..addBuilderFactory(const FullType(NotificationsCapabilities), NotificationsCapabilities.new)
      ..add(NotificationsCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsCapabilities_Notifications),
        NotificationsCapabilities_Notifications.new,
      )
      ..add(NotificationsCapabilities_Notifications.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(NotificationsNotificationDecryptedSubject),
        NotificationsNotificationDecryptedSubject.new,
      )
      ..add(NotificationsNotificationDecryptedSubject.serializer))
    .build();

Serializers get notificationsSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeNotifications<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeNotifications<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
