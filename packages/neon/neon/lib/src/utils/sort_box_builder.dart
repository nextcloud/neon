import 'package:flutter/widgets.dart';
import 'package:settings/settings.dart';
import 'package:sort_box/sort_box.dart';

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
  final List<R>? input;
  final Widget Function(BuildContext, List<R>?) builder;

  @override
  Widget build(final BuildContext context) {
    if (input == null || (input?.isEmpty ?? false)) {
      return builder(context, null);
    }

    return OptionBuilder<T>(
      option: sortPropertyOption,
      builder: (final context, final property) => OptionBuilder<SortBoxOrder>(
        option: sortBoxOrderOption,
        builder: (final context, final order) {
          final box = Box(property, order);

          return builder(context, sortBox.sort(input!, box));
        },
      ),
    );
  }
}
