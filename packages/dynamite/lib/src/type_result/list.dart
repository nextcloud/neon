part of '../../dynamite.dart';

class TypeResultList extends TypeResult {
  TypeResultList(
    super.name,
    this.subType,
  );

  final TypeResult subType;

  @override
  String serialize(final String object) => '$object.map((final e) => ${subType.serialize('e')}).toList()';

  @override
  String encode(final String object) => 'json.encode($object)';

  @override
  String deserialize(final String object) => '($object as List).map((final e) => ${subType.deserialize('e')}).toList()';

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
