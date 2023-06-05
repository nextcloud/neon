import 'package:adaptive_layout/src/app_neon/app_interface.dart';
import 'package:adaptive_layout/src/app_neon/app_route.dart';
import 'package:adaptive_layout/src/app_neon/destination.dart';
import 'package:adaptive_layout/src/app_neon/widgets/navbar_layout.dart';
import 'package:adaptive_layout/src/app_neon/widgets/navrail_layout.dart';
import 'package:adaptive_layout/src/app_neon/widgets/tabbar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

part 'notes.g.dart';
part 'routes.dart';

final _destinations = <NeonNavigationDestination>[
  const NeonNavigationDestination(
    icon: Icon(Icons.note_outlined),
    selectedIcon: Icon(Icons.note),
    label: 'Notes',
  ),
  const NeonNavigationDestination(
    icon: Icon(Icons.label_outline),
    selectedIcon: Icon(Icons.label),
    label: 'Category',
  ),
];

final _appNavNotifier = ValueNotifier<int>(0);

final _listView = ListView.builder(
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.article_outlined),
        title: const Text('item'),
        trailing: Text(index.toString()),
      ),
    );
  },
);

final _gridView = GridView.builder(
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.article_outlined),
        title: const Text('item'),
        trailing: Text(index.toString()),
      ),
    );
  },
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
);

final view = ValueListenableBuilder(
  valueListenable: _appNavNotifier,
  builder: (context, value, child) {
    if (value == 1) {
      return _gridView;
    }

    return _listView;
  },
);

final fab = FloatingActionButton(
  onPressed: () {},
  tooltip: 'Create Note',
  child: const Icon(Icons.add),
);

class NotesAppView extends StatelessWidget {
  const NotesAppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final topNavigation = NeonTabBar.of(context).tabBarLayout;

    return AdaptiveLayout(
      internalAnimations: false,
      topNavigation: topNavigation,
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig?>{
          Breakpoints.standard: SlotLayout.from(
            key: const Key('body'),
            builder: (_) => Scaffold(
              body: view,
            ),
          ),
          Breakpoints.small: SlotLayout.from(
            key: const Key('body'),
            builder: (context) {
              final drawerButton = DrawerButton(
                onPressed: Scaffold.of(context).openDrawer,
              );

              return Scaffold(
                appBar: AppBar(
                  leading: drawerButton,
                  title: const Text('Notes'),
                ),
                body: view,
                floatingActionButton: fab,
              );
            },
          ),
        },
      ),
      secondaryBody: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig?>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('body'),
            builder: (_) => Scaffold(
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: const Text('item'),
                      trailing: Text(index.toString()),
                    ),
                  );
                },
              ),
            ),
          ),
        },
      ),
      primaryNavigation: NeonNavRailLayout(
        destinations: _destinations,
        valueListenable: _appNavNotifier,
        floatingActionButton: fab,
      ),
      bottomNavigation: NeonNavBarLayout(
        destinations: _destinations,
        valueListenable: _appNavNotifier,
      ),
    );
  }
}

final notesApp = App(
  route: $notesAppRoute,
  destination: const NeonNavigationDestination(
    icon: Icon(Icons.edit_outlined),
    selectedIcon: Icon(Icons.edit),
    label: 'Notes',
  ),
);
