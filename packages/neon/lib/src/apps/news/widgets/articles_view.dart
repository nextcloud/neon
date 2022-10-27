part of '../app.dart';

class NewsArticlesView extends StatefulWidget {
  const NewsArticlesView({
    required this.bloc,
    super.key,
  });

  final NewsArticlesBloc bloc;

  @override
  State<NewsArticlesView> createState() => _NewsArticlesViewState();
}

class _NewsArticlesViewState extends State<NewsArticlesView> {
  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      ExceptionWidget.showSnackbar(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) => StandardRxResultBuilder<NewsBloc, List<NewsFeed>>(
        bloc: widget.bloc.newsBloc,
        state: (final bloc) => bloc.feeds,
        builder: (
          final context,
          final feedsData,
          final feedsError,
          final feedsLoading,
          final _,
        ) =>
            StandardRxResultBuilder<NewsArticlesBloc, List<NewsArticle>>(
          bloc: widget.bloc,
          state: (final bloc) => bloc.articles,
          builder: (
            final context,
            final articlesData,
            final articlesError,
            final articlesLoading,
            final _,
          ) =>
              Scaffold(
            resizeToAvoidBottomInset: false,
            body: SortBoxBuilder<ArticlesSortProperty, NewsArticle>(
              sortBox: articlesSortBox,
              sortPropertyOption: widget.bloc.newsBloc.options.articlesSortPropertyOption,
              sortBoxOrderOption: widget.bloc.newsBloc.options.articlesSortBoxOrderOption,
              input: articlesData,
              builder: (final context, final sorted) => CustomListView<NewsArticle>(
                scrollKey: 'news-articles',
                items: feedsData == null ? null : sorted,
                isLoading: articlesLoading || feedsLoading,
                error: articlesError ?? feedsError,
                onRetry: () {
                  if (articlesError != null) {
                    widget.bloc.refresh();
                  }
                  if (feedsError != null) {
                    widget.bloc.refreshNewsBloc();
                  }
                },
                onRefresh: () async {
                  widget.bloc.refresh();
                },
                builder: (final context, final article) => _buildArticle(
                  context,
                  widget.bloc,
                  article,
                  feedsData!.singleWhere((final feed) => feed.id == article.feedId),
                ),
                topFixedChildren: [
                  RxBlocBuilder<NewsArticlesBloc, FilterType>(
                    bloc: widget.bloc,
                    state: (final bloc) => bloc.filterType,
                    builder: (
                      final context,
                      final selectedFilterTypeSnapshot,
                      final _,
                    ) =>
                        Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton<FilterType>(
                        isExpanded: true,
                        value: selectedFilterTypeSnapshot.data,
                        items: [
                          FilterType.all,
                          FilterType.unread,
                          if (widget.bloc.listType == null) ...[
                            FilterType.starred,
                          ],
                        ].map<DropdownMenuItem<FilterType>>(
                          (final a) {
                            late final String label;
                            switch (a) {
                              case FilterType.all:
                                label = AppLocalizations.of(context).newsFilterAll;
                                break;
                              case FilterType.unread:
                                label = AppLocalizations.of(context).newsFilterUnread;
                                break;
                              case FilterType.starred:
                                label = AppLocalizations.of(context).newsFilterStarred;
                                break;
                              default:
                                throw Exception('FilterType $a should not be shown');
                            }
                            return DropdownMenuItem(
                              value: a,
                              child: Text(label),
                            );
                          },
                        ).toList(),
                        onChanged: (final value) {
                          widget.bloc.setFilterType(value!);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildArticle(
    final BuildContext context,
    final NewsArticlesBloc bloc,
    final NewsArticle article,
    final NewsFeed feed,
  ) =>
      ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                article.title,
                style: article.unread
                    ? null
                    : Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).disabledColor),
              ),
            ),
            if (article.mediaThumbnail != null) ...[
              CachedURLImage(
                url: article.mediaThumbnail!,
                width: 100,
                height: 50,
                fit: BoxFit.cover,
              ),
            ],
          ],
        ),
        subtitle: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                right: 8,
              ),
              child: NewsFeedIcon(
                feed: feed,
                size: 16,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
            RelativeTime(
              date: DateTime.fromMillisecondsSinceEpoch(article.pubDate * 1000),
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Text(
                feed.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            article.starred ? Icons.star : Icons.star_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            if (article.starred) {
              bloc.unstarArticle(article);
            } else {
              bloc.starArticle(article);
            }
          },
        ),
        onLongPress: () {
          if (article.unread) {
            bloc.markArticleAsRead(article);
          } else {
            bloc.markArticleAsUnread(article);
          }
        },
        onTap: () async {
          final viewType = bloc.newsBloc.options.articleViewTypeOption.value;
          String? bodyData;
          try {
            bodyData = _fixArticleBody(article.body);
          } catch (e, s) {
            debugPrint(e.toString());
            debugPrint(s.toString());
          }

          if (viewType == ArticleViewType.direct && bodyData != null) {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (final context) => NewsArticlePage(
                  bloc: NewsArticleBloc(
                    Provider.of<RequestManager>(context, listen: false),
                    RxBlocProvider.of<AccountsBloc>(context).activeAccount.value!.client,
                    widget.bloc,
                    article,
                  ),
                  articlesBloc: widget.bloc,
                  useWebView: false,
                  bodyData: bodyData,
                ),
              ),
            );
          } else if (Provider.of<NeonPlatform>(context, listen: false).canUseWebView &&
              viewType == ArticleViewType.internalBrowser) {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (final context) => NewsArticlePage(
                  bloc: NewsArticleBloc(
                    Provider.of<RequestManager>(context, listen: false),
                    RxBlocProvider.of<AccountsBloc>(context).activeAccount.value!.client,
                    widget.bloc,
                    article,
                  ),
                  articlesBloc: widget.bloc,
                  useWebView: true,
                ),
              ),
            );
          } else {
            if (article.unread) {
              bloc.markArticleAsRead(article);
            }
            await launchUrlString(
              article.url,
              mode: LaunchMode.externalApplication,
            );
          }
        },
      );

  String _fixArticleBody(final String b) => _fixArticleBodyElement(html_parser.parse(b).documentElement!).outerHtml;

  html_dom.Element _fixArticleBodyElement(final html_dom.Element element) {
    for (final attributeName in ['src', 'href']) {
      final attributeValue = element.attributes[attributeName];
      if (attributeValue != null && attributeValue.startsWith('//')) {
        element.attributes[attributeName] = 'https:$attributeValue';
      }
    }

    element.children.forEach(_fixArticleBodyElement);

    return element;
  }
}
