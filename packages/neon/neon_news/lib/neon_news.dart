library neon_news;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart' as html_parser;
import 'package:neon/blocs.dart';
import 'package:neon/models.dart';
import 'package:neon/nextcloud.dart';
import 'package:neon/platform.dart';
import 'package:neon/settings.dart';
import 'package:neon/sort_box.dart';
import 'package:neon/theme.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:neon_news/routes.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'blocs/article.dart';
part 'blocs/articles.dart';
part 'blocs/news.dart';
part 'dialogs/add_feed.dart';
part 'dialogs/create_folder.dart';
part 'dialogs/feed_show_url.dart';
part 'dialogs/feed_update_error.dart';
part 'dialogs/move_feed.dart';
part 'options.dart';
part 'pages/article.dart';
part 'pages/feed.dart';
part 'pages/folder.dart';
part 'pages/main.dart';
part 'sort/articles.dart';
part 'sort/feeds.dart';
part 'sort/folders.dart';
part 'widgets/articles_view.dart';
part 'widgets/feed_floating_action_button.dart';
part 'widgets/feed_icon.dart';
part 'widgets/feeds_view.dart';
part 'widgets/folder_floating_action_button.dart';
part 'widgets/folder_select.dart';
part 'widgets/folder_view.dart';
part 'widgets/folders_view.dart';

class NewsApp extends AppImplementation<NewsBloc, NewsAppSpecificOptions> {
  NewsApp();

  @override
  final String id = AppIDs.news;

  @override
  final LocalizationsDelegate<AppLocalizations> localizationsDelegate = AppLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  @override
  late final NewsAppSpecificOptions options = NewsAppSpecificOptions(storage);

  @override
  NewsBloc buildBloc(final Account account) => NewsBloc(
        options,
        account,
      );

  @override
  final Widget page = const NewsMainPage();

  @override
  final RouteBase route = $newsAppRoute;

  @override
  BehaviorSubject<int> getUnreadCounter(final NewsBloc bloc) => bloc.unreadCounter;
}
