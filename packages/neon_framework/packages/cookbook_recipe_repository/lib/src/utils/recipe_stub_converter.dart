import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:cookbook_recipe_repository/src/models/models.dart';
import 'package:cookbook_recipe_repository/src/utils/utils.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;
import 'package:timezone/timezone.dart' as tz;

/// Converter for converting a nextcloud package recipe into the representation used by the repository.
final class RecipeStubConverter extends Converter<cookbook.RecipeStub, RecipeStub> {
  /// Creates a new recipe converter.
  const RecipeStubConverter();

  @override
  RecipeStub convert(cookbook.RecipeStub input) {
    return RecipeStub((b) {
      b
        ..dateCreated = Iso8601DateTime.tryParse(tz.UTC, input.dateCreated)
        ..dateModified = Iso8601DateTime.tryParse(tz.UTC, input.dateModified)
        ..id = input.id
        ..imagePlaceholderUrl = Uri.tryParse(input.imagePlaceholderUrl)
        ..imageUrl = Uri.tryParse(input.imageUrl)
        ..keywords = input.keywords.split(',').toBuiltSet()
        ..name = input.name;
    });
  }
}
