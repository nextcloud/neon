part of 'neon_news.dart';

class NewsAppSpecificOptions extends NextcloudAppSpecificOptions {
  NewsAppSpecificOptions(super.storage, final NeonPlatform platform) {
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

    _articleViewTypeValuesSubject.add({
      ArticleViewType.direct: (final context) => AppLocalizations.of(context).optionsArticleViewTypeDirect,
      if (platform.canUseWebView) ...{
        ArticleViewType.internalBrowser: (final context) =>
            AppLocalizations.of(context).optionsArticleViewTypeInternalBrowser,
      },
      ArticleViewType.externalBrowser: (final context) =>
          AppLocalizations.of(context).optionsArticleViewTypeExternalBrowser,
    });
  }

  final _articleViewTypeValuesSubject = BehaviorSubject<Map<ArticleViewType, String Function(BuildContext)>>();

  final generalCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).general,
  );

  final articlesCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).articles,
  );

  final foldersCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).folders,
  );

  final feedsCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).feeds,
  );

  late final defaultCategoryOption = SelectOption<DefaultCategory>(
    storage: super.storage,
    category: generalCategory,
    key: 'default-category',
    label: (final context) => AppLocalizations.of(context).optionsDefaultCategory,
    defaultValue: BehaviorSubject.seeded(DefaultCategory.articles),
    values: BehaviorSubject.seeded({
      DefaultCategory.articles: (final context) => AppLocalizations.of(context).articles,
      DefaultCategory.folders: (final context) => AppLocalizations.of(context).folders,
      DefaultCategory.feeds: (final context) => AppLocalizations.of(context).feeds,
    }),
  );

  late final articleViewTypeOption = SelectOption<ArticleViewType>(
    storage: super.storage,
    category: articlesCategory,
    key: 'article-view-type',
    label: (final context) => AppLocalizations.of(context).optionsArticleViewType,
    defaultValue: BehaviorSubject.seeded(ArticleViewType.direct),
    values: _articleViewTypeValuesSubject,
  );

  late final articleDisableMarkAsReadTimeoutOption = ToggleOption(
    storage: super.storage,
    category: articlesCategory,
    key: 'article-disable-mark-as-read-timeout',
    label: (final context) => AppLocalizations.of(context).optionsArticleDisableMarkAsReadTimeout,
    defaultValue: BehaviorSubject.seeded(false),
  );

  late final defaultArticlesFilterOption = SelectOption<FilterType>(
    storage: super.storage,
    category: articlesCategory,
    key: 'default-articles-filter',
    label: (final context) => AppLocalizations.of(context).optionsDefaultArticlesFilter,
    defaultValue: BehaviorSubject.seeded(FilterType.unread),
    values: BehaviorSubject.seeded({
      FilterType.all: (final context) => AppLocalizations.of(context).filterAll,
      FilterType.unread: (final context) => AppLocalizations.of(context).filterUnread,
      FilterType.starred: (final context) => AppLocalizations.of(context).filterStarred,
    }),
  );

  late final articlesSortPropertyOption = SelectOption<ArticlesSortProperty>(
    storage: super.storage,
    category: articlesCategory,
    key: 'articles-sort-property',
    label: (final context) => AppLocalizations.of(context).optionsArticlesSortProperty,
    defaultValue: BehaviorSubject.seeded(ArticlesSortProperty.publishDate),
    values: BehaviorSubject.seeded({
      ArticlesSortProperty.publishDate: (final context) =>
          AppLocalizations.of(context).optionsArticlesSortPropertyPublishDate,
      ArticlesSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).optionsArticlesSortPropertyAlphabetical,
      ArticlesSortProperty.byFeed: (final context) => AppLocalizations.of(context).optionsArticlesSortPropertyFeed,
    }),
  );

  late final articlesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: articlesCategory,
    key: 'articles-sort-box-order',
    label: (final context) => AppLocalizations.of(context).optionsArticlesSortOrder,
    defaultValue: BehaviorSubject.seeded(SortBoxOrder.descending),
    values: BehaviorSubject.seeded(sortBoxOrderOptionValues),
  );

  late final foldersSortPropertyOption = SelectOption<FoldersSortProperty>(
    storage: super.storage,
    category: foldersCategory,
    key: 'folders-sort-property',
    label: (final context) => AppLocalizations.of(context).optionsFoldersSortProperty,
    defaultValue: BehaviorSubject.seeded(FoldersSortProperty.alphabetical),
    values: BehaviorSubject.seeded({
      FoldersSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).optionsFoldersSortPropertyAlphabetical,
      FoldersSortProperty.unreadCount: (final context) =>
          AppLocalizations.of(context).optionsFoldersSortPropertyUnreadCount,
    }),
  );

  late final foldersSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: foldersCategory,
    key: 'folders-sort-box-order',
    label: (final context) => AppLocalizations.of(context).optionsFoldersSortOrder,
    defaultValue: BehaviorSubject.seeded(SortBoxOrder.ascending),
    values: BehaviorSubject.seeded(sortBoxOrderOptionValues),
  );

  late final defaultFolderViewTypeOption = SelectOption<DefaultFolderViewType>(
    storage: super.storage,
    category: foldersCategory,
    key: 'default-folder-view-type',
    label: (final context) => AppLocalizations.of(context).optionsDefaultFolderViewType,
    defaultValue: BehaviorSubject.seeded(DefaultFolderViewType.articles),
    values: BehaviorSubject.seeded({
      DefaultFolderViewType.articles: (final context) => AppLocalizations.of(context).articles,
      DefaultFolderViewType.feeds: (final context) => AppLocalizations.of(context).feeds,
    }),
  );

  late final feedsSortPropertyOption = SelectOption<FeedsSortProperty>(
    storage: super.storage,
    category: feedsCategory,
    key: 'feeds-sort-property',
    label: (final context) => AppLocalizations.of(context).optionsFeedsSortProperty,
    defaultValue: BehaviorSubject.seeded(FeedsSortProperty.alphabetical),
    values: BehaviorSubject.seeded({
      FeedsSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).optionsFeedsSortPropertyAlphabetical,
      FeedsSortProperty.unreadCount: (final context) =>
          AppLocalizations.of(context).optionsFeedsSortPropertyUnreadCount,
    }),
  );

  late final feedsSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: feedsCategory,
    key: 'feeds-sort-box-order',
    label: (final context) => AppLocalizations.of(context).optionsFeedsSortOrder,
    defaultValue: BehaviorSubject.seeded(SortBoxOrder.ascending),
    values: BehaviorSubject.seeded(sortBoxOrderOptionValues),
  );
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
