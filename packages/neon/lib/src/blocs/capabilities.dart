import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'capabilities.rxb.g.dart';

typedef Capabilities = CoreServerCapabilitiesOcsDataCapabilities;
typedef NextcloudTheme = CoreServerCapabilitiesOcsDataCapabilitiesTheming;

abstract class CapabilitiesBlocEvents {}

abstract class CapabilitiesBlocStates {
  BehaviorSubject<Result<Capabilities>> get capabilities;
}

@RxBloc()
class CapabilitiesBloc extends $CapabilitiesBloc {
  CapabilitiesBloc(
    this._requestManager,
    this._client,
  ) {
    _loadCapabilities();
  }

  void _loadCapabilities() {
    _requestManager
        .wrapNextcloud<Capabilities, CoreServerCapabilities, void, NextcloudCoreClient>(
          _client.id,
          _client.core,
          'capabilities',
          () async => (await _client.core.getCapabilities())!,
          (final response) => response.ocs!.data!.capabilities!,
          preloadCache: true,
        )
        .listen(_capabilitiesSubject.add);
  }

  final RequestManager _requestManager;
  final NextcloudClient _client;

  final _capabilitiesSubject = BehaviorSubject<Result<Capabilities>>();

  @override
  void dispose() {
    _capabilitiesSubject.close();
    super.dispose();
  }

  @override
  BehaviorSubject<Result<Capabilities>> _mapToCapabilitiesState() => _capabilitiesSubject;
}
