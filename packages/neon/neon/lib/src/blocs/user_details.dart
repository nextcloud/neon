import 'dart:async';

import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/bloc.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:neon/src/utils/result.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

abstract class UserDetailsBlocEvents {}

abstract class UserDetailsBlocStates {
  BehaviorSubject<Result<ProvisioningApiUserDetails>> get userDetails;
}

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
