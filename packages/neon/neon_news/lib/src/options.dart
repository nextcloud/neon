import 'package:neon_framework/platform.dart';
import 'package:neon_framework/settings.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:neon_news/src/blocs/articles.dart';

class NewsAppSpecificOptions extends NextcloudAppOptions {
  NewsAppSpecificOptions(super.storage) {
    super.categories = [
      generalCategory,
      articlesCategory,
      foldersCategory,
      feedsCategory,
    ];
    super.options = [
      defaultCategoryOption,
      articleViewTypeOption,
      articleDisableMarkAsReadTimeoutOption,
      defaultArticlesFilterOption,
      articlesSortPropertyOption,
      articlesSortBoxOrderOption,
      foldersSortPropertyOption,
      foldersSortBoxOrderOption,
      defaultFolderViewTypeOption,
      feedsSortPropertyOption,
      feedsSortBoxOrderOption,
    ];
  }

  final generalCategory = OptionsCategory(
    name: (final context) => NewsLocalizations.of(context).general,
  );

  final articlesCategory = OptionsCategory(
    name: (final context) => NewsLocalizations.of(context).articles,
  );

  final foldersCategory = OptionsCategory(
    name: (final context) => NewsLocalizations.of(context).folders,
  );

  final feedsCategory = OptionsCategory(
    name: (final context) => NewsLocalizations.of(context).feeds,
  );

  late final defaultCategoryOption = SelectOption<DefaultCategory>(
    storage: super.storage,
    category: generalCategory,
    key: NewsOptionKeys.defaultCategory,
    label: (final context) => NewsLocalizations.of(context).optionsDefaultCategory,
    defaultValue: DefaultCategory.articles,
    values: {
      DefaultCategory.articles: (final context) => NewsLocalizations.of(context).articles,
      DefaultCategory.folders: (final context) => NewsLocalizations.of(context).folders,
      DefaultCategory.feeds: (final context) => NewsLocalizations.of(context).feeds,
    },
  );

  late final articleViewTypeOption = SelectOption<ArticleViewType>(
    storage: super.storage,
    category: articlesCategory,
    key: NewsOptionKeys.articleViewType,
    label: (final context) => NewsLocalizations.of(context).optionsArticleViewType,
    defaultValue: ArticleViewType.direct,
    values: {
      ArticleViewType.direct: (final context) => NewsLocalizations.of(context).optionsArticleViewTypeDirect,
      if (NeonPlatform.instance.canUseWebView)
        ArticleViewType.internalBrowser: (final context) =>
            NewsLocalizations.of(context).optionsArticleViewTypeInternalBrowser,
      ArticleViewType.externalBrowser: (final context) =>
          NewsLocalizations.of(context).optionsArticleViewTypeExternalBrowser,
    },
  );

  late final articleDisableMarkAsReadTimeoutOption = ToggleOption(
    storage: super.storage,
    category: articlesCategory,
    key: NewsOptionKeys.articleDisableMarkAsReadTimeout,
    label: (final context) => NewsLocalizations.of(context).optionsArticleDisableMarkAsReadTimeout,
    defaultValue: false,
  );

  late final defaultArticlesFilterOption = SelectOption<FilterType>(
    storage: super.storage,
    category: articlesCategory,
    key: NewsOptionKeys.defaultArticlesFilter,
    label: (final context) => NewsLocalizations.of(context).optionsDefaultArticlesFilter,
    defaultValue: FilterType.unread,
    values: {
      FilterType.all: (final context) => NewsLocalizations.of(context).articlesFilterAll,
      FilterType.unread: (final context) => NewsLocalizations.of(context).articlesFilterUnread,
      FilterType.starred: (final context) => NewsLocalizations.of(context).articlesFilterStarred,
    },
  );

  late final articlesSortPropertyOption = SelectOption<ArticlesSortProperty>(
    storage: super.storage,
    category: articlesCategory,
    key: NewsOptionKeys.articlesSortProperty,
    label: (final context) => NewsLocalizations.of(context).optionsArticlesSortProperty,
    defaultValue: ArticlesSortProperty.publishDate,
    values: {
      ArticlesSortProperty.publishDate: (final context) =>
          NewsLocalizations.of(context).optionsArticlesSortPropertyPublishDate,
      ArticlesSortProperty.alphabetical: (final context) =>
          NewsLocalizations.of(context).optionsArticlesSortPropertyAlphabetical,
      ArticlesSortProperty.byFeed: (final context) => NewsLocalizations.of(context).optionsArticlesSortPropertyFeed,
    },
  );

