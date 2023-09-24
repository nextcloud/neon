import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/state.dart';

List<Spec> buildSerializer(final State state) {
  if (state.resolvedTypes.isNotEmpty) {
    return [
      const Code('// coverage:ignore-start'),
      const Code('final Serializers _serializers = (Serializers().toBuilder()'),
      ...state.resolvedTypes
          .map((final type) => type.serializers)
          .expand((final element) => element)
          .toSet()
          .map(Code.new),
      const Code(').build();'),
      const Code(''),
      const Code(
        'final Serializers _jsonSerializers = (_serializers.toBuilder()..addPlugin(StandardJsonPlugin())..addPlugin(const ContentStringPlugin())).build();',
      ),
      const Code('// coverage:ignore-end'),
    ];
  }

  return [];
}
