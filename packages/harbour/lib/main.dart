import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:harbour/app.dart';
import 'package:harbour/src/harbour.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  Env? env;
  try {
    await dotenv.load(fileName: 'assets/.env');
    if (dotenv.env.keys.isNotEmpty) {
      if (kReleaseMode) {
        throw Exception('A release build can not contain a .env file');
      }
      env = Env.fromMap(dotenv.env);
    }
  } catch (e) {}

  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  final platform = getHarbourPlatform();

  await platform.init?.call();

  final sharedPreferences = await SharedPreferences.getInstance();

  final cache = Cache(platform);
  await cache.init();
  final requestManager = RequestManager(cache);

  final globalOptions = GlobalOptions(
    Storage('global', sharedPreferences),
  );

  final accountsBloc = AccountsBloc(
    requestManager,
    Storage('accounts', sharedPreferences),
    sharedPreferences,
    globalOptions,
  );

  final allAppImplementations = <AppImplementation>[
    FilesApp(sharedPreferences, requestManager, platform),
    NewsApp(sharedPreferences, requestManager, platform),
    NotesApp(sharedPreferences, requestManager),
  ];

  runApp(
    MultiProvider(
      providers: [
        Provider<Env?>(
          create: (final _) => env,
        ),
        Provider<HarbourPlatform>(
          create: (final _) => platform,
        ),
        Provider<GlobalOptions>(
          create: (final _) => globalOptions,
        ),
        Provider<RequestManager>(
          create: (final _) => requestManager,
        ),
        Provider<AccountsBloc>(
          create: (final _) => accountsBloc,
        ),
        Provider<List<AppImplementation>>(
          create: (final _) => allAppImplementations,
        ),
      ],
      child: const HarbourApp(),
    ),
  );
}

HarbourPlatform getHarbourPlatform() {
  if (Platform.isAndroid) {
    return AndroidHarbourPlatform();
  }
  if (Platform.isLinux) {
    return LinuxHarbourPlatform();
  }

  throw UnimplementedError('No implementation for platform ${Platform.operatingSystem} found');
}
