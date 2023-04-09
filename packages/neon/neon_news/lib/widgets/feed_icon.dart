part of '../neon_news.dart';

class NewsFeedIcon extends StatelessWidget {
  const NewsFeedIcon({
    required this.feed,
    this.size = 48,
    this.borderRadius,
    super.key,
  });

  final NextcloudNewsFeed feed;
  final double size;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) => ImageWrapper(
        color: Colors.white,
        width: size,
        height: size,
        borderRadius: borderRadius,
        child: feed.faviconLink != null && feed.faviconLink != ''
            ? CachedURLImage(
                url: feed.faviconLink!,
                height: size,
                width: size,
                iconColor: Theme.of(context).colorScheme.primary,
              )
            : Icon(
                Icons.rss_feed,
                size: size,
                color: Theme.of(context).colorScheme.primary,
              ),
      );
}
