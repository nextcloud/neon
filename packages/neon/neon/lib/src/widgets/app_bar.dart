import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/clients.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/client_implementation.dart';
import 'package:neon/src/models/notifications_interface.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:neon/src/widgets/account_switcher_button.dart';
import 'package:neon/src/widgets/client_implementation_icon.dart';
import 'package:neon/src/widgets/error.dart';
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
  late final AccountsBloc accountsBloc = NeonProvider.of<AccountsBloc>(context);
  late final accounts = accountsBloc.accounts.value;
  late final account = accountsBloc.activeAccount.value!;
  late final clientsBloc = accountsBloc.activeClientsBloc;
  late final unifiedSearchBloc = accountsBloc.activeUnifiedSearchBloc;

  final _searchBarFocusNode = FocusNode();
  final _searchTermController = StreamController<String>();
  late final StreamSubscription<String> _searchTermSubscription;

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
  Widget build(final BuildContext context) => ResultBuilder<Iterable<ClientImplementation>>.behaviorSubject(
        subject: clientsBloc.clientImplementations,
        builder: (final context, final clientImplementations) => StreamBuilder(
          stream: clientsBloc.activeClient,
          builder: (final context, final activeClientSnapshot) => StreamBuilder(
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
                              if (activeClientSnapshot.hasData) ...[
                                Flexible(
                                  child: Text(
                                    activeClientSnapshot.requireData.name(context),
                                  ),
                                ),
                              ],
                              if (clientImplementations.hasError) ...[
                                const SizedBox(
                                  width: 8,
                                ),
                                NeonError(
                                  clientImplementations.error,
                                  onRetry: clientsBloc.refresh,
                                  onlyIcon: true,
                                ),
                              ],
                              if (clientImplementations.isLoading) ...[
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
                        hintText: NeonLocalizations.of(context).search,
                        padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 16)),
                        onChanged: _searchTermController.add,
                        trailing: [
                          IconButton(
                            onPressed: () {
                              unifiedSearchBloc.disable();
                            },
                            tooltip: NeonLocalizations.of(context).searchCancel,
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
          NeonProvider.of<AccountsBloc>(context).activeUnifiedSearchBloc.enable();
        },
        tooltip: NeonLocalizations.of(context).search,
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
  late ClientsBloc _clientsBloc;
  late List<Account> _accounts;
  late Account _account;
  late StreamSubscription<void> notificationSubscription;

  @override
  void initState() {
    super.initState();
    _accountsBloc = NeonProvider.of<AccountsBloc>(context);
    _clientsBloc = _accountsBloc.activeClientsBloc;
    _accounts = _accountsBloc.accounts.value;
    _account = _accountsBloc.activeAccount.value!;

    notificationSubscription = _clientsBloc.openNotifications.listen((final _) async {
      final notificationsClientImplementation = _clientsBloc.notificationsClientImplementation.valueOrNull;
      if (notificationsClientImplementation != null && notificationsClientImplementation.hasData) {
        await _openNotifications(notificationsClientImplementation.data!);
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
    final NotificationsClientInterface client,
  ) async {
    final page = Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(client.name(context)),
            if (_accounts.length > 1) ...[
              Text(
                _account.humanReadableID,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
      body: client.page,
    );

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (final context) => Provider<NotificationsBlocInterface>(
          create: (final context) => client.getBloc(_account),
          child: page,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<NotificationsClientInterface?>.behaviorSubject(
        subject: _clientsBloc.notificationsClientImplementation,
        builder: (final context, final notificationsClientImplementation) {
          if (!notificationsClientImplementation.hasData) {
            return const SizedBox.shrink();
          }

          final notificationsImplementationData = notificationsClientImplementation.data!;
          final notificationBloc = notificationsImplementationData.getBloc(_account);

          return IconButton(
            key: Key('app-${notificationsImplementationData.id}'),
            onPressed: () async {
              await _openNotifications(notificationsImplementationData);
            },
            tooltip: NeonLocalizations.of(context).clientImplementationName(notificationsImplementationData.id),
            icon: StreamBuilder<int>(
              stream: notificationsImplementationData.getUnreadCounter(notificationBloc),
              builder: (final context, final unreadCounterSnapshot) => NeonClientImplementationIcon(
                clientImplementation: notificationsImplementationData,
                unreadCount: unreadCounterSnapshot.data,
              ),
            ),
          );
        },
      );
}
