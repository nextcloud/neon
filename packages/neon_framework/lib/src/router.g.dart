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
      factory: _$HomeRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'settings',
          name: 'Settings',
          factory: _$SettingsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'apps/:appid',
              name: 'AppImplementationSettings',
              factory: _$AppImplementationSettingsRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'account/:accountID',
              name: 'AccountSettings',
              factory: _$AccountSettingsRoute._fromState,
            ),
          ],
        ),
      ],
    );

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute(
        initialCategory:
            _$convertMapValue('initial-category', state.uri.queryParameters, _$SettingsCategoriesEnumMap._$fromName),
      );

  SettingsRoute get _self => this as SettingsRoute;

  @override
  String get location => GoRouteData.$location(
        '/settings',
        queryParams: {
          if (_self.initialCategory != null) 'initial-category': _$SettingsCategoriesEnumMap[_self.initialCategory!],
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  @override
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

mixin _$AppImplementationSettingsRoute on GoRouteData {
  static AppImplementationSettingsRoute _fromState(GoRouterState state) => AppImplementationSettingsRoute(
        appid: state.pathParameters['appid']!,
      );

  AppImplementationSettingsRoute get _self => this as AppImplementationSettingsRoute;

  @override
  String get location => GoRouteData.$location(
        '/settings/apps/${Uri.encodeComponent(_self.appid)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$AccountSettingsRoute on GoRouteData {
  static AccountSettingsRoute _fromState(GoRouterState state) => AccountSettingsRoute(
        accountID: state.pathParameters['accountID']!,
      );

  AccountSettingsRoute get _self => this as AccountSettingsRoute;

  @override
  String get location => GoRouteData.$location(
        '/settings/account/${Uri.encodeComponent(_self.accountID)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) => entries.where((element) => element.value == value).firstOrNull?.key;
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      name: 'login',
      factory: _$LoginRoute._fromState,
    );

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
        serverUrl: _$convertMapValue('server-url', state.uri.queryParameters, Uri.tryParse),
        qrCode: state.uri.queryParameters['qr-code'],
      );

  LoginRoute get _self => this as LoginRoute;

  @override
  String get location => GoRouteData.$location(
        '/login',
        queryParams: {
          if (_self.serverUrl != null) 'server-url': _self.serverUrl!.toString(),
          if (_self.qrCode != null) 'qr-code': _self.qrCode,
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
