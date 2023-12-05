import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class UserDetailsBlocEvents {}

@internal
abstract interface class UserDetailsBlocStates {
  BehaviorSubject<Result<provisioning_api.UserDetails>> get userDetails;
}

@internal
class UserDetailsBloc extends InteractiveBloc implements UserDetailsBlocEvents, UserDetailsBlocStates {
  UserDetailsBloc(
    this._account,
  ) {
    unawaited(refresh());
  }

  final Account _account;

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
      _account.id,
      'user-details',
      userDetails,
      _account.client.provisioningApi.users.getCurrentUserRaw(),
      (final response) => response.body.ocs.data,
    );
  }
}