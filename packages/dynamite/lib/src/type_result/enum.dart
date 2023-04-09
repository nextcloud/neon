part of '../../dynamite.dart';

class TypeResultEnum extends TypeResult {
  TypeResultEnum(
    super.name,
    this.subType,
  );

  final TypeResult subType;

  @override
  String serialize(final String object) => '$object.name';

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) =>
      subType.encode(object);

  @override
  String deserialize(final String object) => '$name.valueOf($object as ${subType.name})';

  @override
  String decode(final String object) => subType.decode(object);
}
