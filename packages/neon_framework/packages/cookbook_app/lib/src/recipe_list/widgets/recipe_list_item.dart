import 'package:cookbook_app/src/recipe_list/recipe_list.dart';
import 'package:cookbook_app/src/widgets/widgets.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:flutter/material.dart';

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
