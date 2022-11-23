part of '../../dynamite.dart';

class TypeResultEnum extends TypeResult {
  TypeResultEnum(
    super.typeName,
    this.subType,
  );

  final TypeResult subType;

  @override
  String serialize(final String object) => '$object.value';

  @override
  String encode(final String object) => subType.encode(object);

  @override
  String deserialize(final String object) => '$name.fromValue($object as ${subType.name})';

  @override
  String decode(final String object) => subType.decode(object);
}
