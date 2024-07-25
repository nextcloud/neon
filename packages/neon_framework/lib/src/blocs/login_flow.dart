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

/// Bloc for running the Nextcloud Login Flow V2.
sealed class LoginFlowBloc implements InteractiveBloc {
  @internal
  factory LoginFlowBloc({
    required Uri serverURL,
  }) = _LoginFlowBloc;

  /// Contains the initialization of the login flow.
  BehaviorSubject<Result<core.LoginFlowV2>> get init;

  /// Emits the result of the login flow.
  ///
  /// Only gets called when the login flow was successful.
  Stream<core.LoginFlowV2Credentials> get result;
}

class _LoginFlowBloc extends InteractiveBloc implements LoginFlowBloc {
  _LoginFlowBloc({
    required this.serverURL,
  }) {
    unawaited(refresh());
  }

  @override
  final log = Logger('LoginFlowBloc');

  final Uri serverURL;
  late final client = NextcloudClient(
    serverURL,
    httpClient: NeonHttpClient(
      userAgent: neonUserAgent,
      baseURL: serverURL,
    ),
  );
  final resultController = StreamController<core.LoginFlowV2Credentials>();

  Timer? pollTimer;

  @override
  void dispose() {
    cancelPollTimer();
    unawaited(init.close());
    unawaited(resultController.close());
    client.close();

    super.dispose();
  }

  @override
  final init = BehaviorSubject();

  @override
  late final result = resultController.stream.asBroadcastStream();

  @override
  Future<void> refresh() async {
    try {
      init.add(Result.loading());

      final initResponse = await client.core.clientFlowLoginV2.init();
      init.add(Result.success(initResponse.body));

      cancelPollTimer();
      pollTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
        try {
          final resultResponse = await client.core.clientFlowLoginV2.poll(
            $body: core.ClientFlowLoginV2PollRequestApplicationJson(
              (b) => b..token = initResponse.body.poll.token,
            ),
          );
          cancelPollTimer();
          resultController.add(resultResponse.body);
        } on DynamiteStatusCodeException catch (error) {
          if (error.statusCode != 404) {
            rethrow;
          }

          log.fine('Login flow not found or completed. Polling again in one second.');
        }
      });
    } on http.ClientException catch (error, stackTrace) {
      log.severe(
        'Error while polling the login flow.',
        error,
        stackTrace,
      );

      init.add(Result.error(error));
    }
  }

  void cancelPollTimer() {
    if (pollTimer != null) {
      pollTimer!.cancel();
      pollTimer = null;
    }
  }
}
