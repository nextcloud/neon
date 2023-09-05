import 'package:collection/collection.dart';
import 'package:dynamite/src/models/media_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'request_body.g.dart';

@JsonSerializable()
@immutable
class RequestBody {
  const RequestBody({
    this.description,
    this.content,
    this.required,
  });

  factory RequestBody.fromJson(final Map<String, dynamic> json) => _$RequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RequestBodyToJson(this);

  // Ignored in the comparison as it doesn't affect the generated code
  final String? description;

  final Map<String, MediaType>? content;

  final bool? required;

  @override
  bool operator ==(final Object other) =>
      other is RequestBody && const MapEquality().equals(content, other.content) && required == other.required;

  @override
  int get hashCode => const MapEquality().hash(content) + required.hashCode;
}
