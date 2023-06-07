part of 'type_result.dart';

const _contentString = 'ContentString';

class TypeResultObject extends TypeResult {
  TypeResultObject(
    super.className, {
    super.generics,
    super.nullable,
  }) : assert(
          className != 'JsonObject' && className != 'Object' && className != 'dynamic',
          'Use TypeResultBase instead',
        );

  @override
  String? get _builderFactory => '..addBuilderFactory($fullType, $name.new)';

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
