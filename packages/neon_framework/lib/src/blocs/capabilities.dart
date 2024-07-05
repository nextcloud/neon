import 'dart:async';

import 'package:dynamite_runtime/http_client.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:rxdart/rxdart.dart';

/// Bloc that manages the server capabilities
@sealed
abstract class CapabilitiesBloc implements InteractiveBloc {
  /// Creates a new capabilities bloc.
  @internal
  factory CapabilitiesBloc({
    required Account account,
  }) = _CapabilitiesBloc;

  /// The capabilities of the server.
  BehaviorSubject<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> get capabilities;
}

class _CapabilitiesBloc extends InteractiveBloc implements CapabilitiesBloc {
  _CapabilitiesBloc({
    required this.account,
  }) {
    unawaited(refresh());
  }

  @override
  final log = Logger('CapabilitiesBloc');

  final Account account;

  @override
  void dispose() {
    unawaited(capabilities.close());
    super.dispose();
  }

  @override
  final capabilities = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrap(
      account: account,
      subject: capabilities,
      getRequest: account.client.core.ocs.$getCapabilities_Request,
      converter: ResponseConverter(account.client.core.ocs.$getCapabilities_Serializer()),
      unwrap: (response) => response.body.ocs.data,
    );
  }
}
