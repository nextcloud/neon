import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_cookbook/src/categories/categories.dart';
import 'package:recipe_repository/recipe_repository.dart';

/// The page for showing the categories.
class CategoriesPage extends StatelessWidget {
  /// Creates a new page for showing the categories.
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesBloc(
            recipeRepository: context.read<RecipeRepository>(),
          ),
        ),
      ],
      child: const CategoriesView(),
    );
  }
}
