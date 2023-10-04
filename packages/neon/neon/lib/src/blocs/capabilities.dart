import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class CapabilitiesBlocEvents {}

@internal
abstract interface class CapabilitiesBlocStates {
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
  BehaviorSubject<Result<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilities = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud(
      _account.id,
      'capabilities',
      capabilities,
      _account.client.core.ocs.getCapabilitiesRaw(),
      (final response) => response.body.ocs.data,
    );
  }
}
