// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'push_notifications.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class PushNotificationsBlocType extends RxBlocTypeBase {
  PushNotificationsBlocEvents get events;
  PushNotificationsBlocStates get states;
}

/// [$PushNotificationsBloc] extended by the [PushNotificationsBloc]
/// {@nodoc}
abstract class $PushNotificationsBloc extends RxBlocBase
    implements PushNotificationsBlocEvents, PushNotificationsBlocStates, PushNotificationsBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// The state of [notifications] implemented in [_mapToNotificationsState]
  late final Stream<NextcloudPushNotification> _notificationsState = _mapToNotificationsState();

  @override
  Stream<NextcloudPushNotification> get notifications => _notificationsState;

  Stream<NextcloudPushNotification> _mapToNotificationsState();

  @override
  PushNotificationsBlocEvents get events => this;

  @override
  PushNotificationsBlocStates get states => this;

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }
}
