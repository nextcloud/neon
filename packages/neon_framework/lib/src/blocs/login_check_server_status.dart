import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/utils/user_agent.dart';
import 'package:neon_http_client/neon_http_client.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

/// Bloc that checks that the server is ready for logging in.
sealed class LoginCheckServerStatusBloc implements InteractiveBloc {
  @internal
  factory LoginCheckServerStatusBloc({
    required Uri serverURL,
  }) = _LoginCheckServerStatusBloc;

  /// Contains the current server connection state
  BehaviorSubject<Result<core.Status>> get state;
}

class _LoginCheckServerStatusBloc extends InteractiveBloc implements LoginCheckServerStatusBloc {
  _LoginCheckServerStatusBloc({
    required this.serverURL,
  }) {
    unawaited(refresh());
  }

  @override
  final log = Logger('LoginCheckServerStatusBloc');

  final Uri serverURL;
  late final client = NextcloudClient(
    serverURL,
    httpClient: NeonHttpClient(
      userAgent: neonUserAgent,
    ),
  );

  @override
  void dispose() {
    unawaited(state.close());
    client.close();

    super.dispose();
  }

  @override
  final state = BehaviorSubject();

  @override
  Future<void> refresh() async {
    state.add(Result.loading());

    try {
      final status = await client.core.getStatus();
      state.add(Result.success(status.body));
    } on http.ClientException catch (error, stackTrace) {
      log.warning(
        'Error getting the server status.',
        error,
        stackTrace,
      );

      state.add(Result.error(error));
    }
  }
}
