part of 'recipe_list_bloc.dart';

/// The status of the [RecipeListState].
enum RecipeListStatus {
  /// When no event has been handled.
  initial,

  /// When the categories are loading.
  loading,

  /// When the categories have been fetched successfully.
  success,

  /// When a failure occurred while loading the categories.
  failure,
}

/// State of the [RecipeListBloc].
final class RecipeListState extends Equatable {
  /// Creates a new state for managing the recipes in a category.
  RecipeListState({
    BuiltList<RecipeStub>? recipes,
    this.status = RecipeListStatus.initial,
  }) : recipes = recipes ?? BuiltList();

  /// The list of recipes.
  ///
  /// Defaults to an empty list.
  final BuiltList<RecipeStub> recipes;

  /// The status of the state.
  final RecipeListStatus status;

  /// Creates a copies with mutated fields.
  RecipeListState copyWith({
    BuiltList<RecipeStub>? recipes,
    String? error,
    RecipeListStatus? status,
  }) {
    return RecipeListState(
      recipes: recipes ?? this.recipes,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        recipes,
        status,
      ];
}
