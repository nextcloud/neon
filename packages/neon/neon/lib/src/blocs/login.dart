part of 'blocs.dart';

abstract class LoginBlocEvents {
  void setServerURL(final String? url);
}

abstract class LoginBlocStates {
  BehaviorSubject<String?> get serverURL;

  BehaviorSubject<ServerConnectionState?> get serverConnectionState;

  BehaviorSubject<NextcloudCoreLoginFlowInit?> get loginFlowInit;

  BehaviorSubject<NextcloudCoreLoginFlowResult?> get loginFlowResult;
}

class LoginBloc extends InteractiveBloc implements LoginBlocEvents, LoginBlocStates {
  LoginBloc(this._packageInfo);

  final PackageInfo _packageInfo;

  Timer? _pollTimer;

  @override
  void dispose() {
    _cancelPollTimer();
    unawaited(serverURL.close());
    unawaited(serverConnectionState.close());
    unawaited(loginFlowInit.close());
    unawaited(loginFlowResult.close());
  }

  @override
  BehaviorSubject<NextcloudCoreLoginFlowInit?> loginFlowInit =
      BehaviorSubject<NextcloudCoreLoginFlowInit?>.seeded(null);

  @override
  BehaviorSubject<NextcloudCoreLoginFlowResult?> loginFlowResult =
      BehaviorSubject<NextcloudCoreLoginFlowResult?>.seeded(null);

  @override
  BehaviorSubject<ServerConnectionState?> serverConnectionState = BehaviorSubject<ServerConnectionState?>.seeded(null);

  @override
  BehaviorSubject<String?> serverURL = BehaviorSubject<String?>.seeded(null);

  @override
  Future refresh() async {
    await _setServerURL(serverURL.valueOrNull);
  }

  @override
  void setServerURL(final String? url) {
    unawaited(_setServerURL(url));
  }

  Future _setServerURL(final String? url) async {
    serverURL.add(url);
    loginFlowInit.add(null);
    loginFlowResult.add(null);
    serverConnectionState.add(url != null ? ServerConnectionState.loading : null);

    if (url != null) {
      try {
        final client = NextcloudClient(
          url,
          userAgentOverride: userAgent(_packageInfo),
        );

        final status = await client.core.getStatus();
        if (status.maintenance) {
          serverConnectionState.add(ServerConnectionState.maintenanceMode);
          return;
        }

        serverConnectionState.add(ServerConnectionState.success);

        final init = await client.core.initLoginFlow();
        loginFlowInit.add(init);

        _cancelPollTimer();
        _pollTimer = Timer.periodic(const Duration(seconds: 2), (final _) async {
          try {
            final result = await client.core.getLoginFlowResult(token: init.poll.token);
            _cancelPollTimer();
            loginFlowResult.add(result);
          } catch (e, s) {
            debugPrint(e.toString());
            debugPrint(s.toString());
          }
        });
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        serverConnectionState.add(ServerConnectionState.unreachable);
      }
    }
  }

  void _cancelPollTimer() {
    if (_pollTimer != null) {
      _pollTimer!.cancel();
      _pollTimer = null;
    }
  }
}

enum ServerConnectionState {
  loading,
  unreachable,
  maintenanceMode,
  success,
}
