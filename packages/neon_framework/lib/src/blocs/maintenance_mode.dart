import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:nextcloud/core.dart';

/// A Bloc checking if the server is in maintenance mode.
sealed class MaintenanceModeBloc implements InteractiveBloc {
  factory MaintenanceModeBloc({
    required Account account,
  }) = _MaintenanceModeBloc;

  /// Emits an event if the server is in maintenance mode.
  Stream<void> get onMaintenanceMode;
}

class _MaintenanceModeBloc extends InteractiveBloc implements MaintenanceModeBloc {
  _MaintenanceModeBloc({
    required this.account,
  }) {
    unawaited(refresh());
  }

  final Account account;
  final controller = StreamController<void>();

  @override
  final log = Logger('MaintenanceModeBloc');

  @override
  void dispose() {
    unawaited(controller.close());
    super.dispose();
  }

  // Broadcast stream is necessary because the Stream might be listened to multiple times (e.g. switching accounts).
  @override
  late final onMaintenanceMode = controller.stream.asBroadcastStream();

  @override
  Future<void> refresh() async {
    try {
      final status = await account.client.core.getStatus();

      if (status.body.maintenance) {
        controller.add(null);
      }
    } on http.ClientException catch (error, stackTrace) {
      log.warning(
        'Error getting the server status.',
        error,
        stackTrace,
      );

      addError(error);
    }
  }
}
