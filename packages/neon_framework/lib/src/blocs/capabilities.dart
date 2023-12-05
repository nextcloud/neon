import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class CapabilitiesBlocEvents {}

@internal
abstract interface class CapabilitiesBlocStates {
  BehaviorSubject<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> get capabilities;
}

@internal
class CapabilitiesBloc extends InteractiveBloc implements CapabilitiesBlocEvents, CapabilitiesBlocStates {
  /// Creates a new capabilities bloc.
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
  BehaviorSubject<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilities = BehaviorSubject();

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
