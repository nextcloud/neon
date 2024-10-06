import 'package:cookbook_app/l10n/l10n.dart';
import 'package:cookbook_app/src/recipe_list/recipe_list.dart';
import 'package:cookbook_app/src/widgets/widgets.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_framework/widgets.dart';

/// The material design card for the categories screen.
class CategoryCard extends StatelessWidget {
  /// Creates a new categories card.
  const CategoryCard({
    required this.category,
    super.key,
  });

  /// The category displayed on the card.
  final Category category;

  // TODO: this is really ugly.
  static const double _spacer = 8;
  static const _labelPadding = EdgeInsets.symmetric(horizontal: 8);
  static TextStyle _nameStyle(BuildContext context) => Theme.of(context).textTheme.labelSmall!;
  static TextStyle _itemStyle(BuildContext context) => Theme.of(context).textTheme.labelSmall!;

  /// Calculates the hight this card will take if built with the same context.
  static double hightExtend(BuildContext context) =>
      _spacer + _itemStyle(context).fontSize! + _itemStyle(context).fontSize! + 2 * _labelPadding.horizontal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth;

        return GestureDetector(
          child: Card(
            color: theme.colorScheme.secondaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeonImageWrapper(
                  borderRadius: BorderRadius.circular(12),
                  child: RecipeImage(
                    recipeID: category.mainRecipeId,
                    size: Size.square(size),
                  ),
                ),
                const SizedBox(height: _spacer),
                Padding(
                  padding: _labelPadding,
                  child: Text(
                    context.l10n.categoryName(category.name),
                    maxLines: 1,
                    style: _nameStyle(context),
                  ),
                ),
                Padding(
                  padding: _labelPadding,
                  child: Text(
                    context.l10n.categoryItems(category.recipeCount),
                    style: _itemStyle(context),
                  ),
                ),
              ],
            ),
          ),
          onTap: () async => Navigator.of(context).push(
            RecipeListPage.route(
              category: category,
              recipeRepository: context.read<RecipeRepository>(),
            ),
          ),
        );
      },
    );
  }
}
