import 'dart:async';

import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:window_manager/window_manager.dart';

part 'user_status.rxb.g.dart';

abstract class UserStatusBlocEvents {}

abstract class UserStatusBlocStates {
  BehaviorSubject<Result<UserStatus?>> get userStatus;
}

@RxBloc()
class UserStatusBloc extends $UserStatusBloc {
  UserStatusBloc(
    this._requestManager,
    this._platform,
    this._account,
  ) {
    _timer = instantPeriodicTimer(
      const Duration(minutes: 5),
      (final _) async {
        await _heartbeat();
      },
    );
  }

  Future _heartbeat() async {
    final isAway =
        _platform.canUseWindowManager && (!(await windowManager.isFocused()) || !(await windowManager.isVisible()));
    _requestManager.wrapWithoutCache(
      () async {
        try {
          return await _account.client.userStatus.heartbeat(
            status: isAway ? UserStatusType.away : UserStatusType.online,
          );
        } on ApiException catch (e) {
          if (e.statusCode == 204) {
            return null;
          }
          rethrow;
        }
      },
    ).listen(_userStatusSubject.add);
  }

  final RequestManager _requestManager;
  final NeonPlatform _platform;
  final Account _account;
  late final StreamSubscription<Account?> _activeAccountStreamSubscription;
  late Timer _timer;

  final _userStatusSubject = BehaviorSubject<Result<UserStatus?>>();

  @override
  void dispose() {
    _timer.cancel();
    unawaited(_activeAccountStreamSubscription.cancel());
    unawaited(_userStatusSubject.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<UserStatus?>> _mapToUserStatusState() => _userStatusSubject;
}

Timer instantPeriodicTimer(
  final Duration duration,
  final void Function(Timer timer) callback,
) {
  final timer = Timer.periodic(duration, callback);
  callback(timer);
  return timer;
}
