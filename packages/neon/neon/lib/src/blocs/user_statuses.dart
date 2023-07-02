import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/timer.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';
import 'package:window_manager/window_manager.dart';

abstract class UserStatusesBlocEvents {
  void load(final String username, {final bool force = false});
}

abstract class UserStatusesBlocStates {
  BehaviorSubject<Map<String, Result<UserStatusPublicStatus?>>> get statuses;
}

@internal
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
  BehaviorSubject<Map<String, Result<UserStatusPublicStatus?>>> statuses =
      BehaviorSubject<Map<String, Result<UserStatusPublicStatus?>>>();

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

      UserStatusPublicStatus? data;
      if (_account.username == username) {
        final isAway =
            _platform.canUseWindowManager && (!(await windowManager.isFocused()) || !(await windowManager.isVisible()));
        final response = await _account.client.userStatus.heartbeat(
          status: isAway ? UserStatusType.away : UserStatusType.online,
        );
        data = response.ocs.data.status?.publicStatus;
      } else {
        final response = await _account.client.userStatus.getPublicStatus(userId: username);
        data = response.ocs.data.publicStatus;
      }

      _updateStatus(username, Result.success(data));
    } catch (e, s) {
      if (e is DynamiteApiException && (e.statusCode == 404 || e.statusCode == 204)) {
        _updateStatus(username, Result.success(null));
        return;
      }
      debugPrint(e.toString());
      debugPrint(s.toString());
      _updateStatus(username, Result.error(e));
    }
  }

  Map<String, Result<UserStatusPublicStatus?>> get _statuses =>
      statuses.valueOrNull ?? <String, Result<UserStatusPublicStatus?>>{};

  void _updateStatus(final String username, final Result<UserStatusPublicStatus?> result) {
    statuses.add({
      ..._statuses,
      username: result,
    });
  }
}
