part of '../neon_news.dart';

class NewsFeedIcon extends StatelessWidget {
  const NewsFeedIcon({
    required this.feed,
    this.icon = 48,
    this.borderRadius,
    super.key,
  });

  final NextcloudNewsFeed feed;
  final double icon;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) => NeonImageWrapper(
        color: Colors.white,
        size: Size.square(icon),
        borderRadius: borderRadius,
        child: feed.faviconLink != null && feed.faviconLink != ''
            ? NeonCachedUrlImage(
                url: feed.faviconLink!,
                size: Size.square(icon),
                iconColor: Theme.of(context).colorScheme.primary,
              )
            : Icon(
                Icons.rss_feed,
                size: icon,
                color: Theme.of(context).colorScheme.primary,
              ),
      );
}
