part of 'type_result.dart';

const _contentString = 'ContentString';

@immutable
class TypeResultObject extends TypeResult {
  TypeResultObject(
    super.className, {
    super.generics,
    super.nullable,
    super.isTypeDef,
  })  : assert(
          className != 'JsonObject' && className != 'Object' && className != 'dynamic',
          'Use TypeResultBase instead',
        ),
        super(builderName: '${className}Builder');

  @override
  String encode(
    String object, {
    required String mimeType,
  }) {
    if (className == _contentString && mimeType != 'application/json') {
      throw StateError('$_contentString should have a mimeType of application/json');
    }

    return super.encode(object, mimeType: mimeType);
  }

  @override
  TypeResultObject get dartType {
    if (generics.isEmpty) {
      return this;
    }

    return TypeResultObject(
      className,
      generics: BuiltList(generics.map((type) => type.dartType)),
      nullable: nullable,
      isTypeDef: isTypeDef,
    );
  }
}
