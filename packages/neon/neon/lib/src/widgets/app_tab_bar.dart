import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/neon.dart';
import 'package:neon/src/widgets/app_bar.dart';
import 'package:neon/src/widgets/drawer_destination.dart';
import 'package:provider/provider.dart';

@internal
class NeonTabBar extends StatelessWidget {
  const NeonTabBar({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final appsBloc = accountsBloc.activeAppsBloc;

    final tabbar = ResultBuilder.behaviorSubject(
      stream: appsBloc.appImplementations,
      builder: (final context, final snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        return _NeonTabBar(
          apps: snapshot.requireData,
        );
      },
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: tabbar,
          ),
          const NotificationIconButton(),
          const AccountSwitcherButton(),
        ],
      ),
    );
  }
}

class _NeonTabBar extends StatefulWidget {
  const _NeonTabBar({
    required this.apps,
  });

  final Iterable<AppImplementation> apps;

  @override
  State<_NeonTabBar> createState() => __NeonTabBarState();
}

class __NeonTabBarState extends State<_NeonTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AccountsBloc _accountsBloc;
  late AppsBloc _appsBloc;
  late List<AppImplementation> _apps;

  @override
  void initState() {
    super.initState();

    _accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    _appsBloc = _accountsBloc.activeAppsBloc;

    _apps = widget.apps.toList();
    final initialIndex = _apps.indexWhere((final app) => app.id == _appsBloc.activeApp.valueOrNull?.id);

    _tabController = TabController(
      initialIndex: initialIndex,
      vsync: this,
      length: widget.apps.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onAppChange(final int index) {
    _tabController.animateTo(index);

    unawaited(_appsBloc.setActiveApp(_apps[index].id));
  }

  @override
  Widget build(final BuildContext context) {
    final appDestinations = _apps.map(
      (final app) => TabExtension.fromNeonDestination(
        app.destination(context),
      ),
    );

    final drawer = TabBar(
      controller: _tabController,
      tabs: appDestinations.toList(),
      onTap: onAppChange,
      isScrollable: true,
      dividerColor: Colors.transparent,
    );

    return drawer;
  }
}
