import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/blocs/apps.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/models/notifications_interface.dart';
import 'package:neon_framework/src/theme/icons.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/account_switcher_button.dart';
import 'package:neon_framework/src/widgets/app_implementation_icon.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

/// Global app bar for the Neon app.
@internal
class NeonAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a new Neon app bar.
  const NeonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final unifiedSearchBloc = accountsBloc.activeUnifiedSearchBloc;

    return StreamBuilder(
      stream: unifiedSearchBloc.enabled,
      initialData: false,
      builder: (context, unifiedSearchEnabledSnapshot) {
        final unifiedSearchEnabled = unifiedSearchEnabledSnapshot.requireData;

        return AppBar(
          title: unifiedSearchEnabled ? null : _buildTitle(context),
          actions: [
            if (unifiedSearchEnabled) const NeonSearchBar() else const SearchIconButton(),
            const NotificationIconButton(),
            const AccountSwitcherButton(),
          ],
        );
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final account = accountsBloc.activeAccount.value!;
    final accounts = accountsBloc.accounts.value;
    final appsBloc = accountsBloc.activeAppsBloc;

    final title = ResultBuilder.behaviorSubject(
      subject: appsBloc.appImplementations,
      builder: (context, appImplementations) => StreamBuilder(
        stream: appsBloc.activeApp,
        initialData: appsBloc.activeApp.valueOrNull,
        builder: (context, activeAppSnapshot) {
          const padding = EdgeInsetsDirectional.only(start: 8);

          return Row(
            children: [
              if (activeAppSnapshot.hasData)
                Flexible(
                  child: Text(
                    activeAppSnapshot.requireData.name(context),
                  ),
                ),
              if (appImplementations.hasError)
                Padding(
                  padding: padding,
                  child: NeonError(
                    appImplementations.error,
                    onRetry: appsBloc.refresh,
                    type: NeonErrorType.iconOnly,
                  ),
                ),
              if (appImplementations.isLoading)
                Expanded(
                  child: Padding(
                    padding: padding,
                    child: NeonLinearProgressIndicator(
                      color: Theme.of(context).appBarTheme.foregroundColor,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );

    if (accounts.length == 1) {
      return title;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        Text(
          account.humanReadableID,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

/// Search bar handling the `UnifiedSearchBloc`.
///
/// The `UnifiedSearchBloc` must be enabled.
@internal
class NeonSearchBar extends StatefulWidget {
  /// Creates a new neon search bar.
  const NeonSearchBar({super.key});

  @override
  State<NeonSearchBar> createState() => _NeonSearchBarState();
}

class _NeonSearchBarState extends State<NeonSearchBar> {
  late final AccountsBloc accountsBloc = NeonProvider.of<AccountsBloc>(context);
  late final unifiedSearchBloc = accountsBloc.activeUnifiedSearchBloc;
  final searchBarFocusNode = FocusNode();
  final searchTermController = StreamController<String>();
  late final StreamSubscription<String> _searchTermSubscription;

  @override
  void initState() {
    super.initState();

    searchBarFocusNode.requestFocus();

    _searchTermSubscription =
        searchTermController.stream.debounceTime(const Duration(milliseconds: 250)).listen(unifiedSearchBloc.search);
  }

  @override
  void dispose() {
    searchBarFocusNode.dispose();
    unawaited(_searchTermSubscription.cancel());
    unawaited(searchTermController.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsetsDirectional.only(start: 16);

    return Flexible(
      child: SearchBar(
        focusNode: searchBarFocusNode,
        hintText: NeonLocalizations.of(context).search,
        padding: const MaterialStatePropertyAll(padding),
        onChanged: searchTermController.add,
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
    );
  }
}

/// Button opening the unified search page.
@internal
class SearchIconButton extends StatelessWidget {
  /// Creates a new unified search button.
  const SearchIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {
          NeonProvider.of<AccountsBloc>(context).activeUnifiedSearchBloc.enable();
        },
        tooltip: NeonLocalizations.of(context).search,
        icon: Icon(
          AdaptiveIcons.search,
        ),
      );
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
  Widget build(BuildContext context) => ResultBuilder.behaviorSubject(
        subject: _appsBloc.notificationsAppImplementation,
        builder: (context, notificationsAppImplementation) {
          if (!notificationsAppImplementation.hasData) {
            return const SizedBox.shrink();
          }

          final notificationsImplementationData = notificationsAppImplementation.data!;
          final notificationBloc = notificationsImplementationData.getBloc(_account);

          return IconButton(
            key: Key('app-${notificationsImplementationData.id}'),
            onPressed: () async {
              await _openNotifications(notificationsImplementationData);
            },
            tooltip: NeonLocalizations.of(context).appImplementationName(notificationsImplementationData.id),
            icon: StreamBuilder<int>(
              stream: notificationsImplementationData.getUnreadCounter(notificationBloc),
              builder: (context, unreadCounterSnapshot) => NeonAppImplementationIcon(
                appImplementation: notificationsImplementationData,
                unreadCount: unreadCounterSnapshot.data,
              ),
            ),
          );
        },
      );
}
