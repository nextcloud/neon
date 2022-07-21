part of '../neon.dart';

class ResultStreamBuilder<T> extends StatelessWidget {
  const ResultStreamBuilder({
    required this.builder,
    this.stream,
    super.key,
  });

  final Stream<Result<T>>? stream;

  final Widget Function(
    BuildContext context,
    T? data,
    Exception? error,
    bool loading,
  ) builder;

  @override
  Widget build(final BuildContext context) => StreamBuilder<Result<T>>(
        stream: stream,
        builder: (final buildContext, final snapshot) {
          final result =
              snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done
                  ? (snapshot.hasError ? Result.error(snapshot.asException()!) : snapshot.data)
                  : Result.loading();

          if (result is ResultSuccess<T>) {
            return builder(
              buildContext,
              result.data,
              null,
              false,
            );
          } else if (result is ResultError<T>) {
            return builder(
              buildContext,
              null,
              result.error,
              false,
            );
          } else if (result is ResultCached<T>) {
            return builder(
              buildContext,
              result.data,
              result.error,
              result.loading,
            );
          } else {
            return builder(
              context,
              null,
              null,
              true,
            );
          }
        },
      );
}

extension _AsyncSnapshotToException<T> on AsyncSnapshot<Result<T>> {
  Exception? asException() {
    if (!hasError) {
      return null;
    }

    if (error is Exception) {
      return error as Exception?;
    }

    return Exception(error.toString());
  }
}
