part of '../app.dart';

class NewsArticlePage extends StatefulWidget {
  const NewsArticlePage({
    required this.bloc,
    required this.article,
    required this.useWebView,
    this.bodyData,
    super.key,
  }) : assert(useWebView || bodyData != null, 'bodyData has to be set when not using a WebView');

  final NewsArticlesBloc bloc;
  final NewsArticle article;
  final bool useWebView;
  final String? bodyData;

  @override
  State<NewsArticlePage> createState() => _NewsArticlePageState();
}

class _NewsArticlePageState extends State<NewsArticlePage> {
  late NewsArticle article = widget.article;

  bool _webviewLoading = true;
  WebViewController? _webviewController;
  Timer? _markAsReadTimer;

  @override
  void initState() {
    super.initState();

    widget.bloc.articleUpdate.listen((final a) {
      if (mounted && a.id == article.id) {
        setState(() {
          article = a;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      if (Provider.of<NeonPlatform>(context, listen: false).canUseWakelock) {
        Wakelock.enable();
      }
    });

    if (!widget.useWebView) {
      _startMarkAsReadTimer();
    }
  }

  @override
  void dispose() {
    _cancelMarkAsReadTimer();

    super.dispose();
  }

  void _startMarkAsReadTimer() {
    if (article.unread!) {
      if (widget.bloc.newsBloc.options.articleDisableMarkAsReadTimeoutOption.value) {
        widget.bloc.markArticleAsRead(article);
      } else {
        _markAsReadTimer = Timer(const Duration(seconds: 3), () {
          if (article.unread!) {
            widget.bloc.markArticleAsRead(article);
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

    return article.url!;
  }

  @override
  Widget build(final BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (_webviewController != null && await _webviewController!.canGoBack()) {
            await _webviewController!.goBack();
            return false;
          }

          if (Provider.of<NeonPlatform>(context, listen: false).canUseWakelock) {
            await Wakelock.disable();
          }
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () async {
                  if (article.starred!) {
                    widget.bloc.unstarArticle(article);
                  } else {
                    widget.bloc.starArticle(article);
                  }
                },
                icon: Icon(article.starred! ? Icons.star : Icons.star_outline),
              ),
              IconButton(
                onPressed: () async {
                  if (article.unread!) {
                    widget.bloc.markArticleAsRead(article);
                  } else {
                    widget.bloc.markArticleAsUnread(article);
                  }
                },
                icon: Icon(article.unread! ? MdiIcons.email : MdiIcons.emailMarkAsUnread),
              ),
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
          ),
          body: widget.useWebView
              ? Stack(
                  children: [
                    WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (final controller) async {
                        _webviewController = controller;
                        await controller.loadUrl(article.url!);
                      },
                      onPageStarted: (final _) {
                        setState(() {
                          _webviewLoading = true;
                        });
                      },
                      onPageFinished: (final _) {
                        _startMarkAsReadTimer();
                        setState(() {
                          _webviewLoading = false;
                        });
                      },
                    ),
                    if (_webviewLoading) ...[
                      ColoredBox(
                        color: Theme.of(context).colorScheme.background,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ),
                      ),
                    ],
                  ],
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
