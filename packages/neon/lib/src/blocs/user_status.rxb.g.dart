// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'user_status.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class UserStatusBlocType extends RxBlocTypeBase {
  UserStatusBlocEvents get events;
  UserStatusBlocStates get states;
}

/// [$UserStatusBloc] extended by the [UserStatusBloc]
/// {@nodoc}
abstract class $UserStatusBloc extends RxBlocBase
    implements UserStatusBlocEvents, UserStatusBlocStates, UserStatusBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// The state of [userStatus] implemented in [_mapToUserStatusState]
  late final BehaviorSubject<Result<UserStatus?>> _userStatusState = _mapToUserStatusState();

  @override
  BehaviorSubject<Result<UserStatus?>> get userStatus => _userStatusState;

  BehaviorSubject<Result<UserStatus?>> _mapToUserStatusState();

  @override
  UserStatusBlocEvents get events => this;

  @override
  UserStatusBlocStates get states => this;

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }
}
