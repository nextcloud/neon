import 'package:intersperse/intersperse.dart';
import 'package:meta/meta.dart';

part 'base.dart';
part 'enum.dart';
part 'list.dart';
part 'map.dart';
part 'object.dart';

@immutable
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

  /// Serializes the variable named [object].
  ///
  /// The serialized result is an [Object]?
  String serialize(final String object) => '_jsonSerializers.serialize($object, specifiedType: const $fullType)';

  /// Deserializes the variable named [object].
  ///
  /// The serialized result will be of [name].
  String deserialize(final String object) =>
      '(_jsonSerializers.deserialize($object, specifiedType: const $fullType)! as $name)';

  /// Decodes the variable named [object].
  String decode(final String object) => 'json.decode($object as String)';

  /// Encodes the variable named [object].
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) {
    final serialized = serialize(object);

    switch (mimeType) {
      case 'application/json':
        return 'json.encode($serialized)';
      case 'application/x-www-form-urlencoded':
        return 'Uri(queryParameters: $serialized! as Map<String, dynamic>).query';
      default:
        throw Exception('Can not encode mime type "$mimeType"');
    }
  }

  /// Nullable TypeName
  String get nullableName => nullable ? '$name?' : name;

  /// Native dart type equivalent
  // ignore: avoid_returning_this
  TypeResult get dartType => this;

  @override
  bool operator ==(final Object other) =>
      other is TypeResult && other.className == className && other.generics == generics && other.nullable == nullable;

  @override
  int get hashCode => className.hashCode + generics.hashCode + nullable.hashCode;
}
