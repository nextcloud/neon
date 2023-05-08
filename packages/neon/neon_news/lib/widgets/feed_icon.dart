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
  Widget build(final BuildContext context) => NeonImageWrapper(
        color: Colors.white,
        size: Size.square(size),
        borderRadius: borderRadius,
        child: feed.faviconLink != null && feed.faviconLink != ''
            ? NeonCachedUrlImage(
                url: feed.faviconLink!,
                size: Size.square(size),
                iconColor: Theme.of(context).colorScheme.primary,
              )
            : Icon(
                Icons.rss_feed,
                size: size,
                color: Theme.of(context).colorScheme.primary,
              ),
      );
}
