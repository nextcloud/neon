import 'package:cookbook_app/l10n/l10n.dart';
import 'package:cookbook_app/src/recipe_list/recipe_list.dart';
import 'package:cookbook_app/src/widgets/widgets.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The material design view for the recipe list page.
class RecipeListView extends StatelessWidget {
  /// Creates a new recipe list view.
  const RecipeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final category = context.select<RecipeListBloc, Category>((bloc) => bloc.category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.recipeListTitle(
            context.l10n.categoryName(category.name),
          ),
        ),
      ),
      body: LoadingRefreshIndicator(
        isLoading: context.select<RecipeListBloc, bool>(
          (bloc) => bloc.state.status == RecipeListStatus.loading,
        ),
        onRefresh: () {
          context.read<RecipeListBloc>().add(const RefreshRecipeList());
        },
        child: BlocConsumer<RecipeListBloc, RecipeListState>(
          listener: (context, state) {
            if (state.status == RecipeListStatus.failure) {
              final theme = Theme.of(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.l10n.errorLoadFailed,
                    style: TextStyle(
                      color: theme.colorScheme.onErrorContainer,
                    ),
                  ),
                  backgroundColor: theme.colorScheme.errorContainer,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == RecipeListStatus.initial) {
              return const SizedBox();
            }

            if (state.status != RecipeListStatus.loading && state.recipes.isEmpty) {
              return Center(
                child: Text(context.l10n.noRecipes),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.separated(
                itemCount: state.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = state.recipes[index];

                  return RecipeListItem(recipe: recipe);
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            );
          },
        ),
      ),
    );
  }
}
