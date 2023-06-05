import 'package:adaptive_layout/src/app_neon/account_switcher.dart';
import 'package:adaptive_layout/src/app_neon/data.dart';
import 'package:adaptive_layout/src/app_neon/widgets/tabbar_layout.dart';
import 'package:adaptive_layout/src/files/files.dart';
import 'package:adaptive_layout/src/news/news.dart';
import 'package:adaptive_layout/src/notes/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

final apps = [
  filesApp,
  notesApp,
  newsApp,
];

class NeonMainView extends StatefulWidget {
  const NeonMainView({
    required this.state,
    required this.view,
    super.key,
  });

  final GoRouterState state;
  final Widget view;

  @override
  State<NeonMainView> createState() => _NeonMainViewState();
}

class _NeonMainViewState extends State<NeonMainView> with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  int _activeApp = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: apps.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onAppChange(int index) {
    context.goNamed(apps[index].routeName);

    setState(() {
      _activeApp = index;
    });

    _scaffoldKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final header = DrawerHeader(
      decoration: BoxDecoration(
        color: colorScheme.primary,
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(
                Icons.cloud_outlined, // that's the new NC icon for sure
                size: 100,
                color: colorScheme.onPrimary,
              ),
            ),
          ),
          const NeonAccountSwitcher(),
        ],
      ),
    );

    final drawer = NavigationDrawer(
      selectedIndex: _activeApp,
      onDestinationSelected: onAppChange,
      children: [
        header,
        ...apps.map((app) => app.destination.toDrawerDestination()),
        const NeonSettingsDrawerItem(),
      ],
    );

    final topNavigation = SlotLayout(
      config: {
        Breakpoints.large: SlotLayout.from(
          key: const Key('Large topNavigation'),
          builder: (context) {
            return Row(
              children: [
                Expanded(
                  child: TabBar(
                    tabs: apps.map((a) => a.destination.toTab()).toList(),
                    onTap: onAppChange,
                    isScrollable: true,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline),
                ),
              ],
            );
          },
        ),
      },
    );

    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer,
      body: DefaultTabController(
        length: apps.length,
        child: NeonTabBar(
          tabBarLayout: topNavigation,
          child: widget.view,
        ),
      ),
    );
  }
}
