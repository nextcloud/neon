import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'tag.g.dart';

@JsonSerializable()
@immutable
class Tag {
  const Tag({
    required this.name,
    this.description,
  });

  factory Tag.fromJson(final Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);

  final String name;

  final String? description;
}
