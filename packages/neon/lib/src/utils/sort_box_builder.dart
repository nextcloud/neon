part of '../neon.dart';

class SortBoxBuilder<T extends Enum, R> extends StatelessWidget {
  const SortBoxBuilder({
    required this.sortBox,
    required this.sortPropertyOption,
    required this.sortBoxOrderOption,
    required this.input,
    required this.builder,
    super.key,
  });

  final SortBox<T, R> sortBox;
  final SelectOption<T> sortPropertyOption;
  final SelectOption<SortBoxOrder> sortBoxOrderOption;
  final List<R> input;
  final Widget Function(BuildContext, List<R>) builder;

  @override
  Widget build(final BuildContext context) => OptionBuilder<T>(
        option: sortPropertyOption,
        builder: (final context, final property) => OptionBuilder<SortBoxOrder>(
          option: sortBoxOrderOption,
          builder: (final context, final order) => property == null || order == null
              ? Container()
              : builder(
                  context,
                  sortBox.sort(input, Box(property, order)),
                ),
        ),
      );
}
