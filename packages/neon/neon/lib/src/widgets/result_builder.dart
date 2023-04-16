part of '../../neon.dart';

class ResultBuilder<T extends Bloc, R> extends StatelessWidget {
  const ResultBuilder({
    required this.stream,
    required this.builder,
    super.key,
  });

  final BehaviorSubject<Result<R>> stream;

  final Widget Function(BuildContext, Result<R>) builder;

  @override
  Widget build(final BuildContext context) => StreamBuilder(
        stream: stream,
        builder: (final context, final snapshot) {
          if (snapshot.hasError) {
            return builder(context, Result.error(snapshot.error!));
          }
          if (snapshot.hasData) {
            return builder(context, snapshot.data!);
          }

          return builder(context, Result.loading());
        },
      );
}
