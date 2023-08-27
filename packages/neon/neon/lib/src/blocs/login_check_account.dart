import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/user_agent.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class LoginCheckAccountBlocEvents {}

abstract interface class LoginCheckAccountBlocStates {
  /// Contains the account for the user
  BehaviorSubject<Result<Account>> get state;
}

class LoginCheckAccountBloc extends InteractiveBloc
    implements LoginCheckAccountBlocEvents, LoginCheckAccountBlocStates {
  LoginCheckAccountBloc(
    this.serverURL,
    this.loginName,
    this.password,
  ) {
    unawaited(refresh());
  }

  final String serverURL;
  final String loginName;
  final String password;

  @override
  void dispose() {
    unawaited(state.close());
  }

  @override
  BehaviorSubject<Result<Account>> state = BehaviorSubject();

  @override
  Future refresh() async {
    state.add(Result.loading());

    try {
      final client = NextcloudClient(
        serverURL,
        loginName: loginName,
        password: password,
        userAgentOverride: neonUserAgent,
      );

      final response = await client.provisioningApi.users.getCurrentUser();

      final account = Account(
        serverURL: serverURL,
        username: response.ocs.data.id,
        password: password,
        userAgent: neonUserAgent,
      );

      state.add(Result.success(account));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      state.add(Result.error(e));
    }
  }
}
