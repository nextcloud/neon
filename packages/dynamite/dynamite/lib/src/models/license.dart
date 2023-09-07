import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'license.g.dart';

@JsonSerializable()
@immutable
class License {
  const License({
    required this.name,
    this.identifier,
    this.url,
  });

  factory License.fromJson(final Map<String, dynamic> json) => _$LicenseFromJson(json);
  Map<String, dynamic> toJson() => _$LicenseToJson(this);

  final String name;

  final String? identifier;

  final String? url;

  @override
  bool operator ==(final Object other) =>
      other is License && name == other.name && identifier == other.identifier && url == other.url;

  @override
  int get hashCode => name.hashCode + identifier.hashCode + url.hashCode;
}
