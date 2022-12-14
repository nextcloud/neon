part of '../neon.dart';

typedef Capabilities = CoreServerCapabilities_Ocs_Data;
typedef NextcloudTheme = CoreServerCapabilities_Ocs_Data_Capabilities_Theming;

abstract class CapabilitiesBlocEvents {}

abstract class CapabilitiesBlocStates {
  BehaviorSubject<Result<Capabilities>> get capabilities;
}

class CapabilitiesBloc extends InteractiveBloc implements CapabilitiesBlocEvents, CapabilitiesBlocStates {
  CapabilitiesBloc(
    this._requestManager,
    this._client,
  ) {
    unawaited(refresh());
  }

  final RequestManager _requestManager;
  final NextcloudClient _client;

  @override
  void dispose() {
    unawaited(capabilities.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<Capabilities>> capabilities = BehaviorSubject<Result<Capabilities>>();

  @override
  Future refresh() async {
    await _requestManager.wrapNextcloud<CoreServerCapabilities_Ocs_Data, CoreServerCapabilities>(
      _client.id,
      'capabilities',
      capabilities,
      () async => _client.core.getCapabilities(),
      (final response) => response.ocs.data,
    );
  }
}
