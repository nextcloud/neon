import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/models/notifications_interface.dart';
import 'package:neon/src/widgets/account_switcher_button.dart';
import 'package:neon/src/widgets/app_implementation_icon.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

@internal
class NeonAppBar extends StatefulWidget implements PreferredSizeWidget {
  const NeonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<NeonAppBar> createState() => _NeonAppBarState();
}

class _NeonAppBarState extends State<NeonAppBar> {
  late final AccountsBloc accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
  late final accounts = accountsBloc.accounts.value;
  late final account = accountsBloc.activeAccount.value!;
  late final appsBloc = accountsBloc.activeAppsBloc;
  late final unifiedSearchBloc = accountsBloc.activeUnifiedSearchBloc;

  final _searchBarFocusNode = FocusNode();
  final _searchTermController = StreamController<String>();
  late final StreamSubscription _searchTermSubscription;

  @override
  void initState() {
    super.initState();

    unifiedSearchBloc.enabled.listen((final enabled) {
      if (enabled) {
        _searchBarFocusNode.requestFocus();
      }
    });

    _searchTermSubscription =
        _searchTermController.stream.debounceTime(const Duration(milliseconds: 250)).listen(unifiedSearchBloc.search);
  }

  @override
  void dispose() {
    _searchBarFocusNode.dispose();
    unawaited(_searchTermSubscription.cancel());
    unawaited(_searchTermController.close());
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<Iterable<AppImplementation>>.behaviorSubject(
        stream: appsBloc.appImplementations,
        builder: (final context, final appImplementations) => StreamBuilder<AppImplementation>(
          stream: appsBloc.activeApp,
          builder: (final context, final activeAppSnapshot) => StreamBuilder<bool>(
            stream: unifiedSearchBloc.enabled,
            builder: (final context, final unifiedSearchEnabledSnapshot) {
              final unifiedSearchEnabled = unifiedSearchEnabledSnapshot.data ?? false;
              return AppBar(
                title: unifiedSearchEnabled
                    ? null
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (activeAppSnapshot.hasData) ...[
                                Flexible(
                                  child: Text(
                                    activeAppSnapshot.requireData.name(context),
                                  ),
                                ),
                              ],
                              if (appImplementations.hasError) ...[
                                const SizedBox(
                                  width: 8,
                                ),
                                NeonException(
                                  appImplementations.error,
                                  onRetry: appsBloc.refresh,
                                  onlyIcon: true,
                                ),
                              ],
                              if (appImplementations.isLoading) ...[
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: NeonLinearProgressIndicator(
                                    color: Theme.of(context).appBarTheme.foregroundColor,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          if (accounts.length > 1) ...[
                            Text(
                              account.humanReadableID,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ],
                      ),
                actions: [
                  if (unifiedSearchEnabled) ...[
                    Flexible(
                      child: SearchBar(
                        focusNode: _searchBarFocusNode,
                        hintText: AppLocalizations.of(context).search,
                        padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 16)),
                        onChanged: _searchTermController.add,
                        trailing: [
                          IconButton(
                            onPressed: () {
                              unifiedSearchBloc.disable();
                            },
                            tooltip: AppLocalizations.of(context).searchCancel,
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    const SearchIconButton(),
                  ],
                  const NotificationIconButton(),
                  const AccountSwitcherButton(),
                ],
              );
            },
          ),
        ),
      );
}

@internal
class SearchIconButton extends StatelessWidget {
  const SearchIconButton({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => IconButton(
        onPressed: () {
          Provider.of<AccountsBloc>(context, listen: false).activeUnifiedSearchBloc.enable();
        },
        tooltip: AppLocalizations.of(context).search,
        icon: const Icon(
          Icons.search,
        ),
      );
}

@internal
class NotificationIconButton extends StatefulWidget {
  const NotificationIconButton({
    super.key,
  });

  @override
  State<NotificationIconButton> createState() => _NotificationIconButtonState();
}

class _NotificationIconButtonState extends State<NotificationIconButton> {
  late AccountsBloc _accountsBloc;
  late AppsBloc _appsBloc;
  late List<Account> _accounts;
  late Account _account;
  late StreamSubscription notificationSubscription;

  @override
  void initState() {
    super.initState();
    _accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    _appsBloc = _accountsBloc.activeAppsBloc;
    _accounts = _accountsBloc.accounts.value;
    _account = _accountsBloc.activeAccount.value!;

    notificationSubscription = _appsBloc.openNotifications.listen((final _) async {
      final notificationsAppImplementation = _appsBloc.notificationsAppImplementation.valueOrNull;
      if (notificationsAppImplementation != null && notificationsAppImplementation.hasData) {
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
    final NotificationsAppInterface app,
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
      body: app.page,
    );

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (final context) => Provider<NotificationsBlocInterface>(
          create: (final context) => app.getBloc(_account),
          child: page,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<NotificationsAppInterface?>.behaviorSubject(
        stream: _appsBloc.notificationsAppImplementation,
        builder: (final context, final notificationsAppImplementation) {
          if (!notificationsAppImplementation.hasData) {
            return const SizedBox.shrink();
          }

          final notificationsImplementationData = notificationsAppImplementation.data!;
          final notificationBloc = notificationsImplementationData.getBloc(_account);

          return StreamBuilder<int>(
            stream: notificationsImplementationData.getUnreadCounter(notificationBloc),
            builder: (final context, final unreadCounterSnapshot) {
              final unreadCount = unreadCounterSnapshot.data ?? 0;
              return IconButton(
                key: Key('app-${notificationsImplementationData.id}'),
                onPressed: () async {
                  await _openNotifications(notificationsImplementationData);
                },
                tooltip: AppLocalizations.of(context).appImplementationName(notificationsImplementationData.id),
                icon: NeonAppImplementationIcon(
                  appImplementation: notificationsImplementationData,
                  unreadCount: unreadCount,
                  color: unreadCount > 0
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onBackground,
                ),
              );
            },
          );
        },
      );
}
