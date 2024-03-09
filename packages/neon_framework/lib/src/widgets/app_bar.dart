import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/blocs/apps.dart';
import 'package:neon_framework/src/blocs/unified_search.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/models/notifications_interface.dart';
import 'package:neon_framework/src/utils/global_options.dart' as global_options;
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/account_switcher_button.dart';
import 'package:neon_framework/src/widgets/app_implementation_icon.dart';
import 'package:neon_framework/src/widgets/unified_search_results.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

/// Global app bar for the Neon app.
@internal
class NeonAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Creates a new Neon app bar.
  const NeonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<NeonAppBar> createState() => _NeonAppBarState();
}

class _NeonAppBarState extends State<NeonAppBar> {
  late global_options.GlobalOptions globalOptions;
  late UnifiedSearchBloc unifiedSearchBloc;
  late AppsBloc appsBloc;
  final searchTermController = StreamController<String>();
  late final StreamSubscription<String> searchTermSubscription;
  final searchController = SearchController();

  @override
  void initState() {
    super.initState();

    globalOptions = NeonProvider.of<global_options.GlobalOptions>(context);
    unifiedSearchBloc =
        NeonProvider.of<AccountsBloc>(context).activeUnifiedSearchBloc;
    appsBloc = NeonProvider.of<AccountsBloc>(context).activeAppsBloc;

    searchTermSubscription = searchTermController.stream
        .debounceTime(const Duration(milliseconds: 250))
        .listen(unifiedSearchBloc.search);
  }

  @override
  void dispose() {
    searchController.dispose();
    unawaited(searchTermSubscription.cancel());
    unawaited(searchTermController.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: StreamBuilder(
          stream: appsBloc.activeApp,
          builder: (context, activeAppSnapshot) {
            if (!activeAppSnapshot.hasData) {
              return const SizedBox.shrink();
            }
            final activeApp = activeAppSnapshot.requireData;

            final localizations = NeonLocalizations.of(context);
            final hintText = localizations
                .searchIn(activeApp.nameFromLocalization(localizations));

            return SearchAnchor(
              isFullScreen: true,
              viewHintText: hintText,
              textInputAction: TextInputAction.search,
              searchController: searchController,
              builder: (context, controller) {
                return ValueListenableBuilder(
                  valueListenable: globalOptions.navigationMode,
                  builder: (context, navigationMode, _) {
                    final drawerAlwaysVisible = navigationMode ==
                        global_options.NavigationMode.drawerAlwaysVisible;
                    return SearchBar(
                      hintText: hintText,
                      padding: const MaterialStatePropertyAll(
                        EdgeInsetsDirectional.only(start: 4),
                      ),
                      textInputAction: TextInputAction.search,
                      leading:
                          !drawerAlwaysVisible ? const DrawerButton() : null,
                      trailing: const [
                        NotificationIconButton(),
                        AccountSwitcherButton(),
                      ],
                      onTap: () {
                        controller.openView();
                      },
                    );
                  },
                );
              },
              viewBuilder: (_) => Padding(
                padding: const EdgeInsets.all(8),
                child: NeonUnifiedSearchResults(
                  onSelected: (entry) {
                    context.go(entry.resourceUrl);
                    searchController.closeView('');
                  },
                ),
              ),
              viewOnChanged: searchTermController.add,
              // The view is completely custom rendered, so we do not need the
              // suggestions
              suggestionsBuilder: (context, controller) async {
                return [];
              },
            );
          },
        ),
      ),
    );
  }
}

/// Button opening the notifications page.
@internal
class NotificationIconButton extends StatefulWidget {
  /// Creates a new notifications button.
  const NotificationIconButton({
    super.key,
  });

  @override
  State<NotificationIconButton> createState() => _NotificationIconButtonState();
}

class _NotificationIconButtonState extends State<NotificationIconButton> {
  late AccountsBloc _accountsBloc;
  late AppsBloc _appsBloc;
  late BuiltList<Account> _accounts;
  late Account _account;
  late StreamSubscription<void> notificationSubscription;

  @override
  void initState() {
    super.initState();
    _accountsBloc = NeonProvider.of<AccountsBloc>(context);
    _appsBloc = _accountsBloc.activeAppsBloc;
    _accounts = _accountsBloc.accounts.value;
    _account = _accountsBloc.activeAccount.value!;

    notificationSubscription = _appsBloc.openNotifications.listen((_) async {
      final notificationsAppImplementation =
          _appsBloc.notificationsAppImplementation.valueOrNull;
      if (notificationsAppImplementation != null &&
          notificationsAppImplementation.hasData) {
        await _openNotifications(notificationsAppImplementation.data!);
      }
    });
  }

  @override
  void dispose() {
    unawaited(notificationSubscription.cancel());

    super.dispose();
  }

  // TODO: migrate to go_router with a separate page
  Future<void> _openNotifications(
    NotificationsAppInterface app,
  ) async {
    final page = Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(app.name(context)),
            if (_accounts.length > 1) ...[
              Text(
                _account.humanReadableID,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
      body: SafeArea(
        child: app.page,
      ),
    );

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => Provider<NotificationsBlocInterface>(
          create: (context) => app.getBloc(_account),
          child: page,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: _appsBloc.notificationsAppImplementation,
      builder: (context, notificationsAppImplementation) {
        if (!notificationsAppImplementation.hasData) {
          return const SizedBox.shrink();
        }

        final notificationsImplementationData =
            notificationsAppImplementation.data!;
        final notificationBloc =
            notificationsImplementationData.getBloc(_account);

        return IconButton(
          key: Key('app-${notificationsImplementationData.id}'),
          onPressed: () async {
            await _openNotifications(notificationsImplementationData);
          },
          tooltip: NeonLocalizations.of(context)
              .appImplementationName(notificationsImplementationData.id),
          padding: const EdgeInsets.all(4),
          icon: StreamBuilder<int>(
            stream: notificationsImplementationData
                .getUnreadCounter(notificationBloc),
            builder: (context, unreadCounterSnapshot) =>
                NeonAppImplementationIcon(
              appImplementation: notificationsImplementationData,
              unreadCount: unreadCounterSnapshot.data,
            ),
          ),
        );
      },
    );
  }
}
