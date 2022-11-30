import 'package:json_annotation/json_annotation.dart';

part 'discriminator.g.dart';

@JsonSerializable()
class Discriminator {
  Discriminator({
    required this.propertyName,
    this.mapping,
  });

  factory Discriminator.fromJson(final Map<String, dynamic> json) => _$DiscriminatorFromJson(json);
  Map<String, dynamic> toJson() => _$DiscriminatorToJson(this);

  final String propertyName;

  final Map<String, String>? mapping;
}
