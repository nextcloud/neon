part of '../neon_news.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({
    required this.bloc,
    super.key,
  });

  final NewsBloc bloc;

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  late int _index = widget.bloc.options.defaultCategoryOption.value.index;

  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      NeonException.showSnackbar(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (final index) {
            setState(() {
              _index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.newspaper),
              label: AppLocalizations.of(context).newsArticles,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.folder),
              label: AppLocalizations.of(context).newsFolders,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.rss_feed),
              label: AppLocalizations.of(context).newsFeeds,
            ),
          ],
        ),
        body: _index == 0
            ? NewsArticlesView(
                bloc: widget.bloc.mainArticlesBloc,
                newsBloc: widget.bloc,
              )
            : _index == 1
                ? NewsFoldersView(
                    bloc: widget.bloc,
                  )
                : NewsFeedsView(
                    bloc: widget.bloc,
                  ),
      );
}
