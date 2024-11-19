import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/widgets/dialog.dart';
import 'package:neon_framework/utils.dart';

/// For testing using `MockAccount` is just fine because each of them will have a different hashCode and will not interfere with existing state.
Map<Account, DateTime> _lastPasswordConfirmations = {};

/// Confirms the user password if necessary.
///
/// Returns `true` if not necessary or successful.
/// Returns `false` if the user aborted or it was unsuccessful.
Future<bool> confirmPassword(
  BuildContext context, {
  @visibleForTesting DateTime? now,
}) async {
  final account = NeonProvider.of<Account>(context);
  final lastConfirmation = _lastPasswordConfirmations[account];
  if (lastConfirmation != null && (now ?? DateTime.now()).difference(lastConfirmation) < const Duration(minutes: 30)) {
    return true;
  }

  final result = await showAdaptiveDialog<bool?>(
    context: context,
    builder: (context) => NeonPasswordConfirmationDialog(
      account: account,
    ),
  );

  if (result == null || !result) {
    return false;
  }

  _lastPasswordConfirmations[account] = now ?? DateTime.now();
  return true;
}
