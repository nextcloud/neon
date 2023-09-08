import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/utils/user_agent.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class LoginCheckServerStatusBlocEvents {}

@internal
abstract interface class LoginCheckServerStatusBlocStates {
  /// Contains the current server connection state
  BehaviorSubject<Result<CoreStatus>> get state;
}

@internal
class LoginCheckServerStatusBloc extends InteractiveBloc
    implements LoginCheckServerStatusBlocEvents, LoginCheckServerStatusBlocStates {
  LoginCheckServerStatusBloc(this.serverURL) {
    unawaited(refresh());
  }

  final Uri serverURL;

  @override
  void dispose() {
    unawaited(state.close());

    super.dispose();
  }

  @override
  BehaviorSubject<Result<CoreStatus>> state = BehaviorSubject();

  @override
  Future<void> refresh() async {
    state.add(Result.loading());

    try {
      final client = NextcloudClient(
        serverURL,
        userAgentOverride: neonUserAgent,
      );

      final status = await client.core.getStatus();
      state.add(Result.success(status));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      state.add(Result.error(e));
    }
  }
}
