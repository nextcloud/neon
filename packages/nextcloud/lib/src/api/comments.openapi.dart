// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'comments.openapi.g.dart';

class CommentsClient extends DynamiteClient {
  CommentsClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  CommentsClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );
}

@BuiltValue(instantiable: false)
abstract interface class CommentsCapabilities_FilesInterface {
  bool get comments;
  CommentsCapabilities_FilesInterface rebuild(final void Function(CommentsCapabilities_FilesInterfaceBuilder) updates);
  CommentsCapabilities_FilesInterfaceBuilder toBuilder();
}

abstract class CommentsCapabilities_Files
    implements
        CommentsCapabilities_FilesInterface,
        Built<CommentsCapabilities_Files, CommentsCapabilities_FilesBuilder> {
  factory CommentsCapabilities_Files([final void Function(CommentsCapabilities_FilesBuilder)? b]) =
      _$CommentsCapabilities_Files;

  // coverage:ignore-start
  const CommentsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CommentsCapabilities_Files> get serializer => _$commentsCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CommentsCapabilitiesInterface {
  CommentsCapabilities_Files get files;
  CommentsCapabilitiesInterface rebuild(final void Function(CommentsCapabilitiesInterfaceBuilder) updates);
  CommentsCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CommentsCapabilities
    implements CommentsCapabilitiesInterface, Built<CommentsCapabilities, CommentsCapabilitiesBuilder> {
  factory CommentsCapabilities([final void Function(CommentsCapabilitiesBuilder)? b]) = _$CommentsCapabilities;

  // coverage:ignore-start
  const CommentsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CommentsCapabilities> get serializer => _$commentsCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(CommentsCapabilities), CommentsCapabilities.new)
      ..add(CommentsCapabilities.serializer)
      ..addBuilderFactory(const FullType(CommentsCapabilities_Files), CommentsCapabilities_Files.new)
      ..add(CommentsCapabilities_Files.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
