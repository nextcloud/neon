part of '../../dynamite.dart';

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
  String serialize(final String object) {
    if (className == _contentString) {
      return 'jsonSerializers.serialize(messages, specifiedType: const $fullType)';
    }

    return '$object.toJson()';
  }

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) {
    if (className == _contentString) {
      assert(mimeType == 'application/json', '$_contentString should have a mimeType of application/json');
      return object;
    }

    switch (mimeType) {
      case 'application/json':
        return 'json.encode($object)';
      case 'application/x-www-form-urlencoded':
        return 'Uri(queryParameters: $object).query';
      default:
        throw Exception('Can not encode mime type "$mimeType"');
    }
  }

  @override
  String deserialize(final String object, {final bool toBuilder = false}) {
    if (className == 'ContentString') {
      return 'jsonSerializers.deserialize(messages, specifiedType: const $fullType)! as $name${nullable ? '?' : ''}';
    }

    return '$name.fromJson($object as Object${nullable ? '?' : ''})${nullable && toBuilder ? '?' : ''}${toBuilder ? '.toBuilder()' : ''}';
  }

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
