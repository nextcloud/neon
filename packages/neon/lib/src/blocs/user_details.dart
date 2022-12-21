part of '../neon.dart';

abstract class UserDetailsBlocEvents {}

abstract class UserDetailsBlocStates {
  BehaviorSubject<Result<NextcloudProvisioningApiUserDetails>> get userDetails;
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
  BehaviorSubject<Result<NextcloudProvisioningApiUserDetails>> userDetails =
      BehaviorSubject<Result<NextcloudProvisioningApiUserDetails>>();

  @override
  Future refresh() async {
    await _requestManager.wrapNextcloud<NextcloudProvisioningApiUserDetails, NextcloudProvisioningApiUser>(
      _client.id,
      'user-details',
      userDetails,
      () async => _client.provisioningApi.getCurrentUser(),
      (final response) => response.ocs.data,
    );
  }
}
