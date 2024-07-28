import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:timezone/timezone.dart' as tz;

part 'recipe_stub.g.dart';

/// The model of a RecipeStub.
///
/// This class is closely related to the one from the cookbook api.
/// It deserializes the time and uri fields.
@BuiltValue(nestedBuilders: false)
abstract class RecipeStub implements Built<RecipeStub, RecipeStubBuilder> {
  /// Creates a new recipe stub.
  factory RecipeStub([void Function(RecipeStubBuilder) updates]) = _$RecipeStub;
  RecipeStub._();

  /// The date the recipe was created in the app.
  tz.TZDateTime get dateCreated;

  /// The date the recipe was modified lastly in the app.
  tz.TZDateTime? get dateModified;

  /// The identifier of the recipe.
  String get id;

  /// The URL of the placeholder of the recipe image.
  Uri? get imagePlaceholderUrl;

  /// The URL of the recipe image.
  Uri? get imageUrl;

  /// A comma-separated list of recipe keywords, can be empty string.
  BuiltSet<String> get keywords;

  /// The name of the recipe.
  String get name;
}
