import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/utils/user_agent.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class LoginFlowBlocEvents {}

@internal
abstract interface class LoginFlowBlocStates {
  BehaviorSubject<Result<core.LoginFlowV2>> get init;

  Stream<core.LoginFlowV2Credentials> get result;
}

@internal
class LoginFlowBloc extends InteractiveBloc implements LoginFlowBlocEvents, LoginFlowBlocStates {
  LoginFlowBloc(this.serverURL) {
    unawaited(refresh());
  }

  final Uri serverURL;
  late final _client = NextcloudClient(
    serverURL,
    userAgentOverride: neonUserAgent,
  );
  final _resultController = StreamController<core.LoginFlowV2Credentials>();

  Timer? _pollTimer;

  @override
  void dispose() {
    _cancelPollTimer();
    unawaited(init.close());
    unawaited(_resultController.close());

    super.dispose();
  }

  @override
  BehaviorSubject<Result<core.LoginFlowV2>> init = BehaviorSubject();

  @override
  late Stream<core.LoginFlowV2Credentials> result = _resultController.stream.asBroadcastStream();

  @override
  Future<void> refresh() async {
    try {
      init.add(Result.loading());

      final initResponse = await _client.core.clientFlowLoginV2.init();
      init.add(Result.success(initResponse.body));

      _cancelPollTimer();
      _pollTimer = Timer.periodic(const Duration(seconds: 1), (final _) async {
        try {
          final resultResponse = await _client.core.clientFlowLoginV2.poll(token: initResponse.body.poll.token);
          _cancelPollTimer();
          _resultController.add(resultResponse.body);
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
