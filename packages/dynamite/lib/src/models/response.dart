import 'package:dynamite/src/models/media_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  Response({
    required this.description,
    required this.content,
  });

  factory Response.fromJson(final Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  final String description;

  final Map<String, MediaType>? content;
}
