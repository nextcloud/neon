import 'package:flutter/widgets.dart';
import 'package:neon/src/settings/models/option.dart';

typedef OptionBuilderFunction<T> = Widget Function(BuildContext context, T snapshot);

class OptionBuilder<T> extends StreamBuilderBase<T, T> {
  OptionBuilder({
    required this.option,
    required this.builder,
    super.key,
  }) : super(stream: option.stream);

  final Option<T> option;
  final OptionBuilderFunction<T> builder;

  @override
  T afterData(final T current, final T data) => data;

  @override
  T initial() => option.defaultValue;

  @override
  Widget build(final BuildContext context, final T currentSummary) => builder(context, currentSummary);
}
