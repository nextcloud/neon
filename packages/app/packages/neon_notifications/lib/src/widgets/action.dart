import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      onPressed: () {
        context.go(action.link);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: action.primary ? Theme.of(context).colorScheme.onPrimary : null,
        backgroundColor: action.primary ? Theme.of(context).colorScheme.primary : null,
      ),
      child: Text(action.label),
    );
  }
}
