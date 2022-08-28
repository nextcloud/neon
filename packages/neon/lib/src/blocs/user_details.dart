import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'user_details.rxb.g.dart';

abstract class UserDetailsBlocEvents {
  void refresh();
}

abstract class UserDetailsBlocStates {
  BehaviorSubject<Result<ProvisioningApiUserDetails>> get userDetails;
}

@RxBloc()
class UserDetailsBloc extends $UserDetailsBloc {
  UserDetailsBloc(
    this._requestManager,
    this._client,
  ) {
    _$refreshEvent.listen((final _) => _loadUserDetails());

    _loadUserDetails();
  }

  void _loadUserDetails() {
    _requestManager
        .wrapNextcloud<ProvisioningApiUserDetails, ProvisioningApiUser, void, NextcloudProvisioningApiClient>(
          _client.id,
          _client.provisioningApi,
          'user-details',
          () async => (await _client.provisioningApi.getCurrentUser())!,
          (final response) => response.ocs!.data!,
          preloadCache: true,
        )
        .listen(_userDetailsSubject.add);
  }

  final RequestManager _requestManager;
  final NextcloudClient _client;

  final _userDetailsSubject = BehaviorSubject<Result<ProvisioningApiUserDetails>>();

  @override
  void dispose() {
    _userDetailsSubject.close();
    super.dispose();
  }

  @override
  BehaviorSubject<Result<ProvisioningApiUserDetails>> _mapToUserDetailsState() => _userDetailsSubject;
}
