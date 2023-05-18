import 'localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get close => 'Close';

  @override
  String get delete => 'Delete';

  @override
  String get remove => 'Remove';

  @override
  String get rename => 'Rename';

  @override
  String get move => 'Move';

  @override
  String get general => 'General';

  @override
  String get addFeed => 'Add feed';

  @override
  String get folder => 'Folder';

  @override
  String get folderRoot => 'Root Folder';

  @override
  String get createFolder => 'Create folder';

  @override
  String get createFolderName => 'Folder name';

  @override
  String deleteFolderConfirm(String name) {
    return 'Are you sure you want to delete the folder \'$name\'?';
  }

  @override
  String get renameFolder => 'Rename folder';

  @override
  String removeFeedConfirm(String name) {
    return 'Are you sure you want to remove the feed \'$name\'?';
  }

  @override
  String get moveFeed => 'Move feed';

  @override
  String get renameFeed => 'Rename feed';

  @override
  String get articles => 'Articles';

  @override
  String get folders => 'Folders';

  @override
  String get feeds => 'Feeds';

  @override
  String get filterAll => 'All';

  @override
  String get filterUnread => 'Unread';

  @override
  String get filterStarred => 'Starred';

  @override
  String unreadArticles(int count) {
    return '$count unread';
  }

  @override
  String get articleStar => 'Star article';

  @override
  String get articleUnstar => 'Unstar article';

  @override
  String get articleMarkRead => 'Mark article as read';

  @override
  String get articleMarkUnread => 'Mark article as unread';

  @override
  String get articleOpenLink => 'Open in browser';

  @override
  String get articleShare => 'Share';

  @override
  String get showFeedURL => 'Show URL';

  @override
  String get copyFeedURL => 'Copy URL';

  @override
  String get copiedFeedURL => 'URL copied to clipboard';

  @override
  String get showFeedErrorMessage => 'Show error message';

  @override
  String get copyFeedErrorMessage => 'Copy error message';

  @override
  String get copiedFeedErrorMessage => 'Error message copied to clipboard';

  @override
  String get optionsDefaultCategory => 'Category to show by default';

  @override
  String get optionsArticleViewType => 'How to open article';

  @override
  String get optionsArticleViewTypeDirect => 'Show text directly';

  @override
  String get optionsArticleViewTypeInternalBrowser => 'Open in internal browser';

  @override
  String get optionsArticleViewTypeExternalBrowser => 'Open in external browser';

  @override
  String get optionsArticleDisableMarkAsReadTimeout => 'Mark articles as read instantly';

  @override
  String get optionsDefaultArticlesFilter => 'Articles to show by default';

  @override
  String get optionsArticlesSortProperty => 'How to sort articles';

  @override
  String get optionsArticlesSortPropertyPublishDate => 'Publish date';

  @override
  String get optionsArticlesSortPropertyAlphabetical => 'Alphabetical';

  @override
  String get optionsArticlesSortPropertyFeed => 'Feed';

  @override
  String get optionsArticlesSortOrder => 'Sort order of articles';

  @override
  String get optionsFeedsSortProperty => 'How to sort feeds';

  @override
  String get optionsFeedsSortPropertyAlphabetical => 'Alphabetical';

  @override
  String get optionsFeedsSortPropertyUnreadCount => 'Unread count';

  @override
  String get optionsFeedsSortOrder => 'Sort order of feeds';

  @override
  String get optionsFoldersSortProperty => 'How to sort folders';

  @override
  String get optionsFoldersSortPropertyAlphabetical => 'Alphabetical';

  @override
  String get optionsFoldersSortPropertyUnreadCount => 'Unread count';

  @override
  String get optionsFoldersSortOrder => 'Sort order of folders';

  @override
  String get optionsDefaultFolderViewType => 'What should be shown first when opening a folder';
}
