import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/state.dart';

List<Spec> buildSerializer(final State state) => [
      const Code('// coverage:ignore-start\n'),
      Field((final b) {
        b
          ..docs.add(r'''
/// Serializer for all values in this library.
/// 
/// Serializes values into the `built_value` wire format.
/// See: [$jsonSerializers] for serializing into json.''')
          ..annotations.add(refer('visibleForTesting'))
          ..modifier = FieldModifier.final$
          ..type = refer('Serializers')
          ..name = r'$serializers'
          ..assignment = const Code(r'_$serializers');
      }),
      Field((final b) {
        b
          ..modifier = FieldModifier.final$
          ..type = refer('Serializers')
          ..name = r'_$serializers';

        final serializers =
            state.resolvedTypes.map((final type) => type.serializers).expand((final element) => element).toSet();

        if (serializers.isEmpty) {
          b.assignment = const Code('Serializers()');
        } else {
          final bodyBuilder = StringBuffer()
            ..writeln('(Serializers().toBuilder()')
            ..writeAll(serializers, '\n')
            ..writeln(').build()');

          b.assignment = Code(bodyBuilder.toString());
        }
      }),
      Field((final b) {
        b
          ..docs.add(r'''
/// Serializer for all values in this library.
/// 
/// Serializes values into the json. Json serialization is more expensive than the built_value wire format.
/// See: [$serializers] for serializing into the `built_value` wire format.''')
          ..annotations.add(refer('visibleForTesting'))
          ..modifier = FieldModifier.final$
          ..type = refer('Serializers')
          ..name = r'$jsonSerializers'
          ..assignment = const Code(r'_$jsonSerializers');
      }),
      Field((final b) {
        b
          ..modifier = FieldModifier.final$
          ..type = refer('Serializers')
          ..name = r'_$jsonSerializers';

        const serializers = [
          '..add(DynamiteDoubleSerializer())',
          '..addPlugin(StandardJsonPlugin())',
          '..addPlugin(const HeaderPlugin())',
          '..addPlugin(const ContentStringPlugin())',
        ];

        final bodyBuilder = StringBuffer()
          ..writeln(r'(_$serializers.toBuilder()')
          ..writeAll(serializers, '\n')
          ..writeln(').build()');

        b.assignment = Code(bodyBuilder.toString());
      }),
      const Code('// coverage:ignore-end\n'),
    ];
