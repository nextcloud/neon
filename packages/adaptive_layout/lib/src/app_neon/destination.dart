import 'package:flutter/material.dart';

class NeonNavigationDestination {
  const NeonNavigationDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.notificationCount = 0,
  });

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final int notificationCount;

  NavigationDestination toDestination() {
    return NavigationDestination(
      label: label,
      icon: icon,
      selectedIcon: selectedIcon,
    );
  }

  NavigationRailDestination toRailDestination() {
    var iconWIdget = icon;

    if (notificationCount > 0) {
      iconWIdget = Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: iconWIdget,
          ),
          Text(notificationCount.toString()),
        ],
      );
    }

    return NavigationRailDestination(
      label: Text(label),
      icon: iconWIdget,
      selectedIcon: selectedIcon,
    );
  }

  NavigationDrawerDestination toDrawerDestination() {
    Widget labelWidget = Text(label);

    if (notificationCount > 0) {
      labelWidget = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          labelWidget,
          Text(notificationCount.toString()),
        ],
      );
    }

    return NavigationDrawerDestination(
      label: labelWidget,
      icon: icon,
      selectedIcon: selectedIcon,
    );
  }

  Tab toTab() {
    return Tab(
      icon: icon,
      text: label,
    );
  }
}
