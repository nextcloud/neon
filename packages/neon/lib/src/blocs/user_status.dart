import 'dart:async';

import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';
import 'package:window_manager/window_manager.dart';

abstract class UserStatusBlocEvents {}

abstract class UserStatusBlocStates {
  BehaviorSubject<Result<UserStatus?>> get userStatus;
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
  BehaviorSubject<Result<UserStatus?>> userStatus = BehaviorSubject<Result<UserStatus?>>();

  @override
  Future refresh() async {
    final isAway =
        _platform.canUseWindowManager && (!(await windowManager.isFocused()) || !(await windowManager.isVisible()));
    try {
      final status = await _account.client.userStatus.heartbeat(
        status: isAway ? UserStatusType.away : UserStatusType.online,
      );
      userStatus.add(Result.success(status));
    } catch (e) {
      if (e is ApiException && e.statusCode == 204) {
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
