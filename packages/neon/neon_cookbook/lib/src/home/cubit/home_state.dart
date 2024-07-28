part of 'home_cubit.dart';

/// Available tabs for the cookbook home screen.
enum HomeTab {
  /// The Recipe categories.
  categories,

  /// The timer screen.
  timers,
}

/// The state of the [HomeCubit].
final class HomeState extends Equatable {
  /// Creates a new home state.
  const HomeState({
    this.tab = HomeTab.categories,
  });

  /// The active tab in the bottom navigation.
  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
