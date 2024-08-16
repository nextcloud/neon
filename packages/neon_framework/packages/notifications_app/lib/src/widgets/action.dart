import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/notifications.dart' as notifications;

class NotificationsAction extends StatelessWidget {
  const NotificationsAction({
    required this.action,
    super.key,
  });

  final notifications.NotificationAction action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await launchUrl(NeonProvider.of<Account>(context), action.link);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: action.primary ? Theme.of(context).colorScheme.onPrimary : null,
        backgroundColor: action.primary ? Theme.of(context).colorScheme.primary : null,
      ),
      child: Text(action.label),
    );
  }
}
