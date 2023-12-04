import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/timer.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:rxdart/rxdart.dart';
import 'package:window_manager/window_manager.dart';

@internal
abstract interface class UserStatusesBlocEvents {
  void load(final String username, {final bool force = false});
}

@internal
abstract interface class UserStatusesBlocStates {
  BehaviorSubject<Map<String, Result<user_status.$PublicInterface?>>> get statuses;
}

@internal
class UserStatusesBloc extends InteractiveBloc implements UserStatusesBlocEvents, UserStatusesBlocStates {
  UserStatusesBloc(
    this._account,
  ) {
    unawaited(refresh());
    _timer = TimerBloc().registerTimer(const Duration(minutes: 5), refresh);
  }

  final Account _account;
  late final NeonTimer _timer;

  @override
  void dispose() {
    _timer.cancel();
    unawaited(statuses.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Map<String, Result<user_status.$PublicInterface?>>> statuses = BehaviorSubject();

  @override
  Future<void> refresh() async {
    for (final username in _statuses.keys) {
      await load(username, force: true);
    }
  }

  @override
  Future<void> load(final String username, {final bool force = false}) async {
    if (!force && _statuses.containsKey(username)) {
      return;
    }

    try {
      _updateStatus(username, Result.loading());

      user_status.$PublicInterface? data;

      if (_account.username == username) {
        var isAway = false;
        if (NeonPlatform.instance.canUseWindowManager) {
          final focused = await windowManager.isFocused();
          final visible = await windowManager.isVisible();
          isAway = !focused || !visible;
        }
        try {
          final response = await _account.client.userStatus.heartbeat.heartbeat(
            status: isAway ? 'away' : 'online',
          );
          data = response.body.ocs.data;
        } catch (e) {
          // 204 is returned if the heartbeat failed because the current status is different. Ignore this and fetch the normal status
          if (e is! DynamiteApiException || e.statusCode != 204) {
            rethrow;
          }
        }
      }

      if (data == null) {
        final response = await _account.client.userStatus.statuses.find(userId: username);
        data = response.body.ocs.data;
      }

      _updateStatus(username, Result.success(data));
    } catch (e, s) {
      if (e is DynamiteApiException && e.statusCode == 404) {
        _updateStatus(username, Result.success(null));
        return;
      }
      debugPrint(e.toString());
      debugPrint(s.toString());
      _updateStatus(username, Result.error(e));
    }
  }

  Map<String, Result<user_status.$PublicInterface?>> get _statuses =>
      statuses.valueOrNull ?? <String, Result<user_status.$PublicInterface?>>{};

  void _updateStatus(final String username, final Result<user_status.$PublicInterface?> result) {
    statuses.add({
      ..._statuses,
      username: result,
    });
  }
}