  late final articlesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: articlesCategory,
    key: NewsOptionKeys.articlesSortBoxOrder,
    label: (final context) => NewsLocalizations.of(context).optionsArticlesSortOrder,
    defaultValue: SortBoxOrder.descending,
    values: sortBoxOrderOptionValues,
  );

  late final foldersSortPropertyOption = SelectOption<FoldersSortProperty>(
    storage: super.storage,
    category: foldersCategory,
    key: NewsOptionKeys.foldersSortProperty,
    label: (final context) => NewsLocalizations.of(context).optionsFoldersSortProperty,
    defaultValue: FoldersSortProperty.alphabetical,
    values: {
      FoldersSortProperty.alphabetical: (final context) =>
          NewsLocalizations.of(context).optionsFoldersSortPropertyAlphabetical,
      FoldersSortProperty.unreadCount: (final context) =>
          NewsLocalizations.of(context).optionsFoldersSortPropertyUnreadCount,
    },
  );

  late final foldersSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: foldersCategory,
    key: NewsOptionKeys.foldersSortBoxOrder,
    label: (final context) => NewsLocalizations.of(context).optionsFoldersSortOrder,
    defaultValue: SortBoxOrder.ascending,
    values: sortBoxOrderOptionValues,
  );

  late final defaultFolderViewTypeOption = SelectOption<DefaultFolderViewType>(
    storage: super.storage,
    category: foldersCategory,
    key: NewsOptionKeys.defaultFolderViewType,
    label: (final context) => NewsLocalizations.of(context).optionsDefaultFolderViewType,
    defaultValue: DefaultFolderViewType.articles,
    values: {
      DefaultFolderViewType.articles: (final context) => NewsLocalizations.of(context).articles,
      DefaultFolderViewType.feeds: (final context) => NewsLocalizations.of(context).feeds,
    },
  );

  late final feedsSortPropertyOption = SelectOption<FeedsSortProperty>(
    storage: super.storage,
    category: feedsCategory,
    key: NewsOptionKeys.feedsSortProperty,
    label: (final context) => NewsLocalizations.of(context).optionsFeedsSortProperty,
    defaultValue: FeedsSortProperty.alphabetical,
    values: {
      FeedsSortProperty.alphabetical: (final context) =>
          NewsLocalizations.of(context).optionsFeedsSortPropertyAlphabetical,
      FeedsSortProperty.unreadCount: (final context) =>
          NewsLocalizations.of(context).optionsFeedsSortPropertyUnreadCount,
    },
  );

  late final feedsSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: feedsCategory,
    key: NewsOptionKeys.feedsSortBoxOrder,
    label: (final context) => NewsLocalizations.of(context).optionsFeedsSortOrder,
    defaultValue: SortBoxOrder.ascending,
    values: sortBoxOrderOptionValues,
  );
}

enum NewsOptionKeys implements Storable {
  defaultCategory._('default-category'),
  articleViewType._('article-view-type'),
  articleDisableMarkAsReadTimeout._('article-disable-mark-as-read-timeout'),
  defaultArticlesFilter._('default-articles-filter'),
  articlesSortProperty._('articles-sort-property'),
  articlesSortBoxOrder._('articles-sort-box-order'),
  foldersSortProperty._('folders-sort-property'),
  foldersSortBoxOrder._('folders-sort-box-order'),
  defaultFolderViewType._('default-folder-view-type'),
  feedsSortProperty._('feeds-sort-property'),
  feedsSortBoxOrder._('feeds-sort-box-order');

  const NewsOptionKeys._(this.value);

  @override
  final String value;
}

enum DefaultCategory {
  articles,
  folders,
  feeds,
}

enum ArticleViewType {
  direct,
  internalBrowser,
  externalBrowser,
}

enum ArticlesSortProperty {
  publishDate,
  alphabetical,
  byFeed,
}

enum FoldersSortProperty {
  alphabetical,
  unreadCount,
}

enum DefaultFolderViewType {
  articles,
  feeds,
}

enum FeedsSortProperty {
  alphabetical,
  unreadCount,
}
