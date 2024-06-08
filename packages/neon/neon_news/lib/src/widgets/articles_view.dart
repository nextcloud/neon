import 'dart:async';

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart' as html_parser;
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:neon_news/src/blocs/article.dart';
import 'package:neon_news/src/blocs/articles.dart';
import 'package:neon_news/src/blocs/news.dart';
import 'package:neon_news/src/options.dart';
import 'package:neon_news/src/pages/article.dart';
import 'package:neon_news/src/sort/articles.dart';
import 'package:neon_news/src/widgets/feed_icon.dart';
import 'package:nextcloud/news.dart' as news;
import 'package:nextcloud/utils.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher_string.dart';

final _log = Logger('NewsArticlesView');

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
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();

    errorsSubscription = widget.bloc.errors.listen((error) {
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
    return ResultBuilder.behaviorSubject(
      subject: widget.newsBloc.feeds,
      builder: (context, feeds) => ResultBuilder.behaviorSubject(
        subject: widget.bloc.articles,
        builder: (context, articles) => SortBoxBuilder(
          sortBox: articlesSortBox,
          sortProperty: widget.newsBloc.options.articlesSortPropertyOption,
          sortBoxOrder: widget.newsBloc.options.articlesSortBoxOrderOption,
          input: articles.data?.toList(),
          builder: (context, sorted) => NeonListView(
            scrollKey: 'news-articles',
            isLoading: articles.isLoading || feeds.isLoading,
            error: articles.error ?? feeds.error,
            onRefresh: () async {
              await Future.wait([
                widget.bloc.refresh(),
                widget.newsBloc.refresh(),
              ]);
            },
            itemCount: sorted.length,
            itemBuilder: (context, index) {
              final article = sorted[index];

              return _buildArticle(
                context,
                article,
                feeds.requireData.singleWhere((feed) => feed.id == article.feedId),
              );
            },
            topFixedChildren: [
              StreamBuilder(
                stream: widget.bloc.filterType,
                builder: (context, selectedFilterTypeSnapshot) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedFilterTypeSnapshot.data,
                    items: [
                      FilterType.all,
                      FilterType.unread,
                      if (widget.bloc.listType == null) FilterType.starred,
                    ].map(
                      (a) {
                        late final String label;
                        switch (a) {
                          case FilterType.all:
                            label = NewsLocalizations.of(context).articlesFilterAll;
                          case FilterType.unread:
                            label = NewsLocalizations.of(context).articlesFilterUnread;
                          case FilterType.starred:
                            label = NewsLocalizations.of(context).articlesFilterStarred;
                          default:
                            throw Exception('FilterType $a should not be shown');
                        }
                        return DropdownMenuItem(
                          value: a,
                          child: Text(label),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      widget.bloc.setFilterType(value!);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticle(
    BuildContext context,
    news.Article article,
    news.Feed feed,
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
            if (article.mediaThumbnail != null)
              NeonUriImage(
                uri: Uri.parse(article.mediaThumbnail!),
                size: const Size(100, 50),
                fit: BoxFit.cover,
                account: NeonProvider.of<Account>(context),
              ),
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
                size: smallIconSize,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
            RelativeTime(
              date: DateTimeUtils.fromSecondsSinceEpoch(
                tz.UTC,
                article.pubDate,
              ),
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
          onPressed: () {
            if (article.starred) {
              widget.bloc.unstarArticle(article);
            } else {
              widget.bloc.starArticle(article);
            }
          },
          tooltip:
              article.starred ? NewsLocalizations.of(context).articleUnstar : NewsLocalizations.of(context).articleStar,
          icon: Icon(
            article.starred ? AdaptiveIcons.star : AdaptiveIcons.star_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
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
          } on Exception catch (error, stackTrace) {
            _log.warning(
              'Could not parse the body of ${article.title}',
              error,
              stackTrace,
            );
          }

          final account = NeonProvider.of<Account>(context);

          if ((viewType == ArticleViewType.direct || article.url == null) && bodyData != null) {
            await Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => NewsArticlePage(
                  bloc: NewsArticleBloc(
                    articlesBloc: widget.bloc,
                    account: account,
                    article: article,
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
              NeonPlatform.instance.canUseWebView) {
            await Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => NewsArticlePage(
                  bloc: NewsArticleBloc(
                    articlesBloc: widget.bloc,
                    account: account,
                    article: article,
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

  String _fixArticleBody(String b) => _fixArticleBodyElement(html_parser.parse(b).documentElement!).outerHtml;

  html_dom.Element _fixArticleBodyElement(html_dom.Element element) {
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
