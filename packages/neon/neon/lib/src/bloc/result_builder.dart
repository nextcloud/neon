import 'package:flutter/widgets.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:rxdart/rxdart.dart';

typedef ResultWidgetBuilder<T> = Widget Function(BuildContext context, Result<T> snapshot);

class ResultBuilder<T> extends StreamBuilderBase<Result<T>, Result<T>> {
  const ResultBuilder({
    required this.builder,
    this.initialData,
    super.stream,
    super.key,
  });

  ResultBuilder.behaviorSubject({
    required this.builder,
    BehaviorSubject<Result<T>>? super.stream,
    super.key,
  }) : initialData = stream?.valueOrNull;

  final ResultWidgetBuilder<T> builder;
  final Result<T>? initialData;

  @override
  Result<T> initial() => initialData?.asLoading() ?? Result<T>.loading();

  @override
  Result<T> afterData(final Result<T> current, final Result<T> data) {
    // prevent rebuild when only the cache state cahnges
    if (current == data) {
      return current;
    }

    return data;
  }

  @override
  Result<T> afterError(final Result<T> current, final Object error, final StackTrace stackTrace) {
    if (current.hasError) {
      return current;
    }

    return Result(
      current.data,
      error,
      isLoading: false,
      isCached: false,
    );
  }

  @override
  Widget build(final BuildContext context, final Result<T> currentSummary) => builder(context, currentSummary);
}
