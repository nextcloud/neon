part of '../neon.dart';

class AppImplementationIcon extends StatelessWidget {
  const AppImplementationIcon({
    required this.appImplementation,
    this.unreadCount = 0,
    this.color,
    this.width = kAvatarSize,
    this.height = kAvatarSize,
    super.key,
  });

  final AppImplementation appImplementation;

  final int unreadCount;

  final Color? color;

  final double width;

  final double height;

  @override
  Widget build(final BuildContext context) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: appImplementation.buildIcon(
              context,
              height: height,
              width: width,
              color: color,
            ),
          ),
          if (unreadCount > 0) ...[
            Text(
              unreadCount.toString(),
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      );
}
