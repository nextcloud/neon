part of 'categories_bloc.dart';

/// The status of the [CategoriesState].
enum CategoriesStatus {
  /// When no event has been handled.
  initial,

  /// When the categories are loading.
  loading,

  /// When the categories have been fetched successfully.
  success,

  /// When a failure occurred while loading the categories.
  failure,
}

/// State of the [CategoriesBloc].
final class CategoriesState extends Equatable {
  /// Creates a new state for managing the categories.
  CategoriesState({
    BuiltList<Category>? categories,
    this.status = CategoriesStatus.initial,
  }) : categories = categories ?? BuiltList();

  /// The list of categories.
  ///
  /// Defaults to an empty list.
  final BuiltList<Category> categories;

  /// The status of the state.
  final CategoriesStatus status;

  /// Creates a copies with mutated fields.
  CategoriesState copyWith({
    BuiltList<Category>? categories,
    String? error,
    CategoriesStatus? status,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        categories,
        status,
      ];
}
