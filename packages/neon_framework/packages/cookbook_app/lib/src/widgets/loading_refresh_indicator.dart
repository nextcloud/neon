import 'dart:async';

import 'package:flutter/material.dart';

/// The signature for a function that's called when the user has dragged a
/// [LoadingRefreshIndicator] far enough to demonstrate that they want the app
/// to refresh.
///
/// Used by [LoadingRefreshIndicator.onRefresh].
typedef LoadingRefreshCallback = void Function();

/// A loading indicator wrapper around [RefreshIndicator.adaptive].
///
/// This allows showing the refresh indicator from  an external source.
class LoadingRefreshIndicator extends StatefulWidget {
  /// Creates a new loading refresh indicator.
  const LoadingRefreshIndicator({
    required this.onRefresh,
    required this.child,
    this.atTop = true,
    this.isLoading = false,
    this.displacement = 40.0,
    this.edgeOffset = 0.0,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
    super.key,
  });

  /// Whether the content is loading and the loading indicator should be shown.
  final bool isLoading;

  /// Equivalent to the `atTop` argument in [RefreshIndicatorState.show].
  ///
  /// It defaults to showing the indicator at the top. To show it at the
  /// bottom, set `atTop` to false.
  final bool atTop;

  /// The widget below this widget in the tree.
  ///
  /// The refresh indicator will be stacked on top of this child. The indicator
  /// will appear when child's Scrollable descendant is over-scrolled.
  ///
  /// Typically a [ListView] or [CustomScrollView].
  final Widget child;

  /// The distance from the child's top or bottom [edgeOffset] where
  /// the refresh indicator will settle. During the drag that exposes the refresh
  /// indicator, its actual displacement may significantly exceed this value.
  ///
  /// In most cases, [displacement] distance starts counting from the parent's
  /// edges. However, if [edgeOffset] is larger than zero then the [displacement]
  /// value is calculated from that offset instead of the parent's edge.
  final double displacement;

  /// The offset where [RefreshProgressIndicator] starts to appear on drag start.
  ///
  /// Depending whether the indicator is showing on the top or bottom, the value
  /// of this variable controls how far from the parent's edge the progress
  /// indicator starts to appear. This may come in handy when, for example, the
  /// UI contains a top [Widget] which covers the parent's edge where the progress
  /// indicator would otherwise appear.
  ///
  /// By default, the edge offset is set to 0.
  ///
  /// See also:
  ///
  ///  * [displacement], can be used to change the distance from the edge that
  ///    the indicator settles.
  final double edgeOffset;

  /// A function that's called when the user has dragged the refresh indicator
  /// far enough to demonstrate that they want the app to refresh. The returned
  /// [Future] must complete when the refresh operation is finished.
  final LoadingRefreshCallback onRefresh;

  /// The progress indicator's foreground color. The current theme's
  /// [ColorScheme.primary] by default.
  final Color? color;

  /// The progress indicator's background color. The current theme's
  /// [ThemeData.canvasColor] by default.
  final Color? backgroundColor;

  /// A check that specifies whether a [ScrollNotification] should be
  /// handled by this widget.
  ///
  /// By default, checks whether `notification.depth == 0`. Set it to something
  /// else for more complicated layouts.
  final ScrollNotificationPredicate notificationPredicate;

  /// {@macro flutter.progress_indicator.ProgressIndicator.semanticsLabel}
  ///
  /// This will be defaulted to [MaterialLocalizations.refreshIndicatorSemanticLabel]
  /// if it is null.
  final String? semanticsLabel;

  /// {@macro flutter.progress_indicator.ProgressIndicator.semanticsValue}
  final String? semanticsValue;

  /// Defines [strokeWidth] for `RefreshIndicator`.
  ///
  /// By default, the value of [strokeWidth] is 2.0 pixels.
  final double strokeWidth;

  /// Defines how this [RefreshIndicator] can be triggered when users overscroll.
  ///
  /// The [RefreshIndicator] can be pulled out in two cases,
  /// 1, Keep dragging if the scrollable widget at the edge with zero scroll position
  ///    when the drag starts.
  /// 2, Keep dragging after overscroll occurs if the scrollable widget has
  ///    a non-zero scroll position when the drag starts.
  ///
  /// If this is [RefreshIndicatorTriggerMode.anywhere], both of the cases above can be triggered.
  ///
  /// If this is [RefreshIndicatorTriggerMode.onEdge], only case 1 can be triggered.
  ///
  /// Defaults to [RefreshIndicatorTriggerMode.onEdge].
  final RefreshIndicatorTriggerMode triggerMode;

  @override
  State<LoadingRefreshIndicator> createState() => _LoadingRefreshIndicatorState();
}

class _LoadingRefreshIndicatorState extends State<LoadingRefreshIndicator> {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Completer<void>? completer;
  late bool isLoading;

  @override
  void initState() {
    if (widget.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        show();
      });
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant LoadingRefreshIndicator oldWidget) {
    if (oldWidget.isLoading == widget.isLoading) {
      return;
    }

    if (widget.isLoading) {
      show();
    } else {
      hide();
    }

    super.didUpdateWidget(oldWidget);
  }

  void show() {
    isLoading = true;
    unawaited(
      refreshIndicatorKey.currentState!.show(atTop: widget.atTop),
    );
  }

  void hide() {
    completer?.complete();
    completer = null;
    isLoading = false;
  }

  Future<void> onRefresh() async {
    if (isLoading) {
      isLoading = false;
    } else {
      widget.onRefresh();
    }

    completer = Completer<void>();
    await completer!.future;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      key: refreshIndicatorKey,
      displacement: widget.displacement,
      edgeOffset: widget.edgeOffset,
      onRefresh: onRefresh,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
      notificationPredicate: widget.notificationPredicate,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
      strokeWidth: widget.strokeWidth,
      triggerMode: widget.triggerMode,
      child: widget.child,
    );
  }
}
