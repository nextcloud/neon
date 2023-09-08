import 'package:flutter/material.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';

class NeonListView<T> extends StatelessWidget {
  const NeonListView({
    required this.items,
    required this.isLoading,
    required this.error,
    required this.onRefresh,
    required this.builder,
    this.scrollKey,
    this.withFloatingActionButton = false,
    this.topFixedChildren,
    this.topScrollingChildren,
    super.key,
  });

  final Iterable<T>? items;
  final bool isLoading;
  final dynamic error;
  final Future Function() onRefresh;
  final Widget Function(BuildContext, T data) builder;
  final String? scrollKey;
  final bool withFloatingActionButton;
  final List<Widget>? topFixedChildren;
  final List<Widget>? topScrollingChildren;

  @override
  Widget build(final BuildContext context) => RefreshIndicator(
        onRefresh: onRefresh,
        child: Column(
          children: [
            ...?topFixedChildren,
            NeonLinearProgressIndicator(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              visible: isLoading,
            ),
            Expanded(
              child: Scrollbar(
                child: ListView(
                  primary: true,
                  key: scrollKey != null ? PageStorageKey<String>(scrollKey!) : null,
                  padding: withFloatingActionButton ? const EdgeInsets.only(bottom: 88) : null,
                  children: [
                    ...?topScrollingChildren,
                    NeonException(
                      error,
                      onRetry: onRefresh,
                    ),
                    if (items != null)
                      for (final item in items!) builder(context, item),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
