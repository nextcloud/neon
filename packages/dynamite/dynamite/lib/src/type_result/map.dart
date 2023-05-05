part of '../../dynamite.dart';

class TypeResultMap extends TypeResult {
  TypeResultMap(
    super.name,
    final TypeResult subType,
  ) : super(generics: [TypeResultBase('String'), subType]);

  TypeResult get subType => generics[1];

  @override
  String? get _builderFactory => '..addBuilderFactory($fullType, ListBuilder<String, ${subType.className}>.new)';

  @override
  String serialize(final String object) => object;

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
      '($object as $className<String, ${subType.name}>)${toBuilder ? '.toBuilder()' : ''}';

  @override
  String decode(final String object) => 'json.decode($object as String)';
}
