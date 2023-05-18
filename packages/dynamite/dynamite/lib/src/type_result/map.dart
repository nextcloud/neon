part of '../../dynamite.dart';

class TypeResultMap extends TypeResult {
  TypeResultMap(
    super.name,
    final TypeResult subType, {
    super.nullable,
  }) : super(generics: [TypeResultBase('String'), subType]);

  TypeResult get subType => generics[1];

  @override
  String? get _builderFactory => '..addBuilderFactory($fullType, MapBuilder<String, ${subType.className}>.new)';

  @override
  TypeResultMap get dartType => TypeResultMap('Map', subType, nullable: nullable);
}
