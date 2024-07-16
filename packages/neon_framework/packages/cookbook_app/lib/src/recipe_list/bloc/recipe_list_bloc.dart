import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:equatable/equatable.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

/// The bloc controlling the recipes in a single category.
final class RecipeListBloc extends Bloc<_RecipeListEvent, RecipeListState> {
  /// Creates a new recipe bloc.
  RecipeListBloc({
    required RecipeRepository recipeRepository,
    required this.category,
  })  : _recipeRepository = recipeRepository,
        super(RecipeListState()) {
    on<RefreshRecipeList>(_onRefreshRecipeList);

    add(const RefreshRecipeList());
  }

  final RecipeRepository _recipeRepository;

  /// The category this bloc manages.
  final Category category;

  Future<void> _onRefreshRecipeList(
    RefreshRecipeList event,
    Emitter<RecipeListState> emit,
  ) async {
    try {
      emit(state.copyWith(status: RecipeListStatus.loading));

      final recipes = await _recipeRepository.readCategory(name: category.name);

      emit(
        state.copyWith(
          recipes: recipes,
          status: RecipeListStatus.success,
        ),
      );
    } on ReadCategoryFailure {
      emit(state.copyWith(status: RecipeListStatus.failure));
    }
  }
}
