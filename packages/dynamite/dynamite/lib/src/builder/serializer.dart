import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/state.dart';

List<Spec> buildSerializer(final State state) => [
      const Code('// coverage:ignore-start\n'),
      Field((final b) {
        b
          ..annotations.add(refer('visibleForTesting'))
          ..modifier = FieldModifier.final$
          ..type = refer('Serializers')
          ..name = 'serializers';

        final serializers =
            state.resolvedTypes.map((final type) => type.serializers).expand((final element) => element).toSet();

        final bodyBuilder = StringBuffer()
          ..writeln('(Serializers().toBuilder()')
          ..writeAll(serializers, '\n')
          ..writeln(').build()');

        b.assignment = Code(bodyBuilder.toString());
      }),
      Field((final b) {
        b
          ..annotations.add(refer('visibleForTesting'))
          ..modifier = FieldModifier.final$
          ..type = refer('Serializers')
          ..name = 'jsonSerializers';

        const serializers = [
          '..add(DynamiteDoubleSerializer())',
          '..addPlugin(StandardJsonPlugin())',
          '..addPlugin(const HeaderPlugin())',
          '..addPlugin(const ContentStringPlugin())',
        ];

        final bodyBuilder = StringBuffer()
          ..writeln('(serializers.toBuilder()')
          ..writeAll(serializers, '\n')
          ..writeln(').build()');

        b.assignment = Code(bodyBuilder.toString());
      }),
      const Code('// coverage:ignore-end\n'),
    ];
