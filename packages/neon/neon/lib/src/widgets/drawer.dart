import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/clients.dart';
import 'package:neon/src/models/client_implementation.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:neon/src/widgets/drawer_destination.dart';
import 'package:neon/src/widgets/error.dart';
import 'package:neon/src/widgets/image.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/core.dart' as core;

@internal
class NeonDrawer extends StatelessWidget {
  const NeonDrawer({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final clientsBloc = accountsBloc.activeClientsBloc;

    return ResultBuilder.behaviorSubject(
      subject: clientsBloc.clientImplementations,
      builder: (final context, final snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        return _NeonDrawer(
          clients: snapshot.requireData,
        );
      },
    );
  }
}

class _NeonDrawer extends StatefulWidget {
  const _NeonDrawer({
    required this.clients,
  });

  final Iterable<ClientImplementation> clients;

  @override
  State<_NeonDrawer> createState() => __NeonDrawerState();
}

class __NeonDrawerState extends State<_NeonDrawer> {
  late AccountsBloc _accountsBloc;
  late ClientsBloc _clientsBloc;
  late List<ClientImplementation> _clients;

  late int _activeClient;

  @override
  void initState() {
    super.initState();

    _accountsBloc = NeonProvider.of<AccountsBloc>(context);
    _clientsBloc = _accountsBloc.activeClientsBloc;

    _clients = widget.clients.toList();
    _activeClient = _clients.indexWhere((final client) => client.id == _clientsBloc.activeClient.valueOrNull?.id);
  }

  void onDestinationSelected(final int index) {
    Scaffold.maybeOf(context)?.closeDrawer();

    // selected item is not a registered client like the SettingsPage
    if (index >= _clients.length) {
      const SettingsRoute().go(context);
      return;
    }

    setState(() {
      _activeClient = index;
    });

    unawaited(_clientsBloc.setActiveClient(_clients[index].id));
    //context.goNamed(apps[index].routeName);
  }

  @override
  Widget build(final BuildContext context) {
    final clientDestinations = _clients.map(
      (final client) => NavigationDrawerDestinationExtension.fromNeonDestination(
        client.destination(context),
      ),
    );

    final drawer = NavigationDrawer(
      selectedIndex: _activeClient,
      onDestinationSelected: onDestinationSelected,
      children: [
        const NeonDrawerHeader(),
        ...clientDestinations,
        NavigationDrawerDestination(
          icon: const Icon(Icons.settings),
          label: Text(NeonLocalizations.of(context).settings),
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
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final capabilitiesBloc = accountsBloc.activeCapabilitiesBloc;

    final branding = ResultBuilder<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>.behaviorSubject(
      subject: capabilitiesBloc.capabilities,
      builder: (final context, final capabilities) {
        if (!capabilities.hasData) {
          return NeonLinearProgressIndicator(
            visible: capabilities.isLoading,
          );
        }

        if (capabilities.hasError) {
          return NeonError(
            capabilities.error,
            onRetry: capabilitiesBloc.refresh,
          );
        }

        final theme = capabilities.requireData.capabilities.themingPublicCapabilities?.theming;

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
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            Flexible(
              child: NeonUrlImage(
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
