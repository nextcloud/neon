import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

abstract class UserDetailsBlocEvents {}

abstract class UserDetailsBlocStates {
  BehaviorSubject<Result<ProvisioningApiUserDetails>> get userDetails;
}

@internal
class UserDetailsBloc extends InteractiveBloc implements UserDetailsBlocEvents, UserDetailsBlocStates {
  UserDetailsBloc(
    this._requestManager,
    this._client,
  ) {
    unawaited(refresh());
  }

  final RequestManager _requestManager;
  final NextcloudClient _client;

  @override
  void dispose() {
    unawaited(userDetails.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<ProvisioningApiUserDetails>> userDetails =
      BehaviorSubject<Result<ProvisioningApiUserDetails>>();

  @override
  Future refresh() async {
    await _requestManager.wrapNextcloud<ProvisioningApiUserDetails, ProvisioningApiUser>(
      _client.id,
      'user-details',
      userDetails,
      () async => _client.provisioningApi.getCurrentUser(),
      (final response) => response.ocs.data,
    );
  }
}
