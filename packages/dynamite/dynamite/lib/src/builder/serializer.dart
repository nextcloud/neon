import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/state.dart';

List<Spec> buildSerializer(final State state) => [
      const Code('// coverage:ignore-start'),
      const Code('@visibleForTesting'),
      const Code('final Serializers serializers = (Serializers().toBuilder()'),
      ...state.resolvedTypes
          .map((final type) => type.serializers)
          .expand((final element) => element)
          .toSet()
          .map(Code.new),
      const Code(').build();'),
      const Code(''),
      const Code('@visibleForTesting'),
      const Code(
        'final Serializers jsonSerializers = (serializers.toBuilder()..add(DynamiteDoubleSerializer())..addPlugin(StandardJsonPlugin())..addPlugin(const HeaderPlugin())..addPlugin(const ContentStringPlugin())).build();',
      ),
      const Code('// coverage:ignore-end'),
    ];
