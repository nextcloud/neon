import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';

part 'security_scheme.g.dart';

abstract class SecurityScheme implements Built<SecurityScheme, SecuritySchemeBuilder> {
  factory SecurityScheme([void Function(SecuritySchemeBuilder) updates]) = _$SecurityScheme;

  const SecurityScheme._();

  static Serializer<SecurityScheme> get serializer => _$securitySchemeSerializer;

  String get type;

  @BuiltValueField(compare: false)
  String? get description;

  String? get scheme;

  String? get $in;

  String? get name;

  @memoized
  String get fullName {
    final buffer = StringBuffer('Dynamite-')
      ..write(type)
      ..write('-');

    if (scheme != null) {
      buffer
        ..write(scheme)
        ..write('-');
    }
    if ($in != null) {
      buffer
        ..write($in)
        ..write('-');
    }
    if (name != null) {
      buffer
        ..write(name)
        ..write('-');
    }
    buffer.write('-Authentication');

    return toDartName(
      buffer.toString(),
      className: true,
    );
  }
}
