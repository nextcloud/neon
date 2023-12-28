import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:rxdart/rxdart.dart';

@internal
sealed class UserDetailsBloc implements InteractiveBloc {
  factory UserDetailsBloc(final Account account) => _UserDetailsBloc(account);

  BehaviorSubject<Result<provisioning_api.UserDetails>> get userDetails;
}

class _UserDetailsBloc extends InteractiveBloc implements UserDetailsBloc {
  _UserDetailsBloc(
    this.account,
  ) {
    unawaited(refresh());
  }

  final Account account;

  @override
  void dispose() {
    unawaited(userDetails.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<provisioning_api.UserDetails>> userDetails = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud(
      account.id,
      'user-details',
      userDetails,
      account.client.provisioningApi.users.getCurrentUserRaw(),
      (final response) => response.body.ocs.data,
    );
  }
}
