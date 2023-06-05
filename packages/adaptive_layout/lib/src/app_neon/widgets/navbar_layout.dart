import 'package:adaptive_layout/src/app_neon/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class NeonNavBarLayout extends SlotLayout {
  NeonNavBarLayout({
    required List<NeonNavigationDestination> destinations,
    required ValueNotifier<int> valueListenable,
    super.key,
  }) : super(
          config: <Breakpoint, SlotLayoutConfig?>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('bottomNavigation'),
              outAnimation: AdaptiveScaffold.topToBottom,
              builder: (_) {
                return ValueListenableBuilder(
                  valueListenable: valueListenable,
                  builder: (context, value, child) => NavigationBar(
                    selectedIndex: value,
                    destinations:
                        destinations.map((d) => d.toDestination()).toList(),
                    onDestinationSelected: (index) =>
                        valueListenable.value = index,
                  ),
                );
              },
            ),
          },
        );
}
