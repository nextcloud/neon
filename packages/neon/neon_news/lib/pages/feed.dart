part of '../neon_news.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({
    required this.feed,
    super.key,
  });

  final NextcloudNewsFeed feed;

  @override
  Widget build(final BuildContext context) {
    final bloc = Provider.of<NewsBloc>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(feed.title),
      ),
      body: NewsArticlesView(
        bloc: NewsArticlesBloc(
          bloc,
          bloc.options,
          bloc.requestManager,
          bloc.client,
          id: feed.id,
          listType: ListType.feed,
        ),
      ),
    );
  }
}
