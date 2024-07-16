import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

/// Cubit for managing the home navigation.
class HomeCubit extends Cubit<HomeState> {
  /// Creates a new home navigation cubit.
  HomeCubit() : super(const HomeState());

  /// Sets the home tab to the given one.
  void setTab(HomeTab tab) => emit(HomeState(tab: tab));
}
