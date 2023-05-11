part of '../../neon.dart';

typedef Capabilities = NextcloudCoreServerCapabilities_Ocs_Data;
typedef NextcloudTheme = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming;

abstract class CapabilitiesBlocEvents {}

abstract class CapabilitiesBlocStates {
  BehaviorSubject<Result<Capabilities>> get capabilities;
}

class CapabilitiesBloc extends InteractiveBloc implements CapabilitiesBlocEvents, CapabilitiesBlocStates {
  CapabilitiesBloc(
    this._requestManager,
    this._client,
  ) {
    capabilities.listen((final value) {
      themeNotifier.value = value.data!.capabilities.theming;
    });

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
    await _requestManager.wrapNextcloud<NextcloudCoreServerCapabilities_Ocs_Data, NextcloudCoreServerCapabilities>(
      _client.id,
      'capabilities',
      capabilities,
      () async => _client.core.getCapabilities(),
      (final response) => response.ocs.data,
    );
  }
}
