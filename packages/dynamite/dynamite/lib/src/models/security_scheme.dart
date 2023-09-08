import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'security_scheme.g.dart';

abstract class SecurityScheme implements Built<SecurityScheme, SecuritySchemeBuilder> {
  factory SecurityScheme([final void Function(SecuritySchemeBuilder) updates]) = _$SecurityScheme;

  const SecurityScheme._();

  static Serializer<SecurityScheme> get serializer => _$securitySchemeSerializer;

  String get type;

  @BuiltValueField(compare: false)
  String? get description;

  String? get scheme;
}
