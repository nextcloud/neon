import 'dart:async';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:rxdart/rxdart.dart';

/// Bloc for managing the user details of the account.
@sealed
abstract class UserDetailsBloc implements InteractiveBloc {
  /// Creates a new user details Bloc.
  @internal
  factory UserDetailsBloc({
    required Account account,
  }) = _UserDetailsBloc;

  /// Contains the user details.
  BehaviorSubject<Result<provisioning_api.UserDetails>> get userDetails;
}

class _UserDetailsBloc extends InteractiveBloc implements UserDetailsBloc {
  _UserDetailsBloc({
    required this.account,
  }) {
    unawaited(refresh());
  }

  @override
  final log = Logger('UserDetailsBloc');

  final Account account;

  @override
  void dispose() {
    unawaited(userDetails.close());
    super.dispose();
  }

  @override
  final userDetails = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud(
      account: account,
      cacheKey: 'user-details',
      subject: userDetails,
      request: account.client.provisioningApi.users.$getCurrentUser_Request(),
      serializer: account.client.provisioningApi.users.$getCurrentUser_Serializer(),
      unwrap: (response) => response.body.ocs.data,
    );
  }
}
