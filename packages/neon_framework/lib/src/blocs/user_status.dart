import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/timer.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:rxdart/rxdart.dart';
import 'package:window_manager/window_manager.dart';

/// Bloc for managing user statuses.
@sealed
abstract class UserStatusBloc implements InteractiveBloc {
  /// Create a new user status bloc.
  factory UserStatusBloc(Account account) => _UserStatusBloc(account);

  /// Load the user status of the user with the [username] on the same server.
  ///
  /// Set [force] to true to load the status even if one has already been loaded.
  void load(
    String username, {
    Result<user_status.$PublicInterface>? status,
    bool force = false,
  });

  /// Set the status type.
  void setStatusType(String statusType);

  /// Set a predefined status message using the [id] and [clearAt] as unix timestamp.
  ///
  /// Predefined status messages received from [predefinedStatuses].
  void setPredefinedMessage({
    required String id,
    required int? clearAt,
  });

  /// Set a custom status [message] with the [icon] and [clearAt] as unix timestamp.
  void setCustomMessage({
    required String? message,
    required String? icon,
    required int? clearAt,
  });

  /// Clear the current status message.
  void clearMessage();

  /// The status of the account.
  BehaviorSubject<Result<user_status.$PublicInterface>> get status;

  /// All user status mapped by username.
  BehaviorSubject<BuiltMap<String, Result<user_status.$PublicInterface>>> get statuses;

  /// All predefined statuses.
  BehaviorSubject<Result<BuiltList<user_status.Predefined>>> get predefinedStatuses;
}

class _UserStatusBloc extends InteractiveBloc implements UserStatusBloc {
  _UserStatusBloc(
    this.account,
  ) {
    unawaited(refresh());
    timer = TimerBloc().registerTimer(const Duration(minutes: 5), refresh);
  }

  final Account account;
  late final NeonTimer timer;

  @override
  void dispose() {
    timer.cancel();
    unawaited(status.close());
    unawaited(statuses.close());
    unawaited(predefinedStatuses.close());
    super.dispose();
  }

  @override
  final status = BehaviorSubject();

  @override
  final statuses = BehaviorSubject.seeded(BuiltMap());

  @override
  final predefinedStatuses = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await Future.wait([
      RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'user_status-predefined-statuses',
        subject: predefinedStatuses,
        rawResponse: account.client.userStatus.predefinedStatus.findAllRaw(),
        unwrap: (response) => response.body.ocs.data,
      ),
      ...statuses.value.entries.map((entry) => load(entry.key, status: entry.value, force: true)),
    ]);
  }

  @override
  Future<void> load(String username, {Result<user_status.$PublicInterface>? status, bool force = false}) async {
    final result = status ?? statuses.valueOrNull?[username];

    if (!force && result != null && !result.hasError) {
      return;
    }

    updateStatus(username, result?.asLoading() ?? Result.loading());
    try {
      user_status.$PublicInterface? data;

      if (account.username == username) {
        var isAway = false;
        if (NeonPlatform.instance.canUseWindowManager) {
          final focused = await windowManager.isFocused();
          final visible = await windowManager.isVisible();
          isAway = !focused || !visible;
        }

        try {
          final response = await account.client.userStatus.heartbeat.heartbeat(
            status: isAway ? 'away' : 'online',
          );
          data = response.body.ocs.data;
        } on DynamiteStatusCodeException catch (e) {
          // 204 is returned if the heartbeat failed because the current status is different. Ignore this and fetch the normal status
          if (e.statusCode != 204) {
            rethrow;
          }
        }
      }

      if (data == null) {
        try {
          final response = await account.client.userStatus.statuses.find(userId: username);
          data = response.body.ocs.data;
        } on DynamiteStatusCodeException catch (e) {
          if (e.statusCode != 404) {
            rethrow;
          }
        }
      }

      updateStatus(username, Result.success(correctStatus(data)));
    } on DynamiteStatusCodeException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      updateStatus(username, Result.error(e));
    }
  }

  /// Reconstructs the message and icon for a private [status] using the [predefinedStatuses] in case it is a predefined status.
  user_status.$PublicInterface? correctStatus(user_status.$PublicInterface? status) {
    if (status is user_status.Private && status.messageIsPredefined) {
      final id = status.messageId;
      final predefinedStatus =
          predefinedStatuses.valueOrNull?.data?.firstWhereOrNull((predefined) => predefined.id == id);
      if (predefinedStatus != null) {
        return status.rebuild(
          (b) => b
            ..message = predefinedStatus.message
            ..icon = predefinedStatus.icon,
        );
      }
    }
    return status;
  }

  void updateStatus(String username, Result<user_status.$PublicInterface> status) {
    statuses.add(
      statuses.value.rebuild((b) {
        b[username] = status;
      }),
    );
    if (username == account.username) {
      this.status.add(status);
    }
  }

  @override
  Future<void> setStatusType(String statusType) async {
    await wrapAction(
      () async {
        final response = await account.client.userStatus.userStatus.setStatus(statusType: statusType);

        updateStatus(account.username, Result.success(correctStatus(response.body.ocs.data)));
      },
      refresh: () async {},
    );
  }

  @override
  Future<void> setPredefinedMessage({
    required String id,
    required int? clearAt,
  }) async {
    await wrapAction(
      () async {
        final response = await account.client.userStatus.userStatus.setPredefinedMessage(
          messageId: id,
          clearAt: clearAt,
        );

        updateStatus(account.username, Result.success(correctStatus(response.body.ocs.data)));
      },
      refresh: () async {},
    );
  }

  @override
  Future<void> setCustomMessage({
    required String? message,
    required String? icon,
    required int? clearAt,
  }) async {
    await wrapAction(
      () async {
        final response = await account.client.userStatus.userStatus.setCustomMessage(
          statusIcon: icon,
          message: message,
          clearAt: clearAt,
        );

        updateStatus(account.username, Result.success(correctStatus(response.body.ocs.data)));
      },
      refresh: () async {},
    );
  }

  @override
  Future<void> clearMessage() async {
    await wrapAction(
      () async {
        await account.client.userStatus.userStatus.clearMessage();
      },
      refresh: () async {
        await load(account.username, force: true);
      },
    );
  }
}
