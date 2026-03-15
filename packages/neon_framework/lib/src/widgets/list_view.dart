import 'package:flutter/material.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';

/// A custom Neon list view similar to [ListView].
///
/// A Neon list view handles fixed header items, refreshing and displaying
/// loading and error information.
class NeonListView extends StatefulWidget {
  /// Creates a new Neon list view.
  NeonListView({
    required this.isLoading,
    required this.error,
    required this.onRefresh,
    required NullableIndexedWidgetBuilder itemBuilder,
    required this.scrollKey,
    int? itemCount,
    this.topFixedChildren,
    this.topScrollingChildren,
    this.reverse = false,
    super.key,
  }) : slivers = [
          SliverList.builder(
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ];

  /// Creates a Neon list view with custom slivers.
  const NeonListView.custom({
    required this.isLoading,
    required this.error,
    required this.onRefresh,
    required this.slivers,
    required this.scrollKey,
    this.topFixedChildren,
    this.topScrollingChildren,
    this.reverse = false,
    super.key,
  });

  /// Whether a [NeonLinearProgressIndicator] should be shown indicating that
  /// the data for this list is still loading or refreshing.
  final bool isLoading;

  /// The error to show in a persistent [NeonError] at the top of the list.
  final Object? error;

  /// The callback invoked when the user refreshes the list.
  final RefreshCallback onRefresh;

  /// The scroll key attached to this list view.
  final String scrollKey;

  /// A list of widgets that are displayed at the top of the but do not scroll with it.
  final List<Widget>? topFixedChildren;

  /// A list of widgets that are displayed at the top of the list and scroll with it.
  final List<Widget>? topScrollingChildren;

  /// Whether the scroll view scrolls in the reading direction.
  ///
  /// Defaults to `false`.
  final bool reverse;

  /// The sliver controlling the main scrollable area.
  final List<Widget> slivers;

  @override
  State<NeonListView> createState() => _NeonListViewState();
}

class _NeonListViewState extends State<NeonListView> {
  // GlobalKey requires the widget to be stateful, otherwise it gets recreated on every build and we lose the reference.
  // This in turn leads to the view being unnecessarily repainted at the end of a request.
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      key: _refreshIndicatorKey,
      onRefresh: widget.onRefresh,
      child: CustomScrollView(
        reverse: widget.reverse,
        key: PageStorageKey<String>(widget.scrollKey),
        primary: true,
        slivers: [
          if (widget.topFixedChildren != null)
            SliverList.builder(
              itemCount: widget.topFixedChildren!.length,
              itemBuilder: (context, index) => widget.topFixedChildren![index],
            ),
          SliverToBoxAdapter(
            child: NeonLinearProgressIndicator(
              visible: widget.isLoading,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: NeonError(
              widget.error,
              onRetry: () async => _refreshIndicatorKey.currentState!.show(),
            ),
          ),
          if (widget.topScrollingChildren != null)
            SliverList.builder(
              itemCount: widget.topScrollingChildren!.length,
              itemBuilder: (context, index) => widget.topScrollingChildren![index],
            ),
          ..._buildPaddedSlivers(),
        ],
      ),
    );
  }

  Iterable<Widget> _buildPaddedSlivers() {
    final hasFloatingActionButton = Scaffold.maybeOf(context)?.hasFloatingActionButton ?? false;
    final padding = hasFloatingActionButton ? const EdgeInsets.only(bottom: 88) : EdgeInsets.zero;

    return widget.slivers.map(
      (sliver) => SliverPadding(
        padding: padding,
        sliver: sliver,
      ),
    );
  }
}
