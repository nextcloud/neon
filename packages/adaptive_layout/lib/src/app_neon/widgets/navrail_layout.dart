import 'package:adaptive_layout/src/app_neon/data.dart';
import 'package:adaptive_layout/src/app_neon/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class NeonNavRailLayout extends SlotLayout {
  NeonNavRailLayout({
    required List<NeonNavigationDestination> destinations,
    required ValueNotifier<int> valueListenable,
    FloatingActionButton? floatingActionButton,
    super.key,
  }) : super(
          config: <Breakpoint, SlotLayoutConfig?>{
            Breakpoints.medium: SlotLayout.from(
              key: const Key('primaryNavigation'),
              outAnimation: AdaptiveScaffold.leftInOut,
              builder: (_) {
                final fab = floatingActionButton != null
                    ? FloatingActionButton(
                        onPressed: floatingActionButton.onPressed,
                        tooltip: floatingActionButton.tooltip,
                        elevation: 0,
                        child: floatingActionButton.child,
                      )
                    : const SizedBox(height: 56);

                return ValueListenableBuilder(
                  valueListenable: valueListenable,
                  builder: (context, value, child) => SizedBox(
                    width: 80,
                    child: NavigationRail(
                      leading: Column(
                        children: [
                          const SizedBox(height: 56),
                          const DrawerButton(),
                          const SizedBox(height: 16),
                          fab,
                          const SizedBox(height: 80),
                        ],
                      ),
                      destinations: destinations.map((d) => d.toRailDestination()).toList(),
                      selectedIndex: value,
                      onDestinationSelected: (index) => valueListenable.value = index,
                      labelType: NavigationRailLabelType.all,
                    ),
                  ),
                );
              },
            ),
            Breakpoints.large: SlotLayout.from(
              key: const Key('Large primaryNavigation'),
              builder: (context) {
                // this is ugly. We should abstract this in another way
                final fab = floatingActionButton != null
                    ? FloatingActionButton.extended(
                        onPressed: floatingActionButton.onPressed,
                        label: Text(floatingActionButton.tooltip!),
                        icon: floatingActionButton.child,
                        elevation: 0,
                      )
                    : null;

                return ValueListenableBuilder(
                  valueListenable: valueListenable,
                  builder: (context, value, child) => NavigationDrawer(
                    selectedIndex: value,
                    onDestinationSelected: (index) => valueListenable.value = index,
                    children: <Widget>[
                      const NeonDrawerHeader(name: 'coolApp'),
                      if (fab != null) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 16,
                          ),
                          child: fab,
                        ),
                      ],
                      ...destinations.map((d) => d.toDrawerDestination()),
                    ],
                  ),
                );
              },
            ),
          },
        );
}
