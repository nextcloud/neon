import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

abstract class CapabilitiesBlocEvents {}

abstract class CapabilitiesBlocStates {
  BehaviorSubject<Result<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data>> get capabilities;
}

@internal
class CapabilitiesBloc extends InteractiveBloc implements CapabilitiesBlocEvents, CapabilitiesBlocStates {
  CapabilitiesBloc(
    this._requestManager,
    this._account,
  ) {
    unawaited(refresh());
  }

  final RequestManager _requestManager;
  final Account _account;

  @override
  void dispose() {
    unawaited(capabilities.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data>> capabilities =
      BehaviorSubject<Result<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data>>();

  @override
  Future refresh() async {
    await _requestManager.wrapNextcloud<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data,
        CoreOcsGetCapabilitiesResponse200ApplicationJson>(
      _account.id,
      'capabilities',
      capabilities,
      () async => _account.client.core.ocs.getCapabilities(),
      (final response) => response.ocs.data,
    );
  }
}
