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
              name: 'NextcloudAppSettings',
              factory: $NextcloudAppSettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'account/add',
              name: 'addAccount',
              factory: $_AddAccountRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'flow',
                  factory: $_AddAccountFlowRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'qrcode',
                  factory: $_AddAccountQrcodeRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'check/server',
                  factory: $_AddAccountCheckServerStatusRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'check/account',
                  factory: $_AddAccountCheckAccountRouteExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'account/:accountid',
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
            _$convertMapValue('initial-category', state.queryParameters, _$SettingsCageoriesEnumMap._$fromName),
      );

  String get location => GoRouteData.$location(
        '/settings',
        queryParams: {
          if (initialCategory != null) 'initial-category': _$SettingsCageoriesEnumMap[initialCategory!],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$SettingsCageoriesEnumMap = {
  SettingsCageories.apps: 'apps',
  SettingsCageories.theme: 'theme',
  SettingsCageories.navigation: 'navigation',
  SettingsCageories.pushNotifications: 'push-notifications',
  SettingsCageories.startup: 'startup',
  SettingsCageories.systemTray: 'system-tray',
  SettingsCageories.accounts: 'accounts',
  SettingsCageories.other: 'other',
};

extension $NextcloudAppSettingsRouteExtension on NextcloudAppSettingsRoute {
  static NextcloudAppSettingsRoute _fromState(GoRouterState state) => NextcloudAppSettingsRoute(
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

extension $_AddAccountRouteExtension on _AddAccountRoute {
  static _AddAccountRoute _fromState(GoRouterState state) => const _AddAccountRoute();

  String get location => GoRouteData.$location(
        '/settings/account/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $_AddAccountFlowRouteExtension on _AddAccountFlowRoute {
  static _AddAccountFlowRoute _fromState(GoRouterState state) => _AddAccountFlowRoute(
        serverUrl: state.queryParameters['server-url']!,
      );

  String get location => GoRouteData.$location(
        '/settings/account/add/flow',
        queryParams: {
          'server-url': serverUrl,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $_AddAccountQrcodeRouteExtension on _AddAccountQrcodeRoute {
  static _AddAccountQrcodeRoute _fromState(GoRouterState state) => const _AddAccountQrcodeRoute();

  String get location => GoRouteData.$location(
        '/settings/account/add/qrcode',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $_AddAccountCheckServerStatusRouteExtension on _AddAccountCheckServerStatusRoute {
  static _AddAccountCheckServerStatusRoute _fromState(GoRouterState state) => _AddAccountCheckServerStatusRoute(
        serverUrl: state.queryParameters['server-url']!,
      );

  String get location => GoRouteData.$location(
        '/settings/account/add/check/server',
        queryParams: {
          'server-url': serverUrl,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $_AddAccountCheckAccountRouteExtension on _AddAccountCheckAccountRoute {
  static _AddAccountCheckAccountRoute _fromState(GoRouterState state) => _AddAccountCheckAccountRoute(
        serverUrl: state.queryParameters['server-url']!,
        loginName: state.queryParameters['login-name']!,
        password: state.queryParameters['password']!,
      );

  String get location => GoRouteData.$location(
        '/settings/account/add/check/account',
        queryParams: {
          'server-url': serverUrl,
          'login-name': loginName,
          'password': password,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $AccountSettingsRouteExtension on AccountSettingsRoute {
  static AccountSettingsRoute _fromState(GoRouterState state) => AccountSettingsRoute(
        accountid: state.pathParameters['accountid']!,
      );

  String get location => GoRouteData.$location(
        '/settings/account/${Uri.encodeComponent(accountid)}',
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
      routes: [
        GoRouteData.$route(
          path: 'flow',
          factory: $LoginFlowRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'qrcode',
          factory: $LoginQrcodeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'check/server',
          factory: $LoginCheckServerStatusRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'check/account',
          factory: $LoginCheckAccountRouteExtension._fromState,
        ),
      ],
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginFlowRouteExtension on LoginFlowRoute {
  static LoginFlowRoute _fromState(GoRouterState state) => LoginFlowRoute(
        serverUrl: state.queryParameters['server-url']!,
      );

  String get location => GoRouteData.$location(
        '/login/flow',
        queryParams: {
          'server-url': serverUrl,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $LoginQrcodeRouteExtension on LoginQrcodeRoute {
  static LoginQrcodeRoute _fromState(GoRouterState state) => const LoginQrcodeRoute();

  String get location => GoRouteData.$location(
        '/login/qrcode',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginCheckServerStatusRouteExtension on LoginCheckServerStatusRoute {
  static LoginCheckServerStatusRoute _fromState(GoRouterState state) => LoginCheckServerStatusRoute(
        serverUrl: state.queryParameters['server-url']!,
        loginName: state.queryParameters['login-name'],
        password: state.queryParameters['password'],
      );

  String get location => GoRouteData.$location(
        '/login/check/server',
        queryParams: {
          'server-url': serverUrl,
          if (loginName != null) 'login-name': loginName,
          if (password != null) 'password': password,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginCheckAccountRouteExtension on LoginCheckAccountRoute {
  static LoginCheckAccountRoute _fromState(GoRouterState state) => LoginCheckAccountRoute(
        serverUrl: state.queryParameters['server-url']!,
        loginName: state.queryParameters['login-name']!,
        password: state.queryParameters['password']!,
      );

  String get location => GoRouteData.$location(
        '/login/check/account',
        queryParams: {
          'server-url': serverUrl,
          'login-name': loginName,
          'password': password,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
