import 'package:flutter/material.dart';
import 'package:neon/theme.dart';
import 'package:neon/widgets.dart';
import 'package:nextcloud/news.dart' as news;

class NewsFeedIcon extends StatelessWidget {
  const NewsFeedIcon({
    required this.feed,
    this.size = largeIconSize,
    this.borderRadius,
    super.key,
  });

  final news.Feed feed;
  final double size;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) {
    final faviconLink = feed.faviconLink;

    return NeonImageWrapper(
      size: Size.square(size),
      borderRadius: borderRadius,
      child: faviconLink != null && faviconLink.isNotEmpty
          ? NeonUrlImage(
              url: faviconLink,
              size: Size.square(size),
            )
          : Icon(
              Icons.rss_feed,
              size: size,
              color: Theme.of(context).colorScheme.primary,
            ),
    );
  }
}
