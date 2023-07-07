import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/models/account.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

abstract class LoginFlowBlocEvents {}

abstract class LoginFlowBlocStates {
  BehaviorSubject<Result<CoreLoginFlowInit>> get init;

  Stream<CoreLoginFlowResult> get result;
}

class LoginFlowBloc extends InteractiveBloc implements LoginFlowBlocEvents, LoginFlowBlocStates {
  LoginFlowBloc(
    this._packageInfo,
    this.serverURL,
  ) {
    unawaited(refresh());
  }

  final PackageInfo _packageInfo;
  final String serverURL;
  late final _client = NextcloudClient(
    serverURL,
    userAgentOverride: userAgent(_packageInfo),
  );
  final _resultController = StreamController<CoreLoginFlowResult>();

  Timer? _pollTimer;

  @override
  void dispose() {
    _cancelPollTimer();
    unawaited(init.close());
    unawaited(_resultController.close());
  }

  @override
  BehaviorSubject<Result<CoreLoginFlowInit>> init = BehaviorSubject<Result<CoreLoginFlowInit>>();

  @override
  late Stream<CoreLoginFlowResult> result = _resultController.stream.asBroadcastStream();

  @override
  Future refresh() async {
    try {
      init.add(Result.loading());

      final initResponse = await _client.core.initLoginFlow();
      init.add(Result.success(initResponse));

      _cancelPollTimer();
      _pollTimer = Timer.periodic(const Duration(seconds: 1), (final _) async {
        try {
          final resultResponse = await _client.core.getLoginFlowResult(token: initResponse.poll.token);
          _cancelPollTimer();
          _resultController.add(resultResponse);
        } catch (e, s) {
          debugPrint(e.toString());
          debugPrint(s.toString());
        }
      });
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      init.add(Result.error(e));
    }
  }

  void _cancelPollTimer() {
    if (_pollTimer != null) {
      _pollTimer!.cancel();
      _pollTimer = null;
    }
  }
}
