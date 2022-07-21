import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:neon/app.dart';
import 'package:neon/src/neon.dart';
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

  await Global.init();

  final platform = getNeonPlatform();

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
        Provider<NeonPlatform>(
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
      child: const NeonApp(),
    ),
  );
}

NeonPlatform getNeonPlatform() {
  if (Platform.isAndroid) {
    return AndroidNeonPlatform();
  }
  if (Platform.isLinux) {
    return LinuxNeonPlatform();
  }

  throw UnimplementedError('No implementation for platform ${Platform.operatingSystem} found');
}
