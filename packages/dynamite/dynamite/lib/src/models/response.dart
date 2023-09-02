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

  final String description;

  final Map<String, MediaType>? content;

  final Map<String, Header>? headers;
}
