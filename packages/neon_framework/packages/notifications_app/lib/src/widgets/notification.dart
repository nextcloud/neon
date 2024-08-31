import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:notifications_app/src/widgets/action.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationsNotification extends StatelessWidget {
  const NotificationsNotification({
    required this.notification,
    required this.onDelete,
    super.key,
  });

  final notifications.Notification notification;

  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final subject = notification.subjectRichParameters!.isNotEmpty
        ? Text.rich(
            buildRichTextSpan(
              text: notification.subjectRich!,
              parameters: notification.subjectRichParameters!,
              references: BuiltList(),
              style: Theme.of(context).textTheme.bodyLarge!,
              onReferenceClicked: (_) {},
            ),
          )
        : Text(notification.subject);

    final message = notification.messageRichParameters!.isNotEmpty
        ? Text.rich(
            buildRichTextSpan(
              text: notification.messageRich!,
              parameters: notification.messageRichParameters!,
              references: BuiltList(),
              style: Theme.of(context).textTheme.bodyMedium!,
              onReferenceClicked: (_) {},
            ),
            overflow: TextOverflow.ellipsis,
          )
        : Text(
            notification.message,
            overflow: TextOverflow.ellipsis,
          );

    return Dismissible(
      key: Key(notification.notificationId.toString()),
      direction: DismissDirection.startToEnd,
      behavior: HitTestBehavior.translucent,
      background: Container(color: Colors.red),
      onDismissed: (_) {
        onDelete();
      },
      child: ListTile(
        title: subject,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (notification.message.isNotEmpty) message,
            RelativeTime(
              date: tz.TZDateTime.parse(tz.UTC, notification.datetime),
            ),
            if (notification.actions.isNotEmpty)
              Row(
                children: notification.actions
                    .map(
                      (action) => NotificationsAction(
                        action: action,
                      ),
                    )
                    .toList(),
              ),
          ]
              .intersperse(
                const SizedBox(
                  height: 5,
                ),
              )
              .toList(),
        ),
        leading: NeonUriImage(
          account: NeonProvider.of<Account>(context),
          uri: Uri.parse(notification.icon!),
          size: const Size.square(largeIconSize),
          svgColorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        ),
        onTap: notification.link.isNotEmpty
            ? () async => launchUrl(NeonProvider.of<Account>(context), notification.link)
            : null,
      ),
    );
  }
}
