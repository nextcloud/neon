part of '../neon.dart';

abstract class UserStatusBlocEvents {}

abstract class UserStatusBlocStates {
  BehaviorSubject<Result<NextcloudUserStatus?>> get userStatus;
}

class UserStatusBloc extends InteractiveBloc implements UserStatusBlocEvents, UserStatusBlocStates {
  UserStatusBloc(
    this._platform,
    this._account,
  ) {
    _timer = instantPeriodicTimer(
      const Duration(minutes: 5),
      (final _) async {
        await refresh();
      },
    );
  }

  final NeonPlatform _platform;
  final Account _account;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    unawaited(userStatus.close());
  }

  @override
  BehaviorSubject<Result<NextcloudUserStatus?>> userStatus = BehaviorSubject<Result<NextcloudUserStatus?>>();

  @override
  Future refresh() async {
    final isAway =
        _platform.canUseWindowManager && (!(await windowManager.isFocused()) || !(await windowManager.isVisible()));
    try {
      final status = await _account.client.userStatus.heartbeat(
        status: isAway ? NextcloudUserStatusType.away : NextcloudUserStatusType.online,
      );
      userStatus.add(Result.success(status));
    } catch (e) {
      if (e is NextcloudApiException && e.statusCode == 204) {
        return;
      }
      userStatus.add(Result.error(e));
    }
  }
}

Timer instantPeriodicTimer(
  final Duration duration,
  final void Function(Timer timer) callback,
) {
  final timer = Timer.periodic(duration, callback);
  callback(timer);
  return timer;
}
