import 'dart:async';

import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'capabilities.rxb.g.dart';

typedef Capabilities = CoreServerCapabilitiesOcsData;
typedef NextcloudTheme = CoreServerCapabilitiesOcsDataCapabilitiesTheming;

abstract class CapabilitiesBlocEvents {
  void refresh();
}

abstract class CapabilitiesBlocStates {
  BehaviorSubject<Result<Capabilities>> get capabilities;
}

@RxBloc()
class CapabilitiesBloc extends $CapabilitiesBloc {
  CapabilitiesBloc(
    this._requestManager,
    this._client,
  ) {
    _$refreshEvent.listen((final _) => _loadCapabilities());

    _loadCapabilities();
  }

  void _loadCapabilities() {
    _requestManager
        .wrapNextcloud<CoreServerCapabilitiesOcsData, CoreServerCapabilities>(
          _client.id,
          'capabilities',
          () async => _client.core.getCapabilities(),
          (final response) => response.ocs!.data!,
          previousData: _capabilitiesSubject.valueOrNull?.data,
        )
        .listen(_capabilitiesSubject.add);
  }

  final RequestManager _requestManager;
  final NextcloudClient _client;

  final _capabilitiesSubject = BehaviorSubject<Result<Capabilities>>();

  @override
  void dispose() {
    unawaited(_capabilitiesSubject.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<Capabilities>> _mapToCapabilitiesState() => _capabilitiesSubject;
}
