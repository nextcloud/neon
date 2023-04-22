part of '../neon.dart';

// ignore: prefer_mixin
class AppRouter extends RouterDelegate<Account> with ChangeNotifier, PopNavigatorRouterDelegateMixin<Account> {
  AppRouter({
    required this.navigatorKey,
    required this.accountsBloc,
    required this.onThemeChanged,
  });

  final AccountsBloc accountsBloc;
  final Function(NextcloudTheme? theme) onThemeChanged;
  final _globalPopups = const GlobalPopups();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Future setNewRoutePath(final Account? configuration) async {}

  @override
  Account? get currentConfiguration => accountsBloc.activeAccount.valueOrNull;

  @override
  Widget build(final BuildContext context) => Navigator(
        key: navigatorKey,
        onPopPage: (final route, final result) => route.didPop(result),
        pages: [
          if (currentConfiguration == null) ...[
            const MaterialPage(
              child: LoginPage(),
            ),
          ] else ...[
            MaterialPage(
              name: 'home',
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    _globalPopups,
                    HomePage(
                      key: Key(currentConfiguration!.id),
                      account: currentConfiguration!,
                      onThemeChanged: onThemeChanged,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      );
}
