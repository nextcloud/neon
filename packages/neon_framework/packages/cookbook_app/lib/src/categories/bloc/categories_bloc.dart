import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

/// The bloc controlling the categories overview.
final class CategoriesBloc extends Bloc<_CategoriesEvent, CategoriesState> {
  /// Creates a new categories bloc.
  CategoriesBloc({
    required RecipeRepository recipeRepository,
  })  : _recipeRepository = recipeRepository,
        super(CategoriesState()) {
    on<RefreshCategories>(_onRefreshCategories);

    add(const RefreshCategories());
  }

  final RecipeRepository _recipeRepository;

  Future<void> _onRefreshCategories(
    RefreshCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CategoriesStatus.loading));

      final categories = await _recipeRepository.readCategories();

      emit(
        state.copyWith(
          categories: categories,
          status: CategoriesStatus.success,
        ),
      );
    } on ReadCategoriesFailure {
      emit(state.copyWith(status: CategoriesStatus.failure));
    }
  }
}
