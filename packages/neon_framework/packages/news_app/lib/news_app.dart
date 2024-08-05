/// The Neon client for the News app.
///
/// Add `NewsApp()` to your runNeon command to execute this app.
library;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/models.dart';
import 'package:news_app/l10n/localizations.dart';
import 'package:news_app/src/blocs/news.dart';
import 'package:news_app/src/options.dart';
import 'package:news_app/src/pages/main.dart';
import 'package:news_app/src/routes.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/news.dart' as news;
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

class NewsApp extends AppImplementation<NewsBloc, NewsOptions> {
  NewsApp();

  @override
  final String id = news.appID;

  @override
  final LocalizationsDelegate<NewsLocalizations> localizationsDelegate = NewsLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = NewsLocalizations.supportedLocales;

  @override
  late final NewsOptions options = NewsOptions(storage);

  @override
  NewsBloc buildBloc(Account account) => NewsBloc(
        options: options,
        account: account,
      );

  @override
  final Widget page = const NewsMainPage();

  @override
  final RouteBase route = $newsAppRoute;

  @override
  BehaviorSubject<int> getUnreadCounter(NewsBloc bloc) => bloc.unreadCounter;

  @override
  Future<VersionCheck> getVersionCheck(
    Account account,
    core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities,
  ) =>
      account.client.news.getVersionCheck();
}
