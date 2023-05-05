part of '../../dynamite.dart';

class TypeResultBase extends TypeResult {
  TypeResultBase(super.name);

  @override
  String? get _builderFactory => null;

  @override
  String serialize(final String object) => object;

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) =>
      name == 'String' ? object : '$object.toString()';

  @override
  String deserialize(final String object, {final bool toBuilder = false}) {
    if (name == 'JsonObject') {
      return 'JsonObject($object)';
    }
    return '($object as $name)';
  }

  @override
  String decode(final String object) {
    switch (name) {
      case 'String':
        return '($object as String)';
      case 'int':
        return 'int.parse($object as String)';
      case 'JsonObject':
        return 'JsonObject($object)';
      default:
        throw Exception('Can not decode "$name" from String');
    }
  }
}
