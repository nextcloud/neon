import 'dart:io';

import 'package:app/apps.dart';
import 'package:app/branding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/models.dart';
import 'package:neon/neon.dart';
import 'package:neon_files/neon_files.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemorySharedPreferences implements SharedPreferences {
  final _data = <String, dynamic>{};

  @override
  Future<bool> clear() async {
    _data.clear();
    return true;
  }

  @override
  Future<bool> commit() async => true;

  @override
  Future reload() async {}

  @override
  Future<bool> remove(final String key) async {
    _data.remove(key);
    return true;
  }

  @override
  Set<String> getKeys() => _data.keys.toSet();

  @override
  bool containsKey(final String key) => _data.keys.contains(key);

  @override
  Object? get(final String key) => _data[key];

  @override
  bool? getBool(final String key) => _data[key] as bool?;

  @override
  double? getDouble(final String key) => _data[key] as double?;

  @override
  int? getInt(final String key) => _data[key] as int?;

  @override
  String? getString(final String key) => _data[key] as String?;

  @override
  List<String>? getStringList(final String key) => (_data[key] as List).cast<String>();

  @override
  Future<bool> setBool(final String key, final bool value) async {
    _data[key] = value;
    return true;
  }

  @override
  Future<bool> setDouble(final String key, final double value) async {
    _data[key] = value;
    return true;
  }

  @override
  Future<bool> setInt(final String key, final int value) async {
    _data[key] = value;
    return true;
  }

  @override
  Future<bool> setString(final String key, final String value) async {
    _data[key] = value;
    return true;
  }

  @override
  Future<bool> setStringList(final String key, final List<String> value) async {
    _data[key] = value;
    return true;
  }
}

Future runTestApp(
  final WidgetTester tester,
  final IntegrationTestWidgetsFlutterBinding binding, {
  final Account? account,
}) async {
  await runNeon(
    getAppImplementations: getAppImplementations,
    theme: neonTheme,
    bindingOverride: binding,
    sharedPreferencesOverride: MemorySharedPreferences(),
    account: account,
    firstLaunchDisabled: true,
    nextPushDisabled: true,
  );
  await tester.pumpAndSettle();
}

Future openDrawer(final WidgetTester tester) async {
  await tester.tap(find.byTooltip('Open navigation menu'));
  await tester.pumpAndSettle();
}

Future switchPage(final WidgetTester tester, final String name) async {
  await openDrawer(tester);
  await tester.tap(find.byKey(Key(name)));
  await tester.pumpAndSettle();
}

Future prepareScreenshot(final WidgetTester tester, final IntegrationTestWidgetsFlutterBinding binding) async {
  await binding.convertFlutterSurfaceToImage();
  await tester.pumpAndSettle();
}

