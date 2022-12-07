part of '../../dynamite.dart';

class TypeResultMap extends TypeResult {
  TypeResultMap(
    super.name,
    this.subType,
  );

  final TypeResult subType;

  @override
  String serialize(final String object) => object;

  @override
  String encode(final String object, {final bool onlyChildren = false}) => 'json.encode($object)';

  @override
  String deserialize(final String object) => '($object as Map<String, ${subType.name}>)';

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
