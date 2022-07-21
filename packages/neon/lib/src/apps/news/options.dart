part of 'app.dart';

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
      ArticleViewType.direct: (final context) => AppLocalizations.of(context).newsOptionsArticleViewTypeDirect,
      if (platform.canUseWebView) ...{
        ArticleViewType.internalBrowser: (final context) =>
            AppLocalizations.of(context).newsOptionsArticleViewTypeInternalBrowser,
      },
      ArticleViewType.externalBrowser: (final context) =>
          AppLocalizations.of(context).newsOptionsArticleViewTypeExternalBrowser,
    });
  }

  final _articleViewTypeValuesSubject = BehaviorSubject<Map<ArticleViewType, String Function(BuildContext)>>();

  final generalCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).optionsCategoryGeneral,
  );

  final articlesCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).newsArticles,
  );

  final foldersCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).newsFolders,
  );

  final feedsCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).newsFeeds,
  );

  late final defaultCategoryOption = SelectOption<DefaultCategory>(
    storage: super.storage,
    category: generalCategory,
    key: 'default-category',
    label: (final context) => AppLocalizations.of(context).newsOptionsDefaultCategory,
    defaultValue: BehaviorSubject.seeded(DefaultCategory.articles),
    values: BehaviorSubject.seeded({
      DefaultCategory.articles: (final context) => AppLocalizations.of(context).newsArticles,
      DefaultCategory.folders: (final context) => AppLocalizations.of(context).newsFolders,
      DefaultCategory.feeds: (final context) => AppLocalizations.of(context).newsFeeds,
    }),
  );

  late final articleViewTypeOption = SelectOption<ArticleViewType>(
    storage: super.storage,
    category: articlesCategory,
    key: 'article-view-type',
    label: (final context) => AppLocalizations.of(context).newsOptionsArticleViewType,
    defaultValue: BehaviorSubject.seeded(ArticleViewType.direct),
    values: _articleViewTypeValuesSubject,
  );

  late final defaultArticlesFilterOption = SelectOption<FilterType>(
    storage: super.storage,
    category: articlesCategory,
    key: 'default-articles-filter',
    label: (final context) => AppLocalizations.of(context).newsOptionsDefaultArticlesFilter,
    defaultValue: BehaviorSubject.seeded(FilterType.unread),
    values: BehaviorSubject.seeded({
      FilterType.all: (final context) => AppLocalizations.of(context).newsFilterAll,
      FilterType.unread: (final context) => AppLocalizations.of(context).newsFilterUnread,
      FilterType.starred: (final context) => AppLocalizations.of(context).newsFilterStarred,
    }),
  );

  late final articlesSortPropertyOption = SelectOption<ArticlesSortProperty>(
    storage: super.storage,
    category: articlesCategory,
    key: 'articles-sort-property',
    label: (final context) => AppLocalizations.of(context).newsOptionsArticlesSortProperty,
    defaultValue: BehaviorSubject.seeded(ArticlesSortProperty.publishDate),
    values: BehaviorSubject.seeded({
      ArticlesSortProperty.publishDate: (final context) =>
          AppLocalizations.of(context).newsOptionsArticlesSortPropertyPublishDate,
      ArticlesSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).newsOptionsArticlesSortPropertyAlphabetical,
      ArticlesSortProperty.byFeed: (final context) => AppLocalizations.of(context).newsOptionsArticlesSortPropertyFeed,
    }),
  );

  late final articlesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: articlesCategory,
    key: 'articles-sort-box-order',
    label: (final context) => AppLocalizations.of(context).newsOptionsArticlesSortOrder,
    defaultValue: BehaviorSubject.seeded(SortBoxOrder.descending),
    values: BehaviorSubject.seeded(sortBoxOrderOptionValues),
  );

  late final foldersSortPropertyOption = SelectOption<FoldersSortProperty>(
    storage: super.storage,
    category: foldersCategory,
    key: 'folders-sort-property',
    label: (final context) => AppLocalizations.of(context).newsOptionsFoldersSortProperty,
    defaultValue: BehaviorSubject.seeded(FoldersSortProperty.alphabetical),
    values: BehaviorSubject.seeded({
      FoldersSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).newsOptionsFoldersSortPropertyAlphabetical,
      FoldersSortProperty.unreadCount: (final context) =>
          AppLocalizations.of(context).newsOptionsFoldersSortPropertyUnreadCount,
    }),
  );

  late final foldersSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: foldersCategory,
    key: 'folders-sort-box-order',
    label: (final context) => AppLocalizations.of(context).newsOptionsFoldersSortOrder,
    defaultValue: BehaviorSubject.seeded(SortBoxOrder.ascending),
    values: BehaviorSubject.seeded(sortBoxOrderOptionValues),
  );

  late final defaultFolderViewTypeOption = SelectOption<DefaultFolderViewType>(
    storage: super.storage,
    category: foldersCategory,
    key: 'default-folder-view-type',
    label: (final context) => AppLocalizations.of(context).newsOptionsDefaultFolderViewType,
    defaultValue: BehaviorSubject.seeded(DefaultFolderViewType.articles),
    values: BehaviorSubject.seeded({
      DefaultFolderViewType.articles: (final context) => AppLocalizations.of(context).newsArticles,
      DefaultFolderViewType.feeds: (final context) => AppLocalizations.of(context).newsFeeds,
    }),
  );

  late final feedsSortPropertyOption = SelectOption<FeedsSortProperty>(
    storage: super.storage,
    category: feedsCategory,
    key: 'feeds-sort-property',
    label: (final context) => AppLocalizations.of(context).newsOptionsFeedsSortProperty,
    defaultValue: BehaviorSubject.seeded(FeedsSortProperty.alphabetical),
    values: BehaviorSubject.seeded({
      FeedsSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).newsOptionsFeedsSortPropertyAlphabetical,
      FeedsSortProperty.unreadCount: (final context) =>
          AppLocalizations.of(context).newsOptionsFeedsSortPropertyUnreadCount,
    }),
  );

  late final feedsSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: feedsCategory,
    key: 'feeds-sort-box-order',
    label: (final context) => AppLocalizations.of(context).newsOptionsFeedsSortOrder,
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
