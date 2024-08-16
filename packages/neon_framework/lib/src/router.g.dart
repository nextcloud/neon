// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $loginRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      name: 'home',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'settings',
          name: 'Settings',
          factory: $SettingsRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'apps/:appid',
              name: 'AppImplementationSettings',
              factory: $AppImplementationSettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'account/:accountID',
              name: 'AccountSettings',
              factory: $AccountSettingsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute(
        initialCategory:
            _$convertMapValue('initial-category', state.uri.queryParameters, _$SettingsCategoriesEnumMap._$fromName),
      );

  String get location => GoRouteData.$location(
        '/settings',
        queryParams: {
          if (initialCategory != null) 'initial-category': _$SettingsCategoriesEnumMap[initialCategory!],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$SettingsCategoriesEnumMap = {
  SettingsCategories.apps: 'apps',
  SettingsCategories.theme: 'theme',
  SettingsCategories.navigation: 'navigation',
  SettingsCategories.pushNotifications: 'push-notifications',
  SettingsCategories.startup: 'startup',
  SettingsCategories.accounts: 'accounts',
  SettingsCategories.other: 'other',
};

extension $AppImplementationSettingsRouteExtension on AppImplementationSettingsRoute {
  static AppImplementationSettingsRoute _fromState(GoRouterState state) => AppImplementationSettingsRoute(
        appid: state.pathParameters['appid']!,
      );

  String get location => GoRouteData.$location(
        '/settings/apps/${Uri.encodeComponent(appid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountSettingsRouteExtension on AccountSettingsRoute {
  static AccountSettingsRoute _fromState(GoRouterState state) => AccountSettingsRoute(
        accountID: state.pathParameters['accountID']!,
      );

  String get location => GoRouteData.$location(
        '/settings/account/${Uri.encodeComponent(accountID)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) => entries.singleWhere((element) => element.value == value).key;
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      name: 'login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
        serverUrl: _$convertMapValue('server-url', state.uri.queryParameters, Uri.parse),
        qrCode: state.uri.queryParameters['qr-code'],
      );

  String get location => GoRouteData.$location(
        '/login',
        queryParams: {
          if (serverUrl != null) 'server-url': serverUrl!.toString(),
          if (qrCode != null) 'qr-code': qrCode,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
