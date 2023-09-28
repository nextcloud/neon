import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/models/app_implementation.dart';

@internal
class NeonAppImplementationIcon extends StatelessWidget {
  const NeonAppImplementationIcon({
    required this.appImplementation,
    this.unreadCount = 0,
    this.color,
    this.size,
    super.key,
  });

  final AppImplementation appImplementation;

  final int unreadCount;

  final Color? color;

  final double? size;

  @override
  Widget build(final BuildContext context) {
    final icon = Container(
      margin: const EdgeInsets.all(5),
      child: appImplementation.buildIcon(
        size: size,
        color: color,
      ),
    );

    if (unreadCount == 0) {
      return icon;
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        icon,
        Text(
          unreadCount.toString(),
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
