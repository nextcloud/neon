part of '../../dynamite.dart';

abstract class TypeResult {
  TypeResult(
    this.className, {
    this.generics = const [],
    this.nullable = false,
  })  : assert(!className.contains('<'), 'Specifiy generics in the generics parameter.'),
        assert(!className.contains('?'), 'Nullability should not be specified in the type.');

  final String className;
  final List<TypeResult> generics;
  final bool nullable;

  String get name {
    if (generics.isNotEmpty) {
      final buffer = StringBuffer('$className<')
        ..writeAll(generics.map((final c) => c.name).intersperse(', '))
        ..write('>');
      return buffer.toString();
    }

    return className;
  }

  String get fullType {
    if (generics.isNotEmpty) {
      final buffer = StringBuffer('FullType($className, [')
        ..writeAll(generics.map((final c) => c.fullType).intersperse(', '))
        ..write('])');

      return buffer.toString();
    }

    return 'FullType($className)';
  }

  List<String> get builderFactories => [
        for (final class_ in generics) ...[
          ...class_.builderFactories,
        ],
        if (_builderFactory != null) ...[
          _builderFactory!,
        ],
      ];

  String? get _builderFactory;

  String serialize(final String object);

  String deserialize(final String object, {final bool toBuilder = false});

  String decode(final String object);

  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  });

  String get nullableName => nullable ? '$name?' : name;

  /// Native dart type equivalent
  // ignore: avoid_returning_this
  TypeResult get dartType => this;
}
