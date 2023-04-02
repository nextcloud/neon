part of '../app.dart';

class NewsArticlePage extends StatefulWidget {
  const NewsArticlePage({
    required this.bloc,
    required this.articlesBloc,
    required this.useWebView,
    this.bodyData,
    this.url,
    super.key,
  })  : assert(useWebView || bodyData != null, 'bodyData has to be set when not using a WebView'),
        assert(!useWebView || url != null, 'url has to be set when using a WebView');

  final NewsArticleBloc bloc;
  final NewsArticlesBloc articlesBloc;
  final bool useWebView;
  final String? bodyData;
  final String? url;

  @override
  State<NewsArticlePage> createState() => _NewsArticlePageState();
}

class _NewsArticlePageState extends State<NewsArticlePage> {
  WebViewController? _webviewController;
  Timer? _markAsReadTimer;

  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      ExceptionWidget.showSnackbar(context, error);
    });

    WidgetsBinding.instance.addPostFrameCallback((final _) async {
      if (Provider.of<NeonPlatform>(context, listen: false).canUseWakelock) {
        await Wakelock.enable();
      }
    });

    if (!widget.useWebView) {
      unawaited(_startMarkAsReadTimer());
    }
  }

  @override
  void dispose() {
    _cancelMarkAsReadTimer();

    super.dispose();
  }

  Future _startMarkAsReadTimer() async {
    if (await widget.bloc.unread.first) {
      if (widget.articlesBloc.options.articleDisableMarkAsReadTimeoutOption.value) {
        widget.bloc.markArticleAsRead();
      } else {
        _markAsReadTimer = Timer(const Duration(seconds: 3), () async {
          if (await widget.bloc.unread.first) {
            widget.bloc.markArticleAsRead();
          }
        });
      }
    }
  }

  void _cancelMarkAsReadTimer() {
    if (_markAsReadTimer != null) {
      _markAsReadTimer!.cancel();
      _markAsReadTimer = null;
    }
  }

  Future<String> _getURL() async {
    if (_webviewController != null) {
      return (await _webviewController!.currentUrl())!;
    }

    return widget.url!;
  }

  @override
  Widget build(final BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (_webviewController != null && await _webviewController!.canGoBack()) {
            await _webviewController!.goBack();
            return false;
          }

          if (mounted && Provider.of<NeonPlatform>(context, listen: false).canUseWakelock) {
            await Wakelock.disable();
          }
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              StreamBuilder<bool>(
                stream: widget.bloc.starred,
                builder: (final context, final starredSnapshot) {
                  final starred = starredSnapshot.data ?? false;
                  return IconButton(
                    onPressed: () async {
                      if (starred) {
                        widget.bloc.unstarArticle();
                      } else {
                        widget.bloc.starArticle();
                      }
                    },
                    icon: Icon(starred ? Icons.star : Icons.star_outline),
                  );
                },
              ),
              StreamBuilder<bool>(
                stream: widget.bloc.unread,
                builder: (final context, final unreadSnapshot) {
                  final unread = unreadSnapshot.data ?? false;
                  return IconButton(
                    onPressed: () async {
                      if (unread) {
                        widget.bloc.markArticleAsRead();
                      } else {
                        widget.bloc.markArticleAsUnread();
                      }
                    },
                    icon: Icon(unread ? MdiIcons.email : MdiIcons.emailMarkAsUnread),
                  );
                },
              ),
              if (widget.url != null) ...[
                IconButton(
                  onPressed: () async {
                    await launchUrlString(
                      await _getURL(),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  icon: const Icon(Icons.open_in_new),
                ),
                IconButton(
                  onPressed: () async {
                    await Share.share(await _getURL());
                  },
                  icon: const Icon(Icons.share),
                ),
              ],
            ],
          ),
          body: widget.useWebView
              ? WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (final controller) async {
                    _webviewController = controller;
                    await controller.loadUrl(widget.url!);
                  },
                  onPageFinished: (final _) async {
                    await _startMarkAsReadTimer();
                  },
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Html(
                    data: widget.bodyData,
                    onLinkTap: (
                      final url,
                      final renderContext,
                      final attributes,
                      final element,
                    ) async {
                      if (url != null) {
                        await launchUrlString(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
                ),
        ),
      );
}
