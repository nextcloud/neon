part of '../../dynamite.dart';

class TypeResultObject extends TypeResult {
  TypeResultObject(
    super.typeName, {
    this.fromJsonString = false,
  });

  final bool fromJsonString;

  @override
  String serialize(final String object) {
    if (fromJsonString) {
      return '$object.toJsonString()';
    }
    return '$object.toJson()';
  }

  @override
  String encode(final String object) => 'json.encode($object)';

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
