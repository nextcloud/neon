part of '../../dynamite.dart';

class TypeResultObject extends TypeResult {
  TypeResultObject(
    super.typeName,
  );

  @override
  String serialize(final String object) => '$object.toJson()';

  @override
  String encode(final String object) => 'json.encode($object)';

  @override
  String deserialize(final String object) => '$name.fromJson($object as Map<String, dynamic>)';

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
