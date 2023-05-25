library neon;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:bitmap/bitmap.dart';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:intl/intl_standalone.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/push_notification.dart';
import 'package:neon/src/router.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sort_box/sort_box.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:tray_manager/tray_manager.dart' as tray;
import 'package:unifiedpush/unifiedpush.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:window_manager/window_manager.dart';
import 'package:xdg_directories/xdg_directories.dart' as xdg;
import 'package:xml/xml.dart' as xml;

export 'src/models/account.dart';
export 'src/models/push_notification.dart';

part 'src/app.dart';
part 'src/blocs/accounts.dart';
part 'src/blocs/apps.dart';
part 'src/blocs/capabilities.dart';
part 'src/blocs/first_launch.dart';
part 'src/blocs/login.dart';
part 'src/blocs/next_push.dart';
part 'src/blocs/push_notifications.dart';
part 'src/blocs/user_details.dart';
part 'src/blocs/user_status.dart';
part 'src/interfaces/notifications.dart';
part 'src/pages/account_settings.dart';
part 'src/pages/home.dart';
part 'src/pages/login.dart';
part 'src/pages/nextcloud_app_settings.dart';
part 'src/pages/settings.dart';
part 'src/platform/abstract.dart';
part 'src/platform/android.dart';
part 'src/platform/linux.dart';
part 'src/platform/platform.dart';
part 'src/utils/account_options.dart';
part 'src/utils/app_implementation.dart';
part 'src/utils/bloc.dart';
part 'src/utils/branding.dart';
part 'src/utils/confirmation_dialog.dart';
part 'src/utils/exceptions.dart';
part 'src/utils/global.dart';
part 'src/utils/global_options.dart';
part 'src/utils/global_popups.dart';
part 'src/utils/hex_color.dart';
part 'src/utils/localizations.dart';
part 'src/utils/nextcloud_app_specific_options.dart';
part 'src/utils/push_utils.dart';
part 'src/utils/rename_dialog.dart';
part 'src/utils/request_manager.dart';
part 'src/utils/result.dart';
part 'src/utils/save_file.dart';
part 'src/utils/settings_export_helper.dart';
part 'src/utils/sort_box_builder.dart';
part 'src/utils/sort_box_order_option_values.dart';
part 'src/utils/storage.dart';
part 'src/utils/stream_listenable.dart';
part 'src/utils/theme.dart';
part 'src/utils/validators.dart';
part 'src/widgets/account_avatar.dart';
part 'src/widgets/account_settings_tile.dart';
part 'src/widgets/account_tile.dart';
part 'src/widgets/app_implementation_icon.dart';
part 'src/widgets/cached_api_image.dart';
part 'src/widgets/cached_image.dart';
part 'src/widgets/cached_url_image.dart';
part 'src/widgets/dialog.dart';
part 'src/widgets/exception.dart';
part 'src/widgets/image_wrapper.dart';
part 'src/widgets/linear_progress_indicator.dart';
part 'src/widgets/list_view.dart';
part 'src/widgets/nextcloud_logo.dart';
part 'src/widgets/relative_time.dart';
part 'src/widgets/result_builder.dart';
part 'src/widgets/text_settings_tile.dart';

Future runNeon({
  required final WidgetsBinding binding,
  required final List<AppImplementation> Function(SharedPreferences, RequestManager, NeonPlatform)
      getAppImplementations,
  required final Branding branding,
  final SharedPreferences? sharedPreferencesOverride,
  final Account? account,
  final bool firstLaunchDisabled = false,
  final bool nextPushDisabled = false,
}) async {
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  final sharedPreferences = sharedPreferencesOverride ?? await SharedPreferences.getInstance();

  final platform = await getNeonPlatform();
  final cache = Cache(platform);
  await cache.init();
  final requestManager = RequestManager(cache);
  final allAppImplementations = getAppImplementations(sharedPreferences, requestManager, platform);

  final packageInfo = await PackageInfo.fromPlatform();

  final globalOptions = GlobalOptions(
    sharedPreferences,
    packageInfo,
  );

  final accountsBloc = AccountsBloc(
    requestManager,
    platform,
    sharedPreferences,
    globalOptions,
    allAppImplementations,
  );
  if (account != null) {
    accountsBloc
      ..addAccount(account)
      ..setActiveAccount(account);
  }
  final pushNotificationsBloc = PushNotificationsBloc(
    accountsBloc,
    sharedPreferences,
    globalOptions,
    platform,
  );
  final firstLaunchBloc = FirstLaunchBloc(
    sharedPreferences,
    disabled: firstLaunchDisabled,
  );
  final nextPushBloc = NextPushBloc(
    accountsBloc,
    globalOptions,
    disabled: nextPushDisabled,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPreferences>(
          create: (final _) => sharedPreferences,
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
        Provider<PushNotificationsBloc>(
          create: (final _) => pushNotificationsBloc,
        ),
        Provider<FirstLaunchBloc>(
          create: (final _) => firstLaunchBloc,
        ),
        Provider<NextPushBloc>(
          create: (final _) => nextPushBloc,
        ),
        Provider<List<AppImplementation>>(
          create: (final _) => allAppImplementations,
        ),
        Provider<PackageInfo>(
          create: (final _) => packageInfo,
        ),
        Provider<Branding>(
          create: (final _) => branding,
        ),
      ],
      child: NeonApp(
        accountsBloc: accountsBloc,
        sharedPreferences: sharedPreferences,
        platform: platform,
        globalOptions: globalOptions,
      ),
    ),
  );
}
