import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/neon.dart';
import 'package:neon/src/router.dart';
import 'package:provider/provider.dart';

@internal
class NeonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NeonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final accounts = accountsBloc.accounts.value;
    final account = accountsBloc.activeAccount.value!;
    final appsBloc = accountsBloc.activeAppsBloc;

    return ResultBuilder<Iterable<AppImplementation>>.behaviorSubject(
      stream: appsBloc.appImplementations,
      builder: (final context, final appImplementations) => StreamBuilder<AppImplementation>(
        stream: appsBloc.activeApp,
        builder: (final context, final activeAppSnapshot) => AppBar(
          title: Column(
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
                  account.client.humanReadableID,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
          actions: const [
            NotificationIconButton(),
            AccountSwitcherButton(),
          ],
        ),
      ),
    );
  }
}

@internal
class AccountSwitcherButton extends StatelessWidget {
  const AccountSwitcherButton({
    super.key,
  });

  Future<void> _onPressed(final BuildContext context) async {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final accounts = accountsBloc.accounts.value;
    final aa = accountsBloc.activeAccount.value!;

    await showDialog(
      context: context,
      builder: (final context) {
        final accountList = <Widget>[];

        for (final account in accounts) {
          if (account.id == aa.id) {
            continue;
          }

          final tile = NeonAccountTile(
            account: account,
            onTap: () {
              accountsBloc.setActiveAccount(account);
              Navigator.of(context).pop();
            },
          );

          accountList.add(tile);
        }

        final body = Column(
          children: [
            NeonAccountTile(
              account: aa,
              trailing: const Icon(Icons.check_circle),
              onTap: Navigator.of(context).pop,
            ),
            const Divider(),
            if (accountList.isNotEmpty) ...[
              SingleChildScrollView(
                child: ListBody(children: accountList.toList()),
              ),
              const Divider(),
            ],
            ListTile(
              leading: const Icon(Icons.person_add),
              title: Text(AppLocalizations.of(context).globalOptionsAccountsAdd),
              onTap: () {
                Navigator.of(context).pop();
                const AddAccountRoute().push(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(AppLocalizations.of(context).settings),
              onTap: () {
                Navigator.of(context).pop();
                const SettingsRoute().push(context);
              },
            )
          ],
        );

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: IntrinsicHeight(
              child: body,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final account = accountsBloc.activeAccount.value!;

    return IconButton(
      onPressed: () async => _onPressed(context),
      tooltip: AppLocalizations.of(context).settingsAccount,
      icon: NeonUserAvatar(
        account: account,
      ),
    );
  }
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
                _account.client.humanReadableID,
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
                  size: const Size.square(kAvatarSize * 2 / 3),
                ),
              );
            },
          );
        },
      );
}
