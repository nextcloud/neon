part of '../../dynamite.dart';

class TypeResultList extends TypeResult {
  TypeResultList(
    super.name,
    this.subType, {
    this.fromJsonString = false,
  });

  final TypeResult subType;
  final bool fromJsonString;

  @override
  String serialize(final String object) => '$object.map((final e) => ${subType.serialize('e')}).toList()';

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) {
    if (onlyChildren) {
      return '$object.map((final e) => ${subType.encode('e')}).toList()';
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
  String deserialize(final String object) => '($object as List).map((final e) => ${subType.deserialize('e')}).toList()';

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