Future main() async {
  // The screenshots are pretty annoying on Android. See https://github.com/flutter/flutter/issues/92381

  assert(Platform.isAndroid, 'Screenshots need to be taken on Android');

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final account = Account(
    serverURL: 'http://10.0.2.2',
    username: 'user1',
    password: 'user1',
  );

  setUpAll(() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  });

  testWidgets('login', (final tester) async {
    await runTestApp(
      tester,
      binding,
    );
    await prepareScreenshot(tester, binding);
    await binding.takeScreenshot('login_server_selection');

    await tester.enterText(find.byType(TextFormField), account.serverURL);
    await tester.pumpAndSettle();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3)); // Make sure the login webview is loaded
    await tester.pumpAndSettle();
    await binding.takeScreenshot('login_form');
  });

  testWidgets('home', (final tester) async {
    await runTestApp(
      tester,
      binding,
      account: account,
    );
    await openDrawer(tester);
    await tester.pumpAndSettle();
    await tester.pump();
    await prepareScreenshot(tester, binding);
    await binding.takeScreenshot('home_drawer');
  });

  testWidgets('files', (final tester) async {
    await runTestApp(
      tester,
      binding,
      account: account,
    );
    await prepareScreenshot(tester, binding);
    await binding.takeScreenshot('files_root');

    // Show Photos folder
    await tester.tap(find.text('Photos'));
    await tester.pumpAndSettle();
    await tester.pump();

    await binding.takeScreenshot('files_photos');

    // Show file actions
    await tester.tap(find.text('Photos'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(PopupMenuButton<FilesFileAction>).first);
    await tester.pumpAndSettle();

    await binding.takeScreenshot('files_actions');

    // Show details page
    await tester.tap(find.text('Details'));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('files_details');

    // Show create dialog
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('files_create');
  });

  testWidgets('news', (final tester) async {
    const wikipediaFeedURL = 'https://en.wikipedia.org/w/api.php?action=featuredfeed&feed=featured&feedformat=atom';
    const nasaFeedURL = 'https://www.nasa.gov/rss/dyn/breaking_news.rss';

    final folder = await account.client.news.createFolder(name: 'test');
    await account.client.news.addFeed(
      url: nasaFeedURL,
      folderId: folder.folders.single.id,
    );

    await runTestApp(
      tester,
      binding,
      account: account,
    );
    await prepareScreenshot(tester, binding);
    await switchPage(tester, 'app-news');

    // Show folders
    await tester.tap(find.byIcon(Icons.folder));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('news_folders_list');

    // Add Wikipedia feed
    await tester.tap(find.byIcon(Icons.rss_feed));
    await tester.pumpAndSettle();
    await tester.pump();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('news_feed_add');

    // Finish adding Wikipedia feed
    await tester.enterText(find.byType(TextFormField), wikipediaFeedURL);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    await tester.pump();

    await binding.takeScreenshot('news_feeds_list');

    // Open feed
    await tester.tap(find.text('NASA Breaking News'));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('news_feed_articles_list');

    // Show unread articles
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.newspaper));
    await tester.pumpAndSettle();

    // Star two articles
    await tester.tap(find.byIcon(Icons.star_outline).at(0));
    await tester.tap(find.byIcon(Icons.star_outline).at(1));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));

    await binding.takeScreenshot('news_articles_unread_list');

    // Show starred articles
    await tester.tap(find.text('Unread'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Starred').last);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));

    await binding.takeScreenshot('news_articles_starred_list');
  });

  testWidgets('notes', (final tester) async {
    await account.client.notes.createNote(
      title: 'Wishlist',
      category: 'Financial',
    );

    await runTestApp(
      tester,
      binding,
      account: account,
    );
    await prepareScreenshot(tester, binding);
    await switchPage(tester, 'app-notes');

    // Create note
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).first, 'Grocery');
    await tester.pumpAndSettle();
    await tester.tap(find.byType(TextFormField).last);
    await tester.pumpAndSettle();

    await binding.takeScreenshot('notes_note_create');

    // Finish creating note
    await tester.enterText(find.byType(TextFormField).last, 'Financial');
    await tester.pumpAndSettle();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));

    // Star note
    await tester.tap(find.byIcon(Icons.star_outline).first);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));

    await binding.takeScreenshot('notes_notes_list');

    // Edit note
    await tester.tap(find.text('Grocery'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, '- Bread\n- Water\n- Apples');
    await tester.pumpAndSettle();
    await tester.pump(); // Needed for the text to actually show up

    await binding.takeScreenshot('notes_note_edit');

    // Show note preview
    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('notes_note_preview');

    // Show categories
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(MdiIcons.tag).last);
    await tester.pumpAndSettle();

    await binding.takeScreenshot('notes_categories_list');
  });

  testWidgets('notifications', (final tester) async {
    await Account(
      serverURL: 'http://10.0.2.2',
      username: 'admin',
      password: 'admin',
    ).client.notifications.sendAdminNotification(
          userId: account.username,
          shortMessage: 'Notifications demo',
          longMessage: 'This is a notifications demo of the Neon app',
        );

    await runTestApp(
      tester,
      binding,
      account: account,
    );
    await prepareScreenshot(tester, binding);
    await tester.tap(find.byKey(const Key('app-notifications')));
    await tester.pumpAndSettle();

    await tester.pumpAndSettle();
    await tester.pump();

    await binding.takeScreenshot('notifications_list');
  });

  testWidgets('settings', (final tester) async {
    await runTestApp(
      tester,
      binding,
      account: account,
    );
    await prepareScreenshot(tester, binding);
    await switchPage(tester, 'settings');

    // Open Files settings
    await tester.tap(find.text('Files'));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('settings_app_files');

    // Open News settings
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.text('News'));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('settings_app_news');

    // Open Notes settings
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Notes'));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('settings_app_notes');

    // Go back to main page
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('settings_light');

    // Change to dark theme
    await tester.tap(find.text('Automatic'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dark').last);
    await tester.pumpAndSettle();

    await binding.takeScreenshot('settings_dark');

    // Enable OLED theme
    await tester.tap(find.byType(CheckboxListTile).first);
    await tester.pumpAndSettle();

    await binding.takeScreenshot('settings_oled');

    // Change to back to light theme
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Light').last);
    await tester.pumpAndSettle();

    // Scroll down to accounts
    await tester.drag(find.byType(ListView), const Offset(0, -10000));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('settings_accounts');

    // Go to account settings
    await tester.tap(find.text('user1@10.0.2.2:80'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Automatic'));
    await tester.pumpAndSettle();

    await binding.takeScreenshot('settings_account');
  });
}
