part of '../neon_news.dart';

class NewsFeedIcon extends StatelessWidget {
  const NewsFeedIcon({
    required this.feed,
    this.size = 48,
    this.borderRadius,
    super.key,
  });

  final NewsFeed feed;
  final double size;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) {
    final faviconLink = feed.faviconLink;

    return NeonImageWrapper(
      color: Colors.white,
      size: Size.square(size),
      borderRadius: borderRadius,
      child: faviconLink != null && faviconLink.isNotEmpty
          ? NeonCachedImage.url(
              url: faviconLink,
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
}
