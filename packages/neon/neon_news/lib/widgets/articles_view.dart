part of '../neon_news.dart';

class NewsArticlesView extends StatefulWidget {
  const NewsArticlesView({
    required this.bloc,
    required this.newsBloc,
    super.key,
  });

  final NewsArticlesBloc bloc;
  final NewsBloc newsBloc;

  @override
  State<NewsArticlesView> createState() => _NewsArticlesViewState();
}

class _NewsArticlesViewState extends State<NewsArticlesView> {
  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      NeonException.showSnackbar(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<NewsBloc, List<NextcloudNewsFeed>>(
        stream: widget.newsBloc.feeds,
        builder: (final context, final feeds) => ResultBuilder<NewsArticlesBloc, List<NextcloudNewsArticle>>(
          stream: widget.bloc.articles,
          builder: (final context, final articles) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: SortBoxBuilder<ArticlesSortProperty, NextcloudNewsArticle>(
              sortBox: articlesSortBox,
              sortPropertyOption: widget.newsBloc.options.articlesSortPropertyOption,
              sortBoxOrderOption: widget.newsBloc.options.articlesSortBoxOrderOption,
              input: articles.data,
              builder: (final context, final sorted) => NeonListView<NextcloudNewsArticle>(
                scrollKey: 'news-articles',
                items: feeds.data == null ? null : sorted,
                isLoading: articles.loading || feeds.loading,
                error: articles.error ?? feeds.error,
                onRefresh: () async {
                  await Future.wait([
                    widget.bloc.refresh(),
                    widget.newsBloc.refresh(),
                  ]);
                },
                builder: (final context, final article) => _buildArticle(
                  context,
                  article,
                  feeds.data!.singleWhere((final feed) => feed.id == article.feedId),
                ),
                topFixedChildren: [
                  StreamBuilder<FilterType>(
                    stream: widget.bloc.filterType,
                    builder: (final context, final selectedFilterTypeSnapshot) => Container(
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
    final NextcloudNewsArticle article,
    final NextcloudNewsFeed feed,
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
                    : Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).disabledColor),
              ),
            ),
            if (article.mediaThumbnail != null) ...[
              NeonCachedUrlImage(
                url: article.mediaThumbnail!,
                size: const Size(100, 50),
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
                icon: 16,
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
              widget.bloc.unstarArticle(article);
            } else {
              widget.bloc.starArticle(article);
            }
          },
        ),
        onLongPress: () {
          if (article.unread) {
            widget.bloc.markArticleAsRead(article);
          } else {
            widget.bloc.markArticleAsUnread(article);
          }
        },
        onTap: () async {
          final viewType = widget.newsBloc.options.articleViewTypeOption.value;
          String? bodyData;
          try {
            bodyData = _fixArticleBody(article.body);
          } catch (e, s) {
            debugPrint(e.toString());
            debugPrint(s.toString());
          }

          if ((viewType == ArticleViewType.direct || article.url == null) && bodyData != null) {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (final context) => NewsArticlePage(
                  bloc: NewsArticleBloc(
                    Provider.of<AccountsBloc>(context, listen: false).activeAccount.value!.client,
                    widget.bloc,
                    article,
                  ),
                  articlesBloc: widget.bloc,
                  useWebView: false,
                  bodyData: bodyData,
                  url: article.url,
                ),
              ),
            );
          } else if (viewType == ArticleViewType.internalBrowser &&
              article.url != null &&
              Provider.of<NeonPlatform>(context, listen: false).canUseWebView) {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (final context) => NewsArticlePage(
                  bloc: NewsArticleBloc(
                    Provider.of<AccountsBloc>(context, listen: false).activeAccount.value!.client,
                    widget.bloc,
                    article,
                  ),
                  articlesBloc: widget.bloc,
                  useWebView: true,
                  url: article.url,
                ),
              ),
            );
          } else {
            if (article.unread) {
              widget.bloc.markArticleAsRead(article);
            }
            if (article.url != null) {
              await launchUrlString(
                article.url!,
                mode: LaunchMode.externalApplication,
              );
            }
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
