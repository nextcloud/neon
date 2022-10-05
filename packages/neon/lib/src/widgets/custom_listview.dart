part of '../neon.dart';

class CustomListView<T> extends StatelessWidget {
  const CustomListView({
    required this.items,
    required this.isLoading,
    required this.error,
    required this.onRetry,
    required this.onRefresh,
    required this.builder,
    this.scrollKey,
    this.withFloatingActionButton = false,
    this.topFixedChildren,
    this.topScrollingChildren,
    super.key,
  });

  final List<T>? items;
  final bool isLoading;
  final dynamic error;
  final Function() onRetry;
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
            if (topFixedChildren != null) ...[
              ...topFixedChildren!,
            ],
            CustomLinearProgressIndicator(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              visible: isLoading,
            ),
            Expanded(
              child: Scrollbar(
                child: ListView(
                  key: scrollKey != null ? PageStorageKey<String>(scrollKey!) : null,
                  padding: withFloatingActionButton ? const EdgeInsets.only(bottom: 88) : null,
                  children: [
                    if (topScrollingChildren != null) ...[
                      ...topScrollingChildren!,
                    ],
                    ExceptionWidget(
                      error,
                      onRetry: onRetry,
                    ),
                    if (items != null) ...[
                      for (final item in items!) ...[
                        builder(context, item),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
