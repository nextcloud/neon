import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/models/account.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class LoginCheckServerStatusBlocEvents {}

abstract interface class LoginCheckServerStatusBlocStates {
  /// Contains the current server connection state
  BehaviorSubject<Result<CoreServerStatus>> get state;
}

class LoginCheckServerStatusBloc extends InteractiveBloc
    implements LoginCheckServerStatusBlocEvents, LoginCheckServerStatusBlocStates {
  LoginCheckServerStatusBloc(
    this._packageInfo,
    this.serverURL,
  ) {
    unawaited(refresh());
  }

  final PackageInfo _packageInfo;
  final String serverURL;

  @override
  void dispose() {
    unawaited(state.close());
  }

  @override
  BehaviorSubject<Result<CoreServerStatus>> state = BehaviorSubject();

  @override
  Future refresh() async {
    state.add(Result.loading());

    try {
      final client = NextcloudClient(
        serverURL,
        userAgentOverride: userAgent(_packageInfo),
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
