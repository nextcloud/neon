import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/models/account.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class LoginCheckAccountBlocEvents {}

abstract interface class LoginCheckAccountBlocStates {
  /// Contains the account for the user
  BehaviorSubject<Result<Account>> get state;
}

class LoginCheckAccountBloc extends InteractiveBloc
    implements LoginCheckAccountBlocEvents, LoginCheckAccountBlocStates {
  LoginCheckAccountBloc(
    this._packageInfo,
    this.serverURL,
    this.loginName,
    this.password,
  ) {
    unawaited(refresh());
  }

  final PackageInfo _packageInfo;
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
        userAgentOverride: userAgent(_packageInfo),
      );

      final response = await client.provisioningApi.getCurrentUser();

      final account = Account(
        serverURL: serverURL,
        loginName: loginName,
        username: response.ocs.data.id,
        password: password,
        userAgent: userAgent(_packageInfo),
      );

      state.add(Result.success(account));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      state.add(Result.error(e));
    }
  }
}
