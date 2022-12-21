part of '../../dynamite.dart';

class TypeResultObject extends TypeResult {
  TypeResultObject(
    super.name, {
    this.fromJsonString = false,
  });

  final bool fromJsonString;

  @override
  String serialize(final String object) {
    if (fromJsonString) {
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
  String deserialize(final String object) {
    if (fromJsonString) {
      return '$name.fromJsonString($object as String)';
    }
    return '$name.fromJson($object as Map<String, dynamic>)';
  }

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
