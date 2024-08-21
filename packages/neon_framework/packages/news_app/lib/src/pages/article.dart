import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:news_app/l10n/localizations.dart';
import 'package:news_app/src/blocs/article.dart';
import 'package:news_app/src/blocs/articles.dart';
import 'package:news_app/src/options.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  bool loading = false;
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();

    errorsSubscription = widget.bloc.errors.listen((error) {
      if (!mounted) {
        return;
      }

      NeonError.showSnackbar(context, error);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(WakelockPlus.enable());
    });

    if (widget.useWebView) {
      _webviewController = WebViewController()
        // ignore: discarded_futures
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        // ignore: discarded_futures
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (_) {
              setState(() {
                loading = true;
              });
            },
            onPageFinished: (_) async {
              setState(() {
                loading = false;
              });
              await _startMarkAsReadTimer();
            },
          ),
        )
        // ignore: discarded_futures
        ..loadRequest(Uri.parse(widget.url!));
    } else {
      unawaited(_startMarkAsReadTimer());
    }
  }

  @override
  void dispose() {
    _cancelMarkAsReadTimer();
    unawaited(errorsSubscription.cancel());

    super.dispose();
  }

  Future<void> _startMarkAsReadTimer() async {
    if (await widget.bloc.unread.first) {
      if (!mounted) {
        return;
      }

      if (NeonProvider.of<NewsOptions>(context).articleDisableMarkAsReadTimeoutOption.value) {
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
  Widget build(BuildContext context) {
    return BackButtonListener(
      onBackButtonPressed: () async {
        if (_webviewController != null && await _webviewController!.canGoBack()) {
          await _webviewController!.goBack();
          return true;
        }

        unawaited(WakelockPlus.disable());

        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            if (loading)
              const SizedBox.square(
                dimension: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            StreamBuilder(
              stream: widget.bloc.starred,
              builder: (context, starredSnapshot) {
                final starred = starredSnapshot.data ?? false;
                return IconButton(
                  onPressed: () async {
                    if (starred) {
                      widget.bloc.unstarArticle();
                    } else {
                      widget.bloc.starArticle();
                    }
                  },
                  tooltip:
                      starred ? NewsLocalizations.of(context).articleUnstar : NewsLocalizations.of(context).articleStar,
                  icon: Icon(starred ? AdaptiveIcons.star : AdaptiveIcons.star_outline),
                );
              },
            ),
            StreamBuilder(
              stream: widget.bloc.unread,
              builder: (context, unreadSnapshot) {
                final unread = unreadSnapshot.data ?? false;
                return IconButton(
                  onPressed: () async {
                    if (unread) {
                      widget.bloc.markArticleAsRead();
                    } else {
                      widget.bloc.markArticleAsUnread();
                    }
                  },
                  tooltip: unread
                      ? NewsLocalizations.of(context).articleMarkRead
                      : NewsLocalizations.of(context).articleMarkUnread,
                  icon: Icon(unread ? AdaptiveIcons.email : AdaptiveIcons.email_mark_as_unread),
                );
              },
            ),
            if (widget.url != null) ...[
              IconButton(
                onPressed: () async {
                  // ignore: use_build_context_synchronously
                  await launchUrl(NeonProvider.of<Account>(context), await _getURL());
                },
                tooltip: NewsLocalizations.of(context).articleOpenLink,
                icon: const Icon(Icons.open_in_new),
              ),
              if (NeonPlatform.instance.canUseSharing)
                IconButton(
                  onPressed: () async {
                    await Share.share(await _getURL());
                  },
                  tooltip: NewsLocalizations.of(context).articleShare,
                  icon: Icon(Icons.adaptive.share),
                ),
            ],
          ],
        ),
        body: SafeArea(
          child: widget.useWebView
              ? WebViewWidget(
                  controller: _webviewController!,
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Html(
                    data: widget.bodyData,
                    onLinkTap: (url, attributes, element) async {
                      if (url != null) {
                        await launchUrl(NeonProvider.of<Account>(context), url);
                      }
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
