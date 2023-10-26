import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/models/client_implementation.dart';

@internal
class NeonClientImplementationIcon extends StatelessWidget {
  const NeonClientImplementationIcon({
    required this.clientImplementation,
    this.unreadCount,
    this.color,
    this.size,
    super.key,
  });

  final ClientImplementation clientImplementation;

  final int? unreadCount;

  final Color? color;

  final double? size;

  @override
  Widget build(final BuildContext context) {
    final unreadCount = this.unreadCount ?? 0;

    final color = this.color ??
        (unreadCount > 0 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onBackground);

    final icon = Container(
      margin: const EdgeInsets.all(5),
      child: clientImplementation.buildIcon(
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
