import 'package:collection/collection.dart';
import 'package:dynamite/src/models/header.dart';
import 'package:dynamite/src/models/media_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'response.g.dart';

@JsonSerializable()
@immutable
class Response {
  const Response({
    required this.description,
    this.content,
    this.headers,
  });

  factory Response.fromJson(final Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  // Ignored in the comparison as it doesn't affect the generated code
  final String description;

  final Map<String, MediaType>? content;

  final Map<String, Header>? headers;

  @override
  bool operator ==(final Object other) =>
      other is Response &&
      const MapEquality().equals(content, other.content) &&
      const MapEquality().equals(headers, other.headers);

  @override
  int get hashCode => const MapEquality().hash(content) + const MapEquality().hash(headers);
}
