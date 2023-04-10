part of '../../dynamite.dart';

class TypeResultObject extends TypeResult {
  TypeResultObject(
    super.name, {
    this.fromContentString = false,
  }) : assert(name != 'JsonObject' && name != 'Object' && name != 'dynamic', 'Use TypeResultBase instead');

  final bool fromContentString;

  @override
  String serialize(final String object) {
    if (fromContentString) {
      return '$name.toJsonString($object)';
    }
    return '$object.toJson()';
  }

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
  String deserialize(final String object, {final bool toBuilder = false}) {
    if (fromContentString) {
      return '$name.fromJsonString($object as String)${toBuilder ? '.toBuilder()' : ''}';
    }
    return '$name.fromJson($object as Object)${toBuilder ? '.toBuilder()' : ''}';
  }

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
