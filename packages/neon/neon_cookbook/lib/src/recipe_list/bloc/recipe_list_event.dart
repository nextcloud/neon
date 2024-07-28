part of 'recipe_list_bloc.dart';

/// Events for the [RecipeListBloc].
sealed class _RecipeListEvent extends Equatable {
  const _RecipeListEvent();

  @override
  List<Object> get props => [];
}

/// {@template RefreshRecipeList}
/// Event that triggers a reload of the recipe list.
/// {@endtemplate}
final class RefreshRecipeList extends _RecipeListEvent {
  /// {@macro RefreshRecipeList}
  const RefreshRecipeList();
}
