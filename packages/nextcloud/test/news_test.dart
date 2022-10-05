import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

const wikipediaFeedURL = 'https://en.wikipedia.org/w/api.php?action=featuredfeed&feed=featured&feedformat=atom';
const nasaFeedURL = 'https://www.nasa.gov/rss/dyn/breaking_news.rss';

Future main() async {
  final dockerImageName = await TestHelper.prepareDockerImage(apps: ['news']);

  group('news', () {
    late TestNextcloudClient client;
    setUp(() async => client = await TestHelper.getPreparedClient(dockerImageName));
    tearDown(() => client.destroy());

    Future<NewsListFeeds> addWikipediaFeed([final int? folderID]) => client.news.addFeed(
          url: wikipediaFeedURL,
          folderId: folderID,
        );

    Future<NewsListFeeds> addNasaFeed() => client.news.addFeed(
          url: nasaFeedURL,
        );

    test('Is supported', () async {
      final response = await client.news.isSupported();
      expect(response, isTrue);
    });

    test('Add feed', () async {
      var response = await client.news.listFeeds();
      expect(response.starredCount, 0);
      expect(response.newestItemId, null);
      expect(response.feeds, hasLength(0));

      response = await addWikipediaFeed();
      expect(response.starredCount, null);
      expect(response.newestItemId, isNotNull);
      expect(response.feeds, hasLength(1));
      expect(response.feeds![0].url, wikipediaFeedURL);

      response = await client.news.listFeeds();
      expect(response.starredCount, 0);
      expect(response.newestItemId, isNotNull);
      expect(response.feeds, hasLength(1));
      expect(response.feeds![0].url, wikipediaFeedURL);
    });

    test('Mark feed as read', () async {
      final feedsResponse = await addWikipediaFeed();

      var articlesResponse = await client.news.listArticles(type: NewsListType.unread.code);
      expect(articlesResponse.items!.length, greaterThan(0));

      await client.news.markFeedAsRead(
        feedId: feedsResponse.feeds![0].id!,
        newestItemId: feedsResponse.newestItemId!,
      );

      articlesResponse = await client.news.listArticles(type: NewsListType.unread.code);
      expect(articlesResponse.items, hasLength(0));
    });

    test('List articles', () async {
      var response = await client.news.listArticles();
      expect(response.items, hasLength(0));

      await addWikipediaFeed();

      response = await client.news.listArticles();
      expect(response.items!.length, greaterThan(0));
      expect(response.items![0].body, isNotNull);
      expect(response.items![0].feedId, 1);
      expect(response.items![0].unread, true);
      expect(response.items![0].starred, false);
    });

    test('List updated articles', () async {
      // Testing this is not easy, because we can't depend on an external source to update the feed
      // Therefore we just add a second feed and check that the articles returned after a certain modified timestamp
      // are exactly those of the new feed.
      // Now that I think of it, maybe we could host our own feed and update that way, but this works for now.

      await addWikipediaFeed();

      var response = await client.news.listArticles();
      final wikipediaArticles = response.items!.length;
      expect(wikipediaArticles, greaterThan(0));

      await addNasaFeed();

      response = await client.news.listArticles();
      final nasaArticles = response.items!.length - wikipediaArticles;
      expect(nasaArticles, greaterThan(0));

      response = await client.news.listUpdatedArticles(
        lastModified: response.items![response.items!.length - 1 - nasaArticles].lastModified!,
      );
      expect(response.items, hasLength(nasaArticles));
    });

    test('Mark article as read', () async {
      await addWikipediaFeed();

      var response = await client.news.listArticles(type: NewsListType.unread.code);
      final unreadArticles = response.items!.length;
      expect(unreadArticles, greaterThan(0));

      await client.news.markArticleAsRead(
        itemId: response.items![0].id!,
      );
      response = await client.news.listArticles(type: NewsListType.unread.code);
      expect(response.items, hasLength(unreadArticles - 1));
    });

    test('Mark article as unread', () async {
      await addWikipediaFeed();

      var response = await client.news.listArticles(type: NewsListType.unread.code);
      final readArticle = response.items![0];
      await client.news.markArticleAsRead(itemId: readArticle.id!);
      response = await client.news.listArticles(type: NewsListType.unread.code);
      final unreadArticles = response.items!.length;
      expect(unreadArticles, greaterThan(0));

      await client.news.markArticleAsUnread(itemId: readArticle.id!);
      response = await client.news.listArticles(type: NewsListType.unread.code);
      expect(response.items, hasLength(unreadArticles + 1));
    });

    test('Star article', () async {
      await addWikipediaFeed();

      var response = await client.news.listArticles(type: NewsListType.starred.code);
      final starredArticles = response.items!.length;
      expect(starredArticles, 0);

      response = await client.news.listArticles();
      await client.news.starArticle(
        itemId: response.items![0].id!,
      );
      response = await client.news.listArticles(type: NewsListType.starred.code);
      expect(response.items, hasLength(1));
    });

    test('Unstar article', () async {
      await addWikipediaFeed();

      var response = await client.news.listArticles();
      final item = response.items![0];

      await client.news.starArticle(
        itemId: item.id!,
      );
      response = await client.news.listArticles(type: NewsListType.starred.code);
      expect(response.items, hasLength(1));

      await client.news.unstarArticle(
        itemId: item.id!,
      );
      response = await client.news.listArticles(type: NewsListType.starred.code);
      expect(response.items, hasLength(0));
    });

    test('Create folder', () async {
      var response = await client.news.listFolders();
      expect(response.folders, hasLength(0));

      response = await client.news.createFolder(name: 'test1');
      expect(response.folders, hasLength(1));
      expect(response.folders![0].id, 1);
      expect(response.folders![0].name, 'test1');
      expect(response.folders![0].opened, true);
      expect(response.folders![0].feeds, hasLength(0));

      response = await client.news.listFolders();
      expect(response.folders, hasLength(1));
      expect(response.folders![0].id, 1);
      expect(response.folders![0].name, 'test1');
      expect(response.folders![0].opened, true);
      expect(response.folders![0].feeds, hasLength(0));
    });

    test('List folders', () async {
      var response = await client.news.listFolders();
      expect(response.folders, hasLength(0));

      await client.news.createFolder(name: 'test1');
      await client.news.createFolder(name: 'test2');

      response = response = await client.news.listFolders();
      expect(response.folders, hasLength(2));
      expect(response.folders![0].id, 1);
      expect(response.folders![0].name, 'test1');
      expect(response.folders![0].opened, true);
      expect(response.folders![0].feeds, hasLength(0));
      expect(response.folders![1].id, 2);
      expect(response.folders![1].name, 'test2');
      expect(response.folders![1].opened, true);
      expect(response.folders![1].feeds, hasLength(0));
    });

    test('Add feed to folder', () async {
      await client.news.createFolder(name: 'test1');
      final response = await addWikipediaFeed(1);
      expect(response.starredCount, null);
      expect(response.newestItemId, isNotNull);
      expect(response.feeds, hasLength(1));
      expect(response.feeds![0].folderId, 1);
      expect(response.feeds![0].url, wikipediaFeedURL);
    });

    test('Mark folder as read', () async {
      final foldersResponse = await client.news.createFolder(name: 'test1');
      final feedsResponse = await addWikipediaFeed(1);

      var articlesResponse = await client.news.listArticles(type: NewsListType.unread.code);
      expect(articlesResponse.items!.length, greaterThan(0));

      await client.news.markFolderAsRead(
        folderId: foldersResponse.folders![0].id!,
        newestItemId: feedsResponse.newestItemId!,
      );

      articlesResponse = await client.news.listArticles(type: NewsListType.unread.code);
      expect(articlesResponse.items, hasLength(0));
    });
  });
}
