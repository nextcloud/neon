import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';

@internal
typedef DestinationIconBuilder = Widget Function({double? size, Color color});

@internal
class NeonNavigationDestination {
  const NeonNavigationDestination({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.notificationCount,
  });

  final String label;
  final DestinationIconBuilder icon;
  final Widget? selectedIcon;
  final BehaviorSubject<int>? notificationCount;
}

@internal
extension NavigationDestinationExtension on NavigationDestination {
  static NavigationDestination fromNeonDestination(final NeonNavigationDestination neonDestination) =>
      NavigationDestination(
        label: neonDestination.label,
        icon: neonDestination.icon(),
        selectedIcon: neonDestination.selectedIcon,
      );
}

@internal
extension NavigationRailDestinationExtension on NavigationRailDestination {
  static NavigationRailDestination fromNeonDestination(final NeonNavigationDestination neonDestination) {
    final iconWidget = StreamBuilder(
      stream: neonDestination.notificationCount,
      initialData: 0,
      builder: (final context, final snapshot) {
        final colorScheme = Theme.of(context).colorScheme;

        final color = snapshot.requireData > 0 ? colorScheme.primary : colorScheme.onBackground;

        final icon = Container(
          margin: const EdgeInsets.all(5),
          child: neonDestination.icon(color: color),
        );

        if (snapshot.requireData <= 0) {
          return icon;
        }

        final notificationIdicator = Builder(
          builder: (final context) {
            final style = TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            );

            return Text(
              snapshot.requireData.toString(),
              style: style,
            );
          },
        );

        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            icon,
            notificationIdicator,
          ],
        );
      },
    );

    return NavigationRailDestination(
      label: Text(neonDestination.label),
      icon: iconWidget,
      selectedIcon: neonDestination.selectedIcon,
    );
  }
}

@internal
extension NavigationDrawerDestinationExtension on NavigationDrawerDestination {
  static NavigationDrawerDestination fromNeonDestination(final NeonNavigationDestination neonDestination) {
    final labelWidget = StreamBuilder(
      stream: neonDestination.notificationCount,
      initialData: 0,
      builder: (final context, final snapshot) {
        final label = Text(neonDestination.label);

        if (snapshot.requireData <= 0) {
          return label;
        }

        final notificationIdicator = Padding(
          padding: const EdgeInsets.only(left: 12, right: 24),
          child: Builder(
            builder: (final context) {
              final style = TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              );

              return Text(
                snapshot.requireData.toString(),
                style: style,
              );
            },
          ),
        );

        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              label,
              notificationIdicator,
            ],
          ),
        );
      },
    );

    return NavigationDrawerDestination(
      label: labelWidget,
      icon: neonDestination.icon(),
      selectedIcon: neonDestination.selectedIcon,
    );
  }
}

@internal
extension TabExtension on Tab {
  static Tab fromNeonDestination(final NeonNavigationDestination neonDestination) => Tab(
        text: neonDestination.label,
        icon: neonDestination.icon(),
      );
}
