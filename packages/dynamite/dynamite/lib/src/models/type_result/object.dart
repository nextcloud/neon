part of 'type_result.dart';

const _contentString = 'ContentString';

@immutable
class TypeResultObject extends TypeResult {
  TypeResultObject(
    super.className, {
    super.generics,
    super.nullable,
    super.isTypeDef,
  }) : assert(
          className != 'JsonObject' && className != 'Object' && className != 'dynamic',
          'Use TypeResultBase instead',
        );

  @override
  String? get _builderFactory => '..addBuilderFactory($fullType, $name.new)';

  @override
  String? get _serializer => '..add($className.serializer)';

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) {
    if (className == _contentString) {
      assert(mimeType == 'application/json', '$_contentString should have a mimeType of application/json');
      return serialize(object);
    }

    return super.encode(object, onlyChildren: onlyChildren, mimeType: mimeType);
  }
}
