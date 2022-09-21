import 'package:dynamite/src/models/schema.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_type.g.dart';

@JsonSerializable()
class MediaType {
  MediaType({
    required this.schema,
  });

  factory MediaType.fromJson(final Map<String, dynamic> json) => _$MediaTypeFromJson(json);
  Map<String, dynamic> toJson() => _$MediaTypeToJson(this);

  final Schema? schema;
}
