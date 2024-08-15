import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:news_app/src/blocs/articles.dart';
import 'package:news_app/src/blocs/news.dart';
import 'package:news_app/src/options.dart';
import 'package:news_app/src/widgets/articles_view.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(feed.title),
      ),
      body: SafeArea(
        child: NewsArticlesView(
          bloc: NewsArticlesBloc(
            newsBloc: bloc,
            options: NeonProvider.of<NewsOptions>(context),
            account: NeonProvider.of<Account>(context),
            id: feed.id,
            listType: ListType.feed,
          ),
          newsBloc: bloc,
        ),
      ),
    );
  }
}
