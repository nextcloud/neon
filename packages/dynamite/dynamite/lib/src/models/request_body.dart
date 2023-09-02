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

  final String? description;

  final Map<String, MediaType>? content;

  final bool? required;
}
