part of '../../neon.dart';

@immutable
class Result<T> {
  const Result(
    this.data,
    this.error, {
    required this.isLoading,
    required this.isCached,
  });

  factory Result.loading() => const Result(
        null,
        null,
        isLoading: true,
        isCached: false,
      );

  factory Result.success(final T data) => Result(
        data,
        null,
        isLoading: false,
        isCached: false,
      );

  factory Result.error(final Object error) => Result(
        null,
        error,
        isLoading: false,
        isCached: false,
      );

  final T? data;
  final Object? error;
  final bool isLoading;
  final bool isCached;

  Result<R> transform<R>(final R? Function(T data) call) => Result(
        data != null ? call(data as T) : null,
        error,
        isLoading: isLoading,
        isCached: isCached,
      );

  Result<T> asLoading() => Result(
        data,
        error,
        isLoading: true,
        isCached: isCached,
      );

  bool get hasError => error != null;

  @override
  bool operator ==(final Object other) =>
      other is Result && other.isLoading == isLoading && other.data == data && other.error == error;

  @override
  int get hashCode => Object.hash(data, error, isLoading, isCached);
}
