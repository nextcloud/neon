// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'user_details.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class UserDetailsBlocType extends RxBlocTypeBase {
  UserDetailsBlocEvents get events;
  UserDetailsBlocStates get states;
}

/// [$UserDetailsBloc] extended by the [UserDetailsBloc]
/// {@nodoc}
abstract class $UserDetailsBloc extends RxBlocBase
    implements UserDetailsBlocEvents, UserDetailsBlocStates, UserDetailsBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// The state of [userDetails] implemented in [_mapToUserDetailsState]
  late final BehaviorSubject<Result<ProvisioningApiUserDetails>> _userDetailsState = _mapToUserDetailsState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  BehaviorSubject<Result<ProvisioningApiUserDetails>> get userDetails => _userDetailsState;

  BehaviorSubject<Result<ProvisioningApiUserDetails>> _mapToUserDetailsState();

  @override
  UserDetailsBlocEvents get events => this;

  @override
  UserDetailsBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
