import 'package:adaptive_layout/src/app_neon/app_interface.dart';
import 'package:adaptive_layout/src/app_neon/app_route.dart';
import 'package:adaptive_layout/src/app_neon/destination.dart';
import 'package:adaptive_layout/src/app_neon/widgets/tabbar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

part 'files.g.dart';
part 'routes.dart';

final view = ListView.builder(
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.folder_outlined),
        title: const Text('item'),
        trailing: Text(index.toString()),
      ),
    );
  },
);

final fab = FloatingActionButton(
  onPressed: () {},
  child: const Icon(Icons.add),
);

class FilesAppView extends StatelessWidget {
  const FilesAppView({
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
            builder: (context) {
              final drawerButton = DrawerButton(
                onPressed: Scaffold.of(context).openDrawer,
              );

              return Scaffold(
                appBar: AppBar(
                  leading: drawerButton,
                  title: const Text('Files'),
                ),
                body: view,
                floatingActionButton: fab,
              );
            },
          ),
          Breakpoints.large: SlotLayout.from(
            key: const Key('body'),
            builder: (_) => Scaffold(
              body: view,
              floatingActionButton: fab,
            ),
          ),
        },
      ),
    );
  }
}

final filesApp = App(
  route: $filesAppRoute,
  destination: const NeonNavigationDestination(
    icon: Icon(Icons.folder_outlined),
    selectedIcon: Icon(Icons.folder),
    label: 'Files',
  ),
);
