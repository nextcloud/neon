import 'package:cookbook_app/src/home/home.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_framework/models.dart';
import 'package:nextcloud/cookbook.dart';

/// The main page of the cookbook app.
class HomePage extends StatelessWidget {
  /// Creates a new home page for the cookbook app.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RecipeRepository>(
          create: (context) {
            final account = context.read<Account>();
            final categoryProvider = account.client.cookbook.categories;
            final recipeProvider = account.client.cookbook.recipes;

            return RecipeRepository(
              categoriesProvider: categoryProvider,
              recipesProvider: recipeProvider,
            );
          },
        ),
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: const HomeView(),
    );
  }
}
