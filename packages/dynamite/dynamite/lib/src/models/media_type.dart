import 'package:dynamite/src/models/schema.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'media_type.g.dart';

@JsonSerializable()
@immutable
class MediaType {
  const MediaType({
    this.schema,
  });

  factory MediaType.fromJson(final Map<String, dynamic> json) => _$MediaTypeFromJson(json);
  Map<String, dynamic> toJson() => _$MediaTypeToJson(this);

  final Schema? schema;

  @override
  bool operator ==(final Object other) => other is MediaType && schema == other.schema;

  @override
  int get hashCode => schema.hashCode;
}
