part of '../app.dart';

class NewsFeedIcon extends StatelessWidget {
  const NewsFeedIcon({
    required this.feed,
    this.size = 48,
    super.key,
  });

  final NewsFeed feed;
  final double size;

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: ColoredBox(
          color: Colors.white,
          child: Center(
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
          ),
        ),
      );
}
