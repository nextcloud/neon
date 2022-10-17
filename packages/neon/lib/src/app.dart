part of 'neon.dart';

class NeonApp extends StatefulWidget {
  const NeonApp({
    required this.accountsBloc,
    required this.sharedPreferences,
    required this.env,
    required this.platform,
    required this.globalOptions,
    super.key,
  });

  final AccountsBloc accountsBloc;
  final SharedPreferences sharedPreferences;
  final Env? env;
  final NeonPlatform platform;
  final GlobalOptions globalOptions;

  @override
  State<NeonApp> createState() => _NeonAppState();
}

// ignore: prefer_mixin
class _NeonAppState extends State<NeonApp> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming? _userTheme;
  final _platformBrightness = BehaviorSubject<Brightness>.seeded(
    WidgetsBinding.instance.window.platformBrightness,
  );

  @override
  void didChangePlatformBrightness() {
    _platformBrightness.add(WidgetsBinding.instance.window.platformBrightness);

    super.didChangePlatformBrightness();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      widget.accountsBloc.activeAccount.listen((final activeAccount) async {
        FlutterNativeSplash.remove();

        if (activeAccount == null) {
          await _navigatorKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (final context) => const LoginPage(),
            ),
            (final _) => false,
          );
        } else {
          const settings = RouteSettings(
            name: 'home',
          );
          Widget builder(final context) => HomePage(
                account: activeAccount,
                onThemeChanged: (final theme) {
                  setState(() {
                    _userTheme = theme;
                  });
                },
              );
          await _navigatorKey.currentState!.pushAndRemoveUntil(
            widget.globalOptions.navigationMode.value == NavigationMode.drawer
                ? MaterialPageRoute(
                    settings: settings,
                    builder: builder,
                  )
                : NoAnimationPageRoute(
                    settings: settings,
                    builder: builder,
                  ),
            (final _) => false,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_platformBrightness.close());

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder<Brightness>(
        stream: _platformBrightness,
        builder: (final context, final platformBrightnessSnapshot) => OptionBuilder(
          option: widget.globalOptions.themeMode,
          builder: (final context, final themeMode) => OptionBuilder(
            option: widget.globalOptions.themeOLEDAsDark,
            builder: (final context, final themeOLEDAsDark) => OptionBuilder(
              option: widget.globalOptions.themeKeepOriginalAccentColor,
              builder: (final context, final themeKeepOriginalAccentColor) {
                if (!platformBrightnessSnapshot.hasData ||
                    themeMode == null ||
                    themeOLEDAsDark == null ||
                    themeKeepOriginalAccentColor == null) {
                  return Container();
                }
                return MaterialApp(
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  navigatorKey: _navigatorKey,
                  theme: getThemeFromNextcloudTheme(
                    _userTheme,
                    themeMode,
                    platformBrightnessSnapshot.data!,
                    oledAsDark: themeOLEDAsDark,
                    keepOriginalAccentColor: themeKeepOriginalAccentColor,
                  ),
                  home: Container(),
                );
              },
            ),
          ),
        ),
      );
}
