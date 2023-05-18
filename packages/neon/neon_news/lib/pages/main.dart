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
  Widget build(final BuildContext context) {
    final views = [
      NewsArticlesView(
        bloc: widget.bloc.mainArticlesBloc,
        newsBloc: widget.bloc,
      ),
      NewsFoldersView(
        bloc: widget.bloc,
      ),
      NewsFeedsView(
        bloc: widget.bloc,
      ),
    ];

    final floatingActionButtons = [
      null,
      NewsFolderFloatingActionButton(bloc: widget.bloc),
      NewsFeedFloatingActionButton(bloc: widget.bloc),
    ];

    return Scaffold(
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
      body: views[_index],
      floatingActionButton: floatingActionButtons[_index],
    );
  }
}
