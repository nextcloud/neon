import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/user_agent.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:rxdart/rxdart.dart';

/// Bloc that checks that the account is ready for logging in.
sealed class LoginCheckAccountBloc implements InteractiveBloc {
  @internal
  factory LoginCheckAccountBloc({
    required Uri serverURL,
    required String loginName,
    required String password,
  }) = _LoginCheckAccountBloc;

  /// Contains the account for the user
  BehaviorSubject<Result<Account>> get state;
}

class _LoginCheckAccountBloc extends InteractiveBloc implements LoginCheckAccountBloc {
  _LoginCheckAccountBloc({
    required this.serverURL,
    required this.loginName,
    required this.password,
  }) {
    unawaited(refresh());
  }

  @override
  final log = Logger('LoginCheckAccountBloc');

  final Uri serverURL;
  final String loginName;
  final String password;

  @override
  void dispose() {
    unawaited(state.close());

    super.dispose();
  }

  @override
  final state = BehaviorSubject();

  @override
  Future<void> refresh() async {
    state.add(Result.loading());

    try {
      final client = NextcloudClient(
        serverURL,
        loginName: loginName,
        password: password,
        userAgent: neonUserAgent,
      );

      final response = await client.provisioningApi.users.getCurrentUser();

      final account = Account(
        (b) => b
          ..serverURL = serverURL
          ..username = response.body.ocs.data.id
          ..password = password
          ..userAgent = neonUserAgent,
      );

      state.add(Result.success(account));
    } on http.ClientException catch (error, stackTrace) {
      log.warning(
        'Error fetching the user information.',
        error,
        stackTrace,
      );

      state.add(Result.error(error));
    }
  }
}
