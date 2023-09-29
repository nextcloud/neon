import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:neon/src/utils/global_options.dart' as global_options;
import 'package:neon/src/utils/global_popups.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:neon/src/widgets/app_bar.dart';
import 'package:neon/src/widgets/drawer.dart';
import 'package:neon/src/widgets/error.dart';
import 'package:neon/src/widgets/unified_search_results.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';

@internal
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late Account _account;
  late GlobalOptions _globalOptions;
  late AccountsBloc _accountsBloc;
  late AppsBloc _appsBloc;
  late StreamSubscription<Map<String, String?>> _versionCheckSubscription;

  @override
  void initState() {
    super.initState();
    _globalOptions = NeonProvider.of<GlobalOptions>(context);
    _accountsBloc = NeonProvider.of<AccountsBloc>(context);
    _account = _accountsBloc.activeAccount.value!;
    _appsBloc = _accountsBloc.activeAppsBloc;

    _versionCheckSubscription = _appsBloc.appVersions.listen((final values) {
      if (!mounted) {
        return;
      }

      final l10n = AppLocalizations.of(context);

      final buffer = StringBuffer()..writeln();

      for (final error in values.entries) {
        final appId = error.key;
        final minVersion = error.value;
        final appName = l10n.appImplementationName(appId);

        if (appName.isNotEmpty && minVersion != null) {
          buffer.writeln('- $appName $minVersion');
        }
      }

      final message = l10n.errorUnsupportedAppVersions(buffer.toString());
      unawaited(_showProblem(message));
    });

    GlobalPopups().register(context);

    unawaited(_checkMaintenanceMode());
  }

  @override
  void dispose() {
    unawaited(_versionCheckSubscription.cancel());
    GlobalPopups().dispose();
    super.dispose();
  }

  Future<void> _checkMaintenanceMode() async {
    try {
      final status = await _account.client.core.getStatus();
      if (status.body.maintenance && mounted) {
        await _showProblem(
          AppLocalizations.of(context).errorServerInMaintenanceMode,
        );
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      if (mounted) {
        NeonError.showSnackbar(context, e);
      }
    }
  }

  Future<void> _showProblem(final String title) async {
    final colorScheme = Theme.of(context).colorScheme;

    await showDialog<void>(
      context: context,
      builder: (final context) => AlertDialog(
        title: Text(title),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).actionClose),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    const drawer = NeonDrawer();
    const appBar = NeonAppBar();

    final appView = StreamBuilder(
      stream: _accountsBloc.activeUnifiedSearchBloc.enabled,
      builder: (final context, final unifiedSearchEnabledSnapshot) {
        if (unifiedSearchEnabledSnapshot.data ?? false) {
          return const NeonUnifiedSearchResults();
        }
        return ResultBuilder<Iterable<AppImplementation>>.behaviorSubject(
          stream: _appsBloc.appImplementations,
          builder: (final context, final appImplementations) {
            if (!appImplementations.hasData) {
              return const SizedBox();
            }

            if (appImplementations.requireData.isEmpty) {
              return Center(
                child: Text(
                  AppLocalizations.of(context).errorNoCompatibleNextcloudAppsFound,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return StreamBuilder<AppImplementation>(
              stream: _appsBloc.activeApp,
              builder: (final context, final activeAppIDSnapshot) {
                if (!activeAppIDSnapshot.hasData) {
                  return const SizedBox();
                }

                return activeAppIDSnapshot.requireData.page;
              },
            );
          },
        );
      },
    );

    final body = ValueListenableBuilder<global_options.NavigationMode>(
      valueListenable: _globalOptions.navigationMode,
      builder: (final context, final navigationMode, final _) {
        final drawerAlwaysVisible = navigationMode == global_options.NavigationMode.drawerAlwaysVisible;

        final body = Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          drawer: !drawerAlwaysVisible ? drawer : null,
          appBar: appBar,
          body: appView,
        );

        if (drawerAlwaysVisible) {
          return Row(
            children: [
              ColoredBox(
                color: Theme.of(context).colorScheme.background,
                child: drawer,
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

    return WillPopScope(
      onWillPop: () async {
        if (_scaffoldKey.currentState!.isDrawerOpen) {
          Navigator.pop(context);
          return true;
        }

        _scaffoldKey.currentState!.openDrawer();
        return false;
      },
      child: MultiProvider(
        providers: _appsBloc.appBlocProviders,
        child: body,
      ),
    );
  }
}
