import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/exceptions.dart';
import 'package:dynamite/src/models/openapi/media_type.dart';
import 'package:dynamite/src/models/openapi/schema.dart';

part 'parameter.g.dart';

abstract class Parameter implements Built<Parameter, ParameterBuilder> {
  factory Parameter([final void Function(ParameterBuilder) updates]) = _$Parameter;

  const Parameter._();

  static Serializer<Parameter> get serializer => _$parameterSerializer;

  String get name;

  @BuiltValueField(wireName: 'in')
  ParameterType get $in;

  @BuiltValueField(compare: false)
  String? get description;

  bool get required;

  @Deprecated('Use [schema] instead which also automatically handles [content].')
  @BuiltValueField(wireName: 'schema')
  Schema? get $schema;

  BuiltMap<String, MediaType>? get content;

  Schema? get schema {
    // ignore: deprecated_member_use_from_same_package
    if ($schema != null) {
      // ignore: deprecated_member_use_from_same_package
      return $schema;
    }

    if (content != null && content!.isNotEmpty) {
      if (content!.length > 1) {
        print('Can not work with multiple mime types right now. Using the first supported.');
      }
      return Schema(
        (final b) => b
          ..type = SchemaType.string
          ..contentMediaType = content!.entries.first.key
          ..contentSchema = content!.entries.first.value.schema!.toBuilder(),
      );
    }

    return null;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _defaults(final ParameterBuilder b) {
    b.required ??= false;
    if (b.$in == ParameterType.path && !b.required!) {
      throw OpenAPISpecError('Path parameters must be required but ${b.name} is not.');
    }

    if (b.required! && b._$schema != null && b.$schema.$default != null) {
      print('Required parameters should not specify default values.');
    }

    if (b._$schema != null && b._content != null) {
      throw OpenAPISpecError('Only one of schema or content must be set in parameter ${b.name}.');
    }
  }

  String get formattedDescription {
    final name = toDartName(this.name);

    final buffer = StringBuffer()
      ..write('$docsSeparator   * ')
      ..write('[$name]');

    if (description != null) {
      buffer.write(' $description');
      if (!description!.endsWith('.')) {
        buffer.write('.');
      }
    }

    Object? $default = schema?.$default;
    if ($default != null) {
      if ($default.toString() == '') {
        $default = "''";
      }

      buffer.write(' Defaults to `${$default}`.');
    }

    return buffer.toString();
  }
}

class ParameterType extends EnumClass {
  const ParameterType._(super.name);

  static const ParameterType path = _$parameterTypePath;
  static const ParameterType query = _$parameterTypeQuery;
  static const ParameterType header = _$parameterTypeHeader;
  static const ParameterType cookie = _$parameterTypeCookie;

  static BuiltSet<ParameterType> get values => _$parameterTypeValues;

  static ParameterType valueOf(final String name) => _$parameterType(name);

  static Serializer<ParameterType> get serializer => _$parameterTypeSerializer;
}
