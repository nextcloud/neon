import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/neon.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/widgets/drawer_destination.dart';
import 'package:provider/provider.dart';

@internal
class NeonDrawer extends StatelessWidget {
  const NeonDrawer({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final appsBloc = accountsBloc.activeAppsBloc;

    return StreamBuilder(
      stream: appsBloc.appImplementations,
      builder: (final context, final snapshot) {
        if (snapshot.data?.data == null) {
          return Container();
        }

        return _NeonDrawer(
          apps: snapshot.data!.data!,
        );
      },
    );
  }
}

class _NeonDrawer extends StatefulWidget {
  const _NeonDrawer({
    required this.apps,
  });

  final Iterable<AppImplementation> apps;

  @override
  State<_NeonDrawer> createState() => __NeonDrawerState();
}

class __NeonDrawerState extends State<_NeonDrawer> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AccountsBloc _accountsBloc;
  late AppsBloc _appsBloc;
  late List<AppImplementation> _apps;

  int _activeApp = 0;

  @override
  void initState() {
    super.initState();

    _accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    _appsBloc = _accountsBloc.activeAppsBloc;

    _apps = widget.apps.toList();
    _activeApp = _apps.indexWhere((final app) => app.id == _appsBloc.activeAppID.valueOrNull);

    _tabController = TabController(
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
    Scaffold.maybeOf(context)?.closeDrawer();

    // selected item is not a registered app like the SettingsPage
    if (index >= _apps.length) {
      const SettingsRoute().go(context);
      return;
    }

    setState(() {
      _activeApp = index;
    });

    unawaited(_appsBloc.setActiveApp(_apps[index].id));
    //context.goNamed(apps[index].routeName);
  }

  @override
  Widget build(final BuildContext context) {
    final appDestinations = _apps.map(
      (final app) => NavigationDrawerDestinationExtension.fromNeonDestination(
        app.destination(context),
      ),
    );

    final drawer = NavigationDrawer(
      selectedIndex: _activeApp,
      onDestinationSelected: onAppChange,
      children: [
        const NeonDrawerHeader(),
        ...appDestinations,
        NavigationDrawerDestination(
          icon: const Icon(Icons.settings),
          label: Text(AppLocalizations.of(context).settings),
        ),
      ],
    );

    return drawer;
  }
}

@internal
class NeonDrawerHeader extends StatelessWidget {
  const NeonDrawerHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final capabilitiesBloc = accountsBloc.activeCapabilitiesBloc;

    final accountSelecor = StreamBuilder<List<Account>>(
      stream: accountsBloc.accounts,
      builder: (final context, final accountsSnapshot) {
        final accounts = accountsSnapshot.data;
        if (accounts == null || accounts.length <= 1) {
          return const SizedBox.shrink();
        }

        final items = accounts.map((final account) {
          final child = NeonAccountTile(
            account: account,
            dense: true,
            textColor: Theme.of(context).appBarTheme.foregroundColor,
          );

          return DropdownMenuItem(
            value: account,
            child: child,
          );
        }).toList();

        return DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            dropdownColor: Theme.of(context).colorScheme.primary,
            iconEnabledColor: Theme.of(context).colorScheme.onBackground,
            value: accountsBloc.activeAccount.value,
            items: items,
            onChanged: (final account) {
              if (account == null) {
                return;
              }

              accountsBloc.setActiveAccount(account);
            },
          ),
        );
      },
    );

    return ResultBuilder<Capabilities>.behaviorSubject(
      stream: capabilitiesBloc.capabilities,
      builder: (final context, final capabilities) => DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (capabilities.data != null) ...[
              if (capabilities.data!.capabilities.theming?.name != null) ...[
                Text(
                  capabilities.data!.capabilities.theming!.name!,
                  style: DefaultTextStyle.of(context).style.copyWith(
                        color: Theme.of(context).appBarTheme.foregroundColor,
                      ),
                ),
              ],
              if (capabilities.data!.capabilities.theming?.logo != null) ...[
                Flexible(
                  child: NeonCachedUrlImage(
                    url: capabilities.data!.capabilities.theming!.logo!,
                  ),
                ),
              ],
            ] else ...[
              NeonException(
                capabilities.error,
                onRetry: capabilitiesBloc.refresh,
              ),
              NeonLinearProgressIndicator(
                visible: capabilities.isLoading,
              ),
            ],
            accountSelecor,
          ],
        ),
      ),
    );
  }
}
