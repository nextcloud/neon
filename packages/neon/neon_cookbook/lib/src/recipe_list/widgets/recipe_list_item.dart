import 'package:flutter/material.dart';
import 'package:neon_cookbook/src/recipe_list/recipe_list.dart';
import 'package:neon_cookbook/src/widgets/widgets.dart';
import 'package:recipe_repository/recipe_repository.dart';

/// The Item to display the recipe information in the recipe list.
class RecipeListItem extends StatelessWidget {
  /// Creates a new recipe list item for the given [recipe].
  const RecipeListItem({
    required this.recipe,
    super.key,
  });

  /// The recipe to display the information for.
  final RecipeStub recipe;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: RecipeImage(
          recipeID: recipe.id,
          size: const Size.square(80),
        ),
      ),
      title: Text(recipe.name),
      subtitle: Row(
        children: [
          DateChip(
            date: recipe.dateCreated,
            icon: Icons.edit_calendar_outlined,
          ),
          if (recipe.dateModified != null && recipe.dateModified != recipe.dateCreated)
            DateChip(
              date: recipe.dateModified!,
              icon: Icons.edit_outlined,
            ),
        ],
      ),
      onTap: () async => throw UnimplementedError('navigate to RecipePage'),
    );
  }
}
