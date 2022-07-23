// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'notifications.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class NotificationsBlocType extends RxBlocTypeBase {
  NotificationsBlocEvents get events;
  NotificationsBlocStates get states;
}

/// [$NotificationsBloc] extended by the [NotificationsBloc]
/// {@nodoc}
abstract class $NotificationsBloc extends RxBlocBase
    implements NotificationsBlocEvents, NotificationsBlocStates, NotificationsBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [deleteNotification]
  final _$deleteNotificationEvent = PublishSubject<NotificationsNotification>();

  /// Тhe [Subject] where events sink to by calling [deleteAllNotifications]
  final _$deleteAllNotificationsEvent = PublishSubject<void>();

  /// The state of [notifications] implemented in [_mapToNotificationsState]
  late final BehaviorSubject<Result<List<NotificationsNotification>>> _notificationsState = _mapToNotificationsState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  void deleteNotification(NotificationsNotification notification) => _$deleteNotificationEvent.add(notification);

  @override
  void deleteAllNotifications() => _$deleteAllNotificationsEvent.add(null);

  @override
  BehaviorSubject<Result<List<NotificationsNotification>>> get notifications => _notificationsState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<Result<List<NotificationsNotification>>> _mapToNotificationsState();

  Stream<Exception> _mapToErrorsState();

  @override
  NotificationsBlocEvents get events => this;

  @override
  NotificationsBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _$deleteNotificationEvent.close();
    _$deleteAllNotificationsEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
