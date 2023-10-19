import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/models/openapi/schema.dart';

part 'parameter.g.dart';

abstract class Parameter implements Built<Parameter, ParameterBuilder> {
  factory Parameter([final void Function(ParameterBuilder) updates]) = _$Parameter;

  const Parameter._();

  static Serializer<Parameter> get serializer => _$parameterSerializer;

  String get name;

  @BuiltValueField(wireName: 'in')
  String get $in;

  @BuiltValueField(compare: false)
  String? get description;

  bool get required;

  Schema? get schema;

  @BuiltValueHook(finalizeBuilder: true)
  static void _defaults(final ParameterBuilder b) {
    b.required ??= false;
  }

  bool get isDartRequired => isRequired(required, schema);

  String get formattedDescription {
    final name = toDartName(this.name);

    final buffer = StringBuffer()
      ..write('$docsSeparator   * ')
      ..write('[$name]');

    if (description != null) {
      buffer.write(' $description');
    }

    return buffer.toString();
  }
}
