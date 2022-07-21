part of '../app.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({
    required this.bloc,
    required this.feed,
    super.key,
  });

  final NewsBloc bloc;
  final NewsFeed feed;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(feed.title!),
        ),
        body: NewsArticlesView(
          bloc: NewsArticlesBloc(
            bloc,
            isMainArticlesBloc: false,
            id: feed.id,
            listType: ListType.feed,
          ),
        ),
      );
}
