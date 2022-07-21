part of '../neon.dart';

class CustomListView<T> extends StatelessWidget {
  const CustomListView({
    required this.items,
    required this.builder,
    this.scrollKey,
    this.withFloatingActionButton = false,
    super.key,
  });

  final List<T> items;
  final Widget Function(BuildContext, T data) builder;
  final String? scrollKey;
  final bool withFloatingActionButton;

  @override
  Widget build(final BuildContext context) => Scrollbar(
        child: ListView.separated(
          key: scrollKey != null ? PageStorageKey<String>(scrollKey!) : null,
          padding: withFloatingActionButton ? const EdgeInsets.only(bottom: 88) : null,
          separatorBuilder: (final context, final index) => const SizedBox(
            height: 10,
          ),
          itemCount: items.length,
          itemBuilder: (final context, final index) => builder(context, items[index]),
        ),
      );
}
