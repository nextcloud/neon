import 'dart:async';

import 'package:nextcloud/news.dart' as news;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  presets('news', 'news', (tester) {
    tearDown(() async {
      closeFixture();

      final feedsResponse = await tester.client.news.feeds.listFeeds();
      for (final feed in feedsResponse.body.feeds) {
        await tester.client.news.feeds.deleteFeed(feedId: feed.id);
      }

      final foldersResponse = await tester.client.news.folders.listFolders();
      for (final folder in foldersResponse.body.folders) {
        await tester.client.news.folders.deleteFolder(folderId: folder.id);
      }
    });

    Future<DynamiteResponse<news.ListFeeds, void>> addWikipediaFeed([int? folderID]) async =>
        tester.client.news.feeds.addFeed(
          url: '${tester.targetURL}/static/wikipedia.xml',
          folderId: folderID,
        );

    Future<DynamiteResponse<news.ListFeeds, void>> addNasaFeed() async => tester.client.news.feeds.addFeed(
          url: '${tester.targetURL}/static/nasa.xml',
        );

    test('Is supported', () async {
      final result = await tester.client.news.getVersionCheck();
      expect(result.versions, isNotNull);
      expect(result.versions, isNotEmpty);
      expect(result.isSupported, isTrue);
    });

    group('feed', () {
      test('Add feed', () async {
        var response = await tester.client.news.feeds.listFeeds();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.starredCount, 0);
        expect(response.body.newestItemId, null);
        expect(response.body.feeds, hasLength(0));

        response = await addWikipediaFeed();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.starredCount, null);
        expect(response.body.newestItemId, isNotNull);
        expect(response.body.feeds, hasLength(1));
        expect(response.body.feeds[0].url, '${tester.targetURL}/static/wikipedia.xml');

        response = await tester.client.news.feeds.listFeeds();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.starredCount, 0);
        expect(response.body.newestItemId, isNotNull);
        expect(response.body.feeds, hasLength(1));
        expect(response.body.feeds[0].url, '${tester.targetURL}/static/wikipedia.xml');
      });

      test('Add feed to folder', () async {
        final foldersResponse = await tester.client.news.folders.createFolder(name: 'test1');
        final response = await addWikipediaFeed(foldersResponse.body.folders[0].id);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.starredCount, null);
        expect(response.body.newestItemId, isNotNull);
        expect(response.body.feeds, hasLength(1));
        expect(response.body.feeds[0].folderId, isPositive);
        expect(response.body.feeds[0].url, '${tester.targetURL}/static/wikipedia.xml');
      });

      test('Delete feed', () async {
        var response = await addWikipediaFeed();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.feeds, hasLength(1));

        final deleteResponse = await tester.client.news.feeds.deleteFeed(feedId: response.body.feeds.single.id);
        expect(deleteResponse.statusCode, 200);
        expect(() => deleteResponse.body, isA<void>());
        expect(() => deleteResponse.headers, isA<void>());

        response = await tester.client.news.feeds.listFeeds();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.feeds, hasLength(0));
      });

      test('Rename feed', () async {
        var response = await addWikipediaFeed();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.feeds[0].title, 'Wikipedia featured articles feed');

        await tester.client.news.feeds.renameFeed(
          feedId: response.body.feeds[0].id,
          feedTitle: 'test1',
        );

        response = await tester.client.news.feeds.listFeeds();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.feeds[0].title, 'test1');
      });

      test('Mark feed as read', () async {
        final feedsResponse = await addWikipediaFeed();

        var response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items.length, greaterThan(0));

        await tester.client.news.feeds.markFeedAsRead(
          feedId: feedsResponse.body.feeds[0].id,
          newestItemId: feedsResponse.body.newestItemId!,
        );
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(0));
      });
    });

    group('folders', () {
      test('Move feed to folder', () async {
        var response = await tester.client.news.folders.createFolder(name: 'test1');
        expect(response.body.folders, hasLength(1));
        expect(response.body.folders[0].id, isPositive);
        expect(response.body.folders[0].name, 'test1');
        expect(response.body.folders[0].opened, true);
        // ignore: deprecated_member_use_from_same_package
        expect(response.body.folders[0].feeds, hasLength(0));

        final feedsResponse = await addWikipediaFeed();
        await tester.client.news.feeds.moveFeed(
          feedId: feedsResponse.body.feeds[0].id,
          folderId: response.body.folders[0].id,
        );

        response = await tester.client.news.folders.listFolders();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(1));
        expect(response.body.folders[0].id, isPositive);
        expect(response.body.folders[0].name, 'test1');
        expect(response.body.folders[0].opened, true);
        // ignore: deprecated_member_use_from_same_package
        expect(response.body.folders[0].feeds, hasLength(0));
      });

      test('Create folder', () async {
        var response = await tester.client.news.folders.listFolders();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(0));

        response = await tester.client.news.folders.createFolder(name: 'test1');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(1));
        expect(response.body.folders[0].id, isPositive);
        expect(response.body.folders[0].name, 'test1');
        expect(response.body.folders[0].opened, true);
        // ignore: deprecated_member_use_from_same_package
        expect(response.body.folders[0].feeds, hasLength(0));

        response = await tester.client.news.folders.listFolders();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(1));
        expect(response.body.folders[0].id, isPositive);
        expect(response.body.folders[0].name, 'test1');
        expect(response.body.folders[0].opened, true);
        // ignore: deprecated_member_use_from_same_package
        expect(response.body.folders[0].feeds, hasLength(0));
      });

      test('Delete folder', () async {
        var response = await tester.client.news.folders.createFolder(name: 'test1');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(1));

        final deleteResponse = await tester.client.news.folders.deleteFolder(folderId: response.body.folders.single.id);
        expect(deleteResponse.statusCode, 200);
        expect(() => deleteResponse.body, isA<void>());
        expect(() => deleteResponse.headers, isA<void>());

        response = await tester.client.news.folders.listFolders();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(0));
      });

      test('Rename folder', () async {
        var response = await tester.client.news.folders.createFolder(name: 'test1');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(1));

        final deleteResponse = await tester.client.news.folders.renameFolder(
          folderId: response.body.folders.single.id,
          name: 'test2',
        );
        expect(deleteResponse.statusCode, 200);
        expect(() => deleteResponse.body, isA<void>());
        expect(() => deleteResponse.headers, isA<void>());

        response = await tester.client.news.folders.listFolders();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(1));
        expect(response.body.folders.single.name, 'test2');
      });

      test('List folders', () async {
        var response = await tester.client.news.folders.listFolders();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(0));

        await tester.client.news.folders.createFolder(name: 'test1');
        await tester.client.news.folders.createFolder(name: 'test2');

        response = response = await tester.client.news.folders.listFolders();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.folders, hasLength(2));
        expect(response.body.folders[0].id, isPositive);
        expect(response.body.folders[0].name, 'test1');
        expect(response.body.folders[0].opened, true);
        // ignore: deprecated_member_use_from_same_package
        expect(response.body.folders[0].feeds, hasLength(0));
        expect(response.body.folders[1].id, isPositive);
        expect(response.body.folders[1].name, 'test2');
        expect(response.body.folders[1].opened, true);
        // ignore: deprecated_member_use_from_same_package
        expect(response.body.folders[1].feeds, hasLength(0));
      });

      test('Mark folder as read', () async {
        final foldersResponse = await tester.client.news.folders.createFolder(name: 'test1');
        final feedsResponse = await addWikipediaFeed(foldersResponse.body.folders[0].id);

        var response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items.length, greaterThan(0));

        await tester.client.news.folders.markFolderAsRead(
          folderId: foldersResponse.body.folders[0].id,
          newestItemId: feedsResponse.body.newestItemId!,
        );

        response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(0));
      });
    });

    group('items', () {
      test('List articles', () async {
        var response = await tester.client.news.items.listArticles();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(0));

        await addWikipediaFeed();

        response = await tester.client.news.items.listArticles();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items.length, greaterThan(0));
        expect(response.body.items[0].body, isNotNull);
        expect(response.body.items[0].feedId, isPositive);
        expect(response.body.items[0].unread, true);
        expect(response.body.items[0].starred, false);
      });

      test('List updated articles', () async {
        // Testing this is not easy, because we can't depend on an external source to update the feed
        // Therefore we just add a second feed and check that the articles returned after a certain modified timestamp
        // are exactly those of the new feed.
        // Now that I think of it, maybe we could host our own feed and update that way, but this works for now.

        await addWikipediaFeed();

        var response = await tester.client.news.items.listArticles();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        final wikipediaArticles = response.body.items.length;
        expect(wikipediaArticles, greaterThan(0));

        await addNasaFeed();

        response = await tester.client.news.items.listArticles();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        final nasaArticles = response.body.items.length - wikipediaArticles;
        expect(nasaArticles, greaterThan(0));

        response = await tester.client.news.items.listUpdatedArticles(
          lastModified: response.body.items[response.body.items.length - 1 - nasaArticles].lastModified,
        );
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(nasaArticles));
      });

      test('Mark article as read', () async {
        await addWikipediaFeed();

        var response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        final unreadArticles = response.body.items.length;
        expect(unreadArticles, greaterThan(0));

        await tester.client.news.items.markArticleAsRead(
          itemId: response.body.items[0].id,
        );
        response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(unreadArticles - 1));
      });

      test('Mark article as unread', () async {
        await addWikipediaFeed();

        var response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        final readArticle = response.body.items[0];
        await tester.client.news.items.markArticleAsRead(itemId: readArticle.id);
        response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        final unreadArticles = response.body.items.length;
        expect(unreadArticles, greaterThan(0));

        await tester.client.news.items.markArticleAsUnread(itemId: readArticle.id);
        response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(unreadArticles + 1));
      });

      test('Mark multiple articles as read and unread', () async {
        await addWikipediaFeed();
        var response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        final unreadArticles = response.body.items;
        expect(unreadArticles, isNotEmpty);

        await tester.client.news.items.readMultipleArticles(
          $body: news.ReadMultipleArticlesRequestApplicationJson((b) {
            b.itemIds.addAll(unreadArticles.map((a) => a.id));
          }),
        );

        response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.body.items, isEmpty);

        await tester.client.news.items.unreadMultipleArticles(
          $body: news.UnreadMultipleArticlesRequestApplicationJson((b) {
            b.itemIds.addAll(unreadArticles.map((a) => a.id));
          }),
        );

        response = await tester.client.news.items.listArticles(type: news.ListType.unread.index);
        expect(response.body.items, hasLength(unreadArticles.length));
      });

      test('Star article', () async {
        await addWikipediaFeed();

        var response = await tester.client.news.items.listArticles(type: news.ListType.starred.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        final starredArticles = response.body.items.length;
        expect(starredArticles, 0);

        response = await tester.client.news.items.listArticles();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        await tester.client.news.items.starArticle(
          itemId: response.body.items[0].id,
        );
        response = await tester.client.news.items.listArticles(type: news.ListType.starred.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(1));
      });

      test('Unstar article', () async {
        await addWikipediaFeed();

        var response = await tester.client.news.items.listArticles();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        final item = response.body.items[0];

        await tester.client.news.items.starArticle(
          itemId: item.id,
        );
        response = await tester.client.news.items.listArticles(type: news.ListType.starred.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(1));

        await tester.client.news.items.unstarArticle(
          itemId: item.id,
        );
        response = await tester.client.news.items.listArticles(type: news.ListType.starred.index);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.items, hasLength(0));
      });

      test('Star and Unstar multiple articles', () async {
        await addWikipediaFeed();
        var response = await tester.client.news.items.listArticles(type: news.ListType.allItems.index);
        final allIDs = response.body.items.map((e) => e.id);
        response = await tester.client.news.items.listArticles(type: news.ListType.starred.index);
        expect(response.body.items, isEmpty);

        await tester.client.news.items.starMultipleArticles(
          $body: news.StarMultipleArticlesRequestApplicationJson((b) {
            b.itemIds.addAll(allIDs);
          }),
        );
        response = await tester.client.news.items.listArticles(type: news.ListType.starred.index);
        expect(response.body.items, isNotEmpty);

        await tester.client.news.items.unstarMultipleArticles(
          $body: news.UnstarMultipleArticlesRequestApplicationJson((b) {
            b.itemIds.addAll(allIDs);
          }),
        );
        response = await tester.client.news.items.listArticles(type: news.ListType.starred.index);
        expect(response.body.items, isEmpty);
      });
    });
  });
}
