part of 'categories_bloc.dart';

/// Events for the [CategoriesBloc].
sealed class _CategoriesEvent extends Equatable {
  const _CategoriesEvent();

  @override
  List<Object> get props => [];
}

/// {@template RefreshCategories}
/// Event that triggers a reload of the categories.
/// {@endtemplate}
final class RefreshCategories extends _CategoriesEvent {
  /// {@macro RefreshCategories}
  const RefreshCategories();
}
