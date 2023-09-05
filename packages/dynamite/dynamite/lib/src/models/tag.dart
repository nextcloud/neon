import 'package:dynamite/src/helpers/docs.dart';
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

  // Ignored in the comparison as it doesn't affect the generated code
  final String? description;

  Iterable<String> get formattedDescription => descriptionToDocs(description);

  @override
  bool operator ==(final Object other) => other is Tag && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
