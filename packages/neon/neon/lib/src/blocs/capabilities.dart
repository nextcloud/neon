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
  BehaviorSubject<Result<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> get capabilities;
}

@internal
class CapabilitiesBloc extends InteractiveBloc implements CapabilitiesBlocEvents, CapabilitiesBlocStates {
  CapabilitiesBloc(
    this._account,
  ) {
    unawaited(refresh());
  }

  final Account _account;

  @override
  void dispose() {
    unawaited(capabilities.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilities =
      BehaviorSubject<Result<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data>>();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data,
        CoreOcsGetCapabilitiesResponseApplicationJson>(
      _account.id,
      'capabilities',
      capabilities,
      () async => _account.client.core.ocs.getCapabilities(),
      (final response) => response.ocs.data,
    );
  }
}
