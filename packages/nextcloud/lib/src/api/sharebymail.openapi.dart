// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'sharebymail.openapi.g.dart';

class SharebymailResponse<T, U> extends DynamiteResponse<T, U> {
  SharebymailResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'SharebymailResponse(data: $data, headers: $headers)';
}

class SharebymailApiException extends DynamiteApiException {
  SharebymailApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<SharebymailApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return SharebymailApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'SharebymailApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class SharebymailClient extends DynamiteClient {
  SharebymailClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  SharebymailClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );
}

abstract class SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        Built<SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop,
            SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  factory SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop([
    final void Function(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)? b,
  ]) = _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get enabled;
  static Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer;
}

abstract class SharebymailCapabilities_FilesSharing_Sharebymail_Password
    implements
        Built<SharebymailCapabilities_FilesSharing_Sharebymail_Password,
            SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder> {
  factory SharebymailCapabilities_FilesSharing_Sharebymail_Password([
    final void Function(SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$SharebymailCapabilities_FilesSharing_Sharebymail_Password;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing_Sharebymail_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing_Sharebymail_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get enabled;
  bool get enforced;
  static Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_Password> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSharebymailPasswordSerializer;
}

abstract class SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate
    implements
        Built<SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate,
            SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate([
    final void Function(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get enabled;
  bool get enforced;
  static Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSharebymailExpireDateSerializer;
}

abstract class SharebymailCapabilities_FilesSharing_Sharebymail
    implements
        Built<SharebymailCapabilities_FilesSharing_Sharebymail,
            SharebymailCapabilities_FilesSharing_SharebymailBuilder> {
  factory SharebymailCapabilities_FilesSharing_Sharebymail([
    final void Function(SharebymailCapabilities_FilesSharing_SharebymailBuilder)? b,
  ]) = _$SharebymailCapabilities_FilesSharing_Sharebymail;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing_Sharebymail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing_Sharebymail.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop get uploadFilesDrop;
  SharebymailCapabilities_FilesSharing_Sharebymail_Password get password;
  @BuiltValueField(wireName: 'expire_date')
  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate get expireDate;
  static Serializer<SharebymailCapabilities_FilesSharing_Sharebymail> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSharebymailSerializer;
}

abstract class SharebymailCapabilities_FilesSharing
    implements Built<SharebymailCapabilities_FilesSharing, SharebymailCapabilities_FilesSharingBuilder> {
  factory SharebymailCapabilities_FilesSharing([final void Function(SharebymailCapabilities_FilesSharingBuilder)? b]) =
      _$SharebymailCapabilities_FilesSharing;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  SharebymailCapabilities_FilesSharing_Sharebymail get sharebymail;
  static Serializer<SharebymailCapabilities_FilesSharing> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSerializer;
}

abstract class SharebymailCapabilities implements Built<SharebymailCapabilities, SharebymailCapabilitiesBuilder> {
  factory SharebymailCapabilities([final void Function(SharebymailCapabilitiesBuilder)? b]) = _$SharebymailCapabilities;

  // coverage:ignore-start
  const SharebymailCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'files_sharing')
  SharebymailCapabilities_FilesSharing get filesSharing;
  static Serializer<SharebymailCapabilities> get serializer => _$sharebymailCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(SharebymailCapabilities), SharebymailCapabilities.new)
      ..add(SharebymailCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing),
        SharebymailCapabilities_FilesSharing.new,
      )
      ..add(SharebymailCapabilities_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing_Sharebymail),
        SharebymailCapabilities_FilesSharing_Sharebymail.new,
      )
      ..add(SharebymailCapabilities_FilesSharing_Sharebymail.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop),
        SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.new,
      )
      ..add(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_Password),
        SharebymailCapabilities_FilesSharing_Sharebymail_Password.new,
      )
      ..add(SharebymailCapabilities_FilesSharing_Sharebymail_Password.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate),
        SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.new,
      )
      ..add(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.serializer))
    .build();

Serializers get sharebymailSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeSharebymail<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeSharebymail<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
