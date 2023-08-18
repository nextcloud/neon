import 'package:flutter/material.dart';
import 'package:neon/src/widgets/error.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';

class NeonListView extends StatelessWidget {
  NeonListView({
    required this.isLoading,
    required this.error,
    required this.onRefresh,
    required final NullableIndexedWidgetBuilder itemBuilder,
    final int? itemCount,
    this.scrollKey,
    this.topFixedChildren,
    this.topScrollingChildren,
    super.key,
  }) : sliver = SliverList.builder(
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );

  const NeonListView.custom({
    required this.isLoading,
    required this.error,
    required this.onRefresh,
    required this.sliver,
    this.scrollKey,
    this.topFixedChildren,
    this.topScrollingChildren,
    super.key,
  });

  final bool isLoading;
  final Object? error;
  final RefreshCallback onRefresh;
  final String? scrollKey;
  final List<Widget>? topFixedChildren;
  final List<Widget>? topScrollingChildren;
  final Widget sliver;

  @override
  Widget build(final BuildContext context) {
    final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    final hasFloatingActionButton = Scaffold.maybeOf(context)?.hasFloatingActionButton ?? false;

    return RefreshIndicator.adaptive(
      key: refreshIndicatorKey,
      onRefresh: onRefresh,
      child: CustomScrollView(
        key: scrollKey != null ? PageStorageKey<String>(scrollKey!) : null,
        primary: true,
        slivers: [
          if (topFixedChildren != null)
            SliverList.builder(
              itemCount: topFixedChildren!.length,
              itemBuilder: (final context, final index) => topFixedChildren![index],
            ),
          if (isLoading)
            const SliverToBoxAdapter(
              child: NeonLinearProgressIndicator(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
              ),
            ),
          if (error != null)
            SliverToBoxAdapter(
              child: NeonError(
                error,
                onRetry: () async => refreshIndicatorKey.currentState!.show(),
              ),
            ),
          if (topScrollingChildren != null)
            SliverList.builder(
              itemCount: topScrollingChildren!.length,
              itemBuilder: (final context, final index) => topScrollingChildren![index],
            ),
          SliverPadding(
            padding: hasFloatingActionButton ? const EdgeInsets.only(bottom: 88) : EdgeInsets.zero,
            sliver: sliver,
          ),
        ],
      ),
    );
  }
}
