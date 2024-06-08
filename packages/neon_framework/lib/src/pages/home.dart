import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/apps.dart';
import 'package:neon_framework/src/blocs/maintenance_mode.dart';
import 'package:neon_framework/src/utils/dialog.dart';
import 'package:neon_framework/src/utils/global_options.dart' as global_options;
import 'package:neon_framework/src/utils/global_popups.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/app_bar.dart';
import 'package:neon_framework/src/widgets/drawer.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';

/// The home page of Neon.
@internal
class HomePage extends StatefulWidget {
  /// Creates a new home page.
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late global_options.GlobalOptions _globalOptions;
  late AppsBloc _appsBloc;
  late final StreamSubscription<BuiltMap<String, VersionCheck>> _versionCheckSubscription;
  late final StreamSubscription<Object> maintenanceModeErrorsSubscription;
  late final StreamSubscription<void> maintenanceModeSubscription;

  @override
  void initState() {
    super.initState();
    _globalOptions = NeonProvider.of<global_options.GlobalOptions>(context);
    _appsBloc = NeonProvider.of<AppsBloc>(context);
    final maintenanceModeBloc = NeonProvider.of<MaintenanceModeBloc>(context);

    _versionCheckSubscription = _appsBloc.unsupportedApps.listen((unsupportedChecks) {
      if (!mounted || unsupportedChecks.isEmpty) {
        return;
      }

      final l10n = NeonLocalizations.of(context);
      final buffer = StringBuffer()..writeln();

      for (final entry in unsupportedChecks.entries) {
        final versionCheck = entry.value;
        final appName = l10n.appImplementationName(entry.key);

        buffer.writeln('- $appName >=${versionCheck.minimumVersion} <${versionCheck.maximumMajor + 1}.0.0');
      }

      final message = l10n.errorUnsupportedAppVersions(buffer.toString());
      unawaited(showErrorDialog(context: context, message: message));
    });

    maintenanceModeErrorsSubscription = maintenanceModeBloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });

    maintenanceModeSubscription = maintenanceModeBloc.onMaintenanceMode.listen((_) async {
      await showErrorDialog(
        context: context,
        message: NeonLocalizations.of(context).errorServerInMaintenanceMode,
      );
    });

    GlobalPopups().register(context);
  }

  @override
  void dispose() {
    unawaited(_versionCheckSubscription.cancel());
    unawaited(maintenanceModeErrorsSubscription.cancel());
    unawaited(maintenanceModeSubscription.cancel());
    GlobalPopups().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: _appsBloc.appImplementations,
      builder: (context, appImplementations) {
        Widget appView;
        if (!appImplementations.hasData) {
          appView = const SizedBox();
        } else if (appImplementations.requireData.isEmpty) {
          appView = Center(
            child: Text(
              NeonLocalizations.of(context).errorNoCompatibleNextcloudAppsFound,
              textAlign: TextAlign.center,
            ),
          );
        } else {
          appView = StreamBuilder(
            stream: _appsBloc.activeApp,
            builder: (context, activeAppSnapshot) {
              if (!activeAppSnapshot.hasData) {
                return const SizedBox();
              }

              return SafeArea(
                child: activeAppSnapshot.requireData.page,
              );
            },
          );
        }

        final showDrawer = appImplementations.hasData && appImplementations.requireData.length > 1;

        final body = ValueListenableBuilder(
          valueListenable: _globalOptions.navigationMode,
          builder: (context, navigationMode, _) {
            final drawerAlwaysVisible = navigationMode == global_options.NavigationMode.drawerAlwaysVisible;

            final body = Scaffold(
              resizeToAvoidBottomInset: false,
              drawer: showDrawer && !drawerAlwaysVisible ? const NeonDrawer() : null,
              appBar: const NeonAppBar(),
              body: appView,
            );

            if (showDrawer && drawerAlwaysVisible) {
              return Row(
                children: [
                  ColoredBox(
                    color: Theme.of(context).colorScheme.surface,
                    child: const NeonDrawer(),
                  ),
                  Expanded(
                    child: body,
                  ),
                ],
              );
            }

            return body;
          },
        );

        return MultiProvider(
          providers: _appsBloc.appBlocProviders,
          child: body,
        );
      },
    );
  }
}
