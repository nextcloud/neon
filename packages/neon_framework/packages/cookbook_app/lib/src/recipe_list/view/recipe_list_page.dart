import 'package:cookbook_app/src/recipe_list/recipe_list.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The page for displaying the recipes in a category.
class RecipeListPage extends StatelessWidget {
  /// Creates a new category page.
  const RecipeListPage({super.key});

  /// The route to navigate to this  page.
  static Route<void> route({
    required Category category,
    required RecipeRepository recipeRepository,
  }) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RecipeListBloc(
              category: category,
              // If the repository where to be inserted above the main app we could easily access it everywhere :(
              recipeRepository: recipeRepository, //context.read<RecipeRepository>(),
            ),
          ),
          RepositoryProvider.value(value: recipeRepository),
        ],
        child: const RecipeListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const RecipeListView();
  }
}
