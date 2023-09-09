import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/models/schema.dart';

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

  bool? get required;

  Schema? get schema;

  bool get isDartRequired => isRequired(required, schema?.$default);
}
