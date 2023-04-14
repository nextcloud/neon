part of '../../dynamite.dart';

class TypeResultObject extends TypeResult {
  TypeResultObject(super.name)
      : assert(name != 'JsonObject' && name != 'Object' && name != 'dynamic', 'Use TypeResultBase instead');

  @override
  String serialize(final String object) => '$object.toJson()';

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) {
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
  String deserialize(final String object, {final bool toBuilder = false}) =>
      '$name.fromJson($object as Object)${toBuilder ? '.toBuilder()' : ''}';

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
