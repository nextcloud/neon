part of '../app.dart';

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
  Widget build(final BuildContext context) => ImageWrapper(
        backgroundColor: Colors.white,
        width: size,
        height: size,
        borderRadius: borderRadius,
        child: feed.faviconLink != null && feed.faviconLink != ''
            ? CachedURLImage(
                url: feed.faviconLink!,
                requestManager: Provider.of<RequestManager>(context),
                client: RxBlocProvider.of<AccountsBloc>(context).activeAccount.value!.client,
                height: size,
                width: size,
              )
            : Icon(
                Icons.rss_feed,
                size: size,
                color: Theme.of(context).colorScheme.primary,
              ),
      );
}
