import 'package:flutter/material.dart';
import 'package:neon_news/src/blocs/articles.dart';
import 'package:neon_news/src/blocs/news.dart';
import 'package:neon_news/src/widgets/articles_view.dart';
import 'package:nextcloud/news.dart' as news;

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({
    required this.bloc,
    required this.feed,
    super.key,
  });

  final NewsBloc bloc;
  final news.Feed feed;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(feed.title),
        ),
        body: SafeArea(
          child: NewsArticlesView(
            bloc: NewsArticlesBloc(
              bloc,
              bloc.options,
              bloc.account,
              id: feed.id,
              listType: ListType.feed,
            ),
            newsBloc: bloc,
          ),
        ),
      );
}
