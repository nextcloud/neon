import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:neon_news/src/blocs/news.dart';
import 'package:neon_news/src/options.dart';
import 'package:neon_news/src/widgets/articles_view.dart';
import 'package:neon_news/src/widgets/feed_floating_action_button.dart';
import 'package:neon_news/src/widgets/feeds_view.dart';
import 'package:neon_news/src/widgets/folder_floating_action_button.dart';
import 'package:neon_news/src/widgets/folders_view.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({
    super.key,
  });

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  late NewsBloc bloc;
  late int index;
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();
    bloc = NeonProvider.of<NewsBloc>(context);
    index = NeonProvider.of<NewsOptions>(context).defaultCategoryOption.value.index;

    errorsSubscription = bloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final views = [
      NewsArticlesView(
        bloc: bloc.mainArticlesBloc,
        newsBloc: bloc,
      ),
      NewsFoldersView(
        bloc: bloc,
      ),
      NewsFeedsView(
        bloc: bloc,
      ),
    ];

    final floatingActionButtons = [
      null,
      NewsFolderFloatingActionButton(bloc: bloc),
      NewsFeedFloatingActionButton(bloc: bloc),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(AdaptiveIcons.newspaper),
            label: NewsLocalizations.of(context).articles,
          ),
          BottomNavigationBarItem(
            icon: Icon(AdaptiveIcons.folder),
            label: NewsLocalizations.of(context).folders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.rss_feed),
            label: NewsLocalizations.of(context).feeds,
          ),
        ],
      ),
      body: views[index],
      floatingActionButton: floatingActionButtons[index],
    );
  }
}
