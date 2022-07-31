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
            body: RefreshIndicator(
              onRefresh: () async {
                widget.bloc.refresh();
              },
              child: Column(
                children: <Widget>[
                  ExceptionWidget(
                    articlesError ?? feedsError,
                    onRetry: () {
                      if (articlesError != null) {
                        widget.bloc.refresh();
                      }
                      if (feedsError != null) {
                        widget.bloc.refreshNewsBloc();
                      }
                    },
                  ),
                  CustomLinearProgressIndicator(
                    visible: articlesLoading || feedsLoading,
                  ),
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
                  if (articlesData != null && feedsData != null) ...[
                    Expanded(
                      child: SortBoxBuilder<ArticlesSortProperty, NewsArticle>(
                        sortBox: articlesSortBox,
                        sortPropertyOption: widget.bloc.newsBloc.options.articlesSortPropertyOption,
                        sortBoxOrderOption: widget.bloc.newsBloc.options.articlesSortBoxOrderOption,
                        input: articlesData,
                        builder: (final context, final sorted) => CustomListView<NewsArticle>(
                          scrollKey: 'news-articles',
                          items: sorted,
                          builder: (final context, final article) => _buildArticle(
                            context,
                            widget.bloc,
                            article,
                            feedsData.singleWhere((final feed) => feed.id == article.feedId),
                          ),
                        ),
                      ),
                    ),
                  ],
                ]
                    .intersperse(
                      const SizedBox(
                        height: 10,
                      ),
                    )
                    .toList(),
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
  ) {
    final clientID = RxBlocProvider.of<AccountsBloc>(context).activeAccount.value!.client.id;

    return ResultStreamBuilder<String>(
      stream: Provider.of<RequestManager>(context).wrapString(
        clientID,
        'news-articles-body-${article.id}',
        () async => _fixArticleBody(article.body!),
        preferCache: true,
      ),
      builder: (
        final context,
        final bodyData,
        final bodyError,
        final bodyLoading,
      ) =>
          ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                article.title!,
                style: article.unread!
                    ? null
                    : Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).disabledColor),
              ),
            ),
            if (article.mediaThumbnail != null) ...[
              CachedURLImage(
                url: article.mediaThumbnail!,
                requestManager: Provider.of<RequestManager>(context),
                client: RxBlocProvider.of<AccountsBloc>(context).activeAccount.value!.client,
                width: 100,
                height: 50,
                fit: BoxFit.cover,
              ),
            ],
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              CustomTimeAgo.format(
                DateTime.fromMillisecondsSinceEpoch(article.pubDate! * 1000),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
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
            Flexible(
              child: Text(
                feed.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            article.starred! ? Icons.star : Icons.star_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            if (article.starred!) {
              bloc.unstarArticle(article);
            } else {
              bloc.starArticle(article);
            }
          },
        ),
        onLongPress: () {
          if (article.unread!) {
            bloc.markArticleAsRead(article);
          } else {
            bloc.markArticleAsUnread(article);
          }
        },
        onTap: bodyData != null
            ? () async {
                final viewType = bloc.newsBloc.options.articleViewTypeOption.value;
                if (viewType == ArticleViewType.direct) {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (final context) => NewsArticlePage(
                        bloc: bloc,
                        article: article,
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
                        bloc: bloc,
                        article: article,
                        useWebView: true,
                      ),
                    ),
                  );
                } else {
                  if (article.unread!) {
                    bloc.markArticleAsRead(article);
                  }
                  await launchUrlString(
                    article.url!,
                    mode: LaunchMode.externalApplication,
                  );
                }
              }
            : null,
      ),
    );
  }

  String _fixArticleBody(final String b) => _fixTree(html_parser.parse(b).documentElement!).outerHtml;

  html_dom.Element _fixTree(final html_dom.Element element) {
    _fixElement(element);
    element.children.forEach(_fixTree);

    return element;
  }

  html_dom.Element _fixElement(final html_dom.Element element) {
    for (final attributeName in ['src', 'href']) {
      final attributeValue = element.attributes[attributeName];
      if (attributeValue != null && attributeValue.startsWith('//')) {
        element.attributes[attributeName] = 'https:$attributeValue';
      }
    }

    return element;
  }
}
