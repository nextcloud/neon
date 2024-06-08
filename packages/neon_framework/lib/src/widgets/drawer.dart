import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/blocs/capabilities.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/drawer_destination.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/image.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/core.dart' as core;

/// A custom pre populated [Drawer] side panel.
///
/// Displays an entry for every registered and supported client.
@internal
class NeonDrawer extends StatefulWidget {
  /// Created a new Neon drawer.
  const NeonDrawer({
    super.key,
  });

  @override
  State<NeonDrawer> createState() => _NeonDrawerState();
}

class _NeonDrawerState extends State<NeonDrawer> {
  late AppsBloc _appsBloc;
  List<AppImplementation>? _apps;
  int? _activeApp;
  late final StreamSubscription<Result<BuiltSet<AppImplementation>>> appImplementationsSubscription;

  @override
  void initState() {
    super.initState();

    _appsBloc = NeonProvider.of<AppsBloc>(context);

    appImplementationsSubscription = _appsBloc.appImplementations.listen((result) {
      setState(() {
        _apps = result.data?.toList();
        _activeApp = _apps?.indexWhere((app) => app.id == _appsBloc.activeApp.valueOrNull?.id);
      });
    });
  }

  @override
  void dispose() {
    unawaited(appImplementationsSubscription.cancel());

    super.dispose();
  }

  void onAppChange(int index) {
    Scaffold.maybeOf(context)?.closeDrawer();

    setState(() {
      _activeApp = index;
    });

    _appsBloc.setActiveApp(_apps![index].id);
    //context.goNamed(apps[index].routeName);
  }

  @override
  Widget build(BuildContext context) {
    final appDestinations = _apps?.map(
      (app) => NavigationDrawerDestinationExtension.fromNeonDestination(
        app.destination(context),
      ),
    );

    final drawer = NavigationDrawer(
      selectedIndex: _activeApp,
      onDestinationSelected: onAppChange,
      children: [
        const NeonDrawerHeader(),
        ...?appDestinations,
      ],
    );

    return drawer;
  }
}

/// Custom styled [DrawerHeader] used inside a [Drawer] or [NeonDrawer].
///
/// The neon drawer will display the [core.ThemingPublicCapabilities_Theming.name]
/// and [core.ThemingPublicCapabilities_Theming.logo] and automatically rebuild
/// when the current theme changes.
@internal
class NeonDrawerHeader extends StatelessWidget {
  /// Creates a new Neon drawer header.
  const NeonDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final capabilitiesBloc = NeonProvider.of<CapabilitiesBloc>(context);

    final branding = ResultBuilder.behaviorSubject(
      subject: capabilitiesBloc.capabilities,
      builder: (context, capabilities) {
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
              child: NeonUriImage(
                uri: Uri.parse(theme.logo),
                account: NeonProvider.of<Account>(context),
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
