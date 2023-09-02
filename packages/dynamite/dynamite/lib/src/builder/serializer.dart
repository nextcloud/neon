import 'package:dynamite/src/builder/state.dart';

List<String> buildSerializer(final State state) {
  if (state.resolvedTypes.isNotEmpty) {
    return [
      '// coverage:ignore-start',
      'final Serializers _serializers = (Serializers().toBuilder()',
      ...state.resolvedTypes.map((final type) => type.serializers).expand((final element) => element).toSet(),
      ').build();',
      '',
      'Serializers get ${state.variablePrefix}Serializers => _serializers;',
      '',
      'final Serializers _jsonSerializers = (_serializers.toBuilder()..addPlugin(StandardJsonPlugin())..addPlugin(const ContentStringPlugin())).build();',
      '',
      'T deserialize${state.classPrefix}<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;',
      '',
      'Object? serialize${state.classPrefix}<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));',
      '// coverage:ignore-end',
    ];
  }

  return [];
}
