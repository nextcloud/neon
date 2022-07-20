import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:harbour/src/harbour.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'login.rxb.g.dart';

abstract class LoginBlocEvents {
  void setServerURL(final String? url);
}

abstract class LoginBlocStates {
  BehaviorSubject<String?> get serverURL;

  BehaviorSubject<ServerConnectionState?> get serverConnectionState;

  BehaviorSubject<CoreLoginFlowInit?> get loginFlowInit;

  BehaviorSubject<CoreLoginFlowResult?> get loginFlowResult;
}

@RxBloc()
class LoginBloc extends $LoginBloc {
  LoginBloc() {
    _$setServerURLEvent.listen((final url) async {
      _serverURLSubject.add(url);
      _loginFlowInitSubject.add(null);
      _loginFlowResultSubject.add(null);
      _serverConnectionStateSubject.add(url != null ? ServerConnectionState.loading : null);

      if (url != null) {
        try {
          final client = NextcloudClient(
            url,
            userAgentOverride: userAgentOverride(),
          );

          final status = (await client.core.getStatus())!;
          if (status.maintenance!) {
            _serverConnectionStateSubject.add(ServerConnectionState.maintenanceMode);
            return;
          }

          _serverConnectionStateSubject.add(ServerConnectionState.success);

          final init = await client.core.initLoginFlow();
          _loginFlowInitSubject.add(init);

          _cancelPollTimer();
          _pollTimer = Timer.periodic(const Duration(seconds: 2), (final _) async {
            try {
              final result = await client.core.getLoginFlowResult(CoreLoginFlowQuery(token: init!.poll!.token!));
              _cancelPollTimer();
              _loginFlowResultSubject.add(result);
            } catch (e) {
              debugPrint(e.toString());
            }
          });
        } catch (e) {
          debugPrint(e.toString());
          _serverConnectionStateSubject.add(ServerConnectionState.unreachable);
        }
      }
    });
  }

  void _cancelPollTimer() {
    if (_pollTimer != null) {
      _pollTimer!.cancel();
      _pollTimer = null;
    }
  }

  final _serverURLSubject = BehaviorSubject<String?>.seeded(null);
  final _serverConnectionStateSubject = BehaviorSubject<ServerConnectionState?>.seeded(null);
  final _loginFlowInitSubject = BehaviorSubject<CoreLoginFlowInit?>.seeded(null);
  final _loginFlowResultSubject = BehaviorSubject<CoreLoginFlowResult?>.seeded(null);
  Timer? _pollTimer;

  @override
  void dispose() {
    _cancelPollTimer();
    // ignore: discarded_futures
    _serverURLSubject.close();
    // ignore: discarded_futures
    _serverConnectionStateSubject.close();
    // ignore: discarded_futures
    _loginFlowInitSubject.close();
    // ignore: discarded_futures
    _loginFlowResultSubject.close();
    super.dispose();
  }

  @override
  BehaviorSubject<String?> _mapToServerURLState() => _serverURLSubject;

  @override
  BehaviorSubject<ServerConnectionState?> _mapToServerConnectionStateState() => _serverConnectionStateSubject;

  @override
  BehaviorSubject<CoreLoginFlowInit?> _mapToLoginFlowInitState() => _loginFlowInitSubject;

  @override
  BehaviorSubject<CoreLoginFlowResult?> _mapToLoginFlowResultState() => _loginFlowResultSubject;
}

enum ServerConnectionState {
  loading,
  unreachable,
  maintenanceMode,
  success,
}
