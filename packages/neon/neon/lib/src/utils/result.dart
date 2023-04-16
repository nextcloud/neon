part of '../../neon.dart';

class Result<T> {
  Result(
    this.data,
    this.error, {
    required this.loading,
    required this.cached,
  });

  factory Result.loading() => Result(
        null,
        null,
        loading: true,
        cached: false,
      );

  factory Result.success(final T data) => Result(
        data,
        null,
        loading: false,
        cached: false,
      );

  factory Result.error(final Object error) => Result(
        null,
        error,
        loading: false,
        cached: false,
      );

  final T? data;
  final Object? error;
  final bool loading;
  final bool cached;

  Result<R> transform<R>(final R? Function(T data) call) => Result(
        data != null ? call(data as T) : null,
        error,
        loading: loading,
        cached: cached,
      );
}
