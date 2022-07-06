part of '../../settings.dart';

class OptionBuilder<T> extends StatelessWidget {
  const OptionBuilder({
    required this.option,
    required this.builder,
    super.key,
  });

  final Option<T> option;
  final Widget Function(BuildContext context, T? data) builder;

  @override
  Widget build(final BuildContext context) => StreamBuilder<T?>(
        stream: option.defaultValue,
        builder: (final context, final defaultValueSnapshot) => StreamBuilder<T?>(
          stream: option.stream,
          builder: (final context, final valueSnapshot) => builder(
            context,
            valueSnapshot.data ?? defaultValueSnapshot.data,
          ),
        ),
      );
}
