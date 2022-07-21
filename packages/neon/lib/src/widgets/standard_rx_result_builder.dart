part of '../neon.dart';

// This is some weird false positive
// ignore_for_file: use_late_for_private_fields_and_variables

class StandardRxResultBuilder<B extends RxBlocTypeBase, T> extends StatelessWidget {
  const StandardRxResultBuilder({
    required this.state,
    required this.builder,
    this.bloc,
    super.key,
  });

  final B? bloc;
  final Stream<Result<T>> Function(B) state;

  final Widget Function(BuildContext context, T? data, Exception? error, bool loading, B bloc) builder;

  @override
  Widget build(final BuildContext context) {
    final block = bloc ?? RxBlocProvider.of<B>(context);

    return ResultStreamBuilder<T>(
      stream: state(block),
      builder: (
        final context,
        final data,
        final error,
        final loading,
      ) =>
          builder(
        context,
        data,
        error,
        loading,
        block,
      ),
    );
  }
}
