import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/widgets/cached_image.dart';
import 'package:neon/src/widgets/drawer_destination.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/nextcloud.dart';
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

    return ResultBuilder.behaviorSubject(
      stream: appsBloc.appImplementations,
      builder: (final context, final snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        return _NeonDrawer(
          apps: snapshot.requireData,
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

class __NeonDrawerState extends State<_NeonDrawer> {
  late AccountsBloc _accountsBloc;
  late AppsBloc _appsBloc;
  late List<AppImplementation> _apps;

  late int _activeApp;

  @override
  void initState() {
    super.initState();

    _accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    _appsBloc = _accountsBloc.activeAppsBloc;

    _apps = widget.apps.toList();
    _activeApp = _apps.indexWhere((final app) => app.id == _appsBloc.activeApp.valueOrNull?.id);
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

    final branding = ResultBuilder<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data>.behaviorSubject(
      stream: capabilitiesBloc.capabilities,
      builder: (final context, final capabilities) {
        if (!capabilities.hasData) {
          return NeonLinearProgressIndicator(
            visible: capabilities.isLoading,
          );
        }

        if (capabilities.hasError) {
          return NeonException(
            capabilities.error,
            onRetry: capabilitiesBloc.refresh,
          );
        }

        final theme = capabilities.requireData.capabilities.theming;

        if (theme == null) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              theme.name,
              style: DefaultTextStyle.of(context).style.copyWith(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  ),
            ),
            Flexible(
              child: NeonCachedImage.url(
                url: theme.logo,
              ),
            ),
          ],
        );
      },
    );

    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: branding,
    );
  }
}
