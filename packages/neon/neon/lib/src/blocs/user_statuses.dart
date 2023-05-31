part of '../../neon.dart';

abstract class UserStatusesBlocEvents {
  void load(final String username, {final bool force = false});
}

abstract class UserStatusesBlocStates {
  BehaviorSubject<Map<String, Result<NextcloudUserStatusPublicStatus?>>> get statuses;
}

class UserStatusesBloc extends InteractiveBloc implements UserStatusesBlocEvents, UserStatusesBlocStates {
  UserStatusesBloc(
    this._platform,
    this._account,
  ) {
    unawaited(refresh());
    _timer = TimerBloc().registerTimer(const Duration(minutes: 5), refresh);
  }

  final NeonPlatform _platform;
  final Account _account;
  late final NeonTimer _timer;

  @override
  void dispose() {
    _timer.cancel();
    unawaited(statuses.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Map<String, Result<NextcloudUserStatusPublicStatus?>>> statuses =
      BehaviorSubject<Map<String, Result<NextcloudUserStatusPublicStatus?>>>();

  @override
  Future refresh() async {
    for (final username in _statuses.keys) {
      await load(username, force: true);
    }
  }

  @override
  Future load(final String username, {final bool force = false}) async {
    if (!force && _statuses.containsKey(username)) {
      return;
    }

    try {
      _updateStatus(username, Result.loading());

      NextcloudUserStatusPublicStatus? data;
      if (_account.username == username) {
        final isAway =
            _platform.canUseWindowManager && (!(await windowManager.isFocused()) || !(await windowManager.isVisible()));
        final response = await _account.client.userStatus.heartbeat(
          status: isAway ? NextcloudUserStatusType.away : NextcloudUserStatusType.online,
        );
        data = response.ocs.data.userStatusStatus?.userStatusPublicStatus;
      } else {
        final response = await _account.client.userStatus.getPublicStatus(userId: username);
        data = response.ocs.data.userStatusPublicStatus;
      }

      _updateStatus(username, Result.success(data));
    } catch (e, s) {
      if (e is NextcloudApiException && (e.statusCode == 404 || e.statusCode == 204)) {
        _updateStatus(username, Result.success(null));
        return;
      }
      debugPrint(e.toString());
      debugPrint(s.toString());
      _updateStatus(username, Result.error(e));
    }
  }

  Map<String, Result<NextcloudUserStatusPublicStatus?>> get _statuses =>
      statuses.valueOrNull ?? <String, Result<NextcloudUserStatusPublicStatus?>>{};

  void _updateStatus(final String username, final Result<NextcloudUserStatusPublicStatus?> result) {
    statuses.add({
      ..._statuses,
      username: result,
    });
  }
}
