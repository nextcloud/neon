import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

abstract class Wrap {
  Wrap(this.content);

  final String content;
}

class WrapA extends Wrap {
  WrapA(super.content);
}

class WrapB extends Wrap {
  WrapB(super.content);
}

class TestSyncSources extends SyncSources<WrapA, WrapB> {
  TestSyncSources(
    this.stateA,
    this.stateB,
  );

  final Map<String, WrapA> stateA;
  final Map<String, WrapB> stateB;

  @override
  Future<List<SyncObject<WrapA>>> listObjectsA() async =>
      stateA.keys.map((final key) => SyncObject<WrapA>(key, stateA[key]!)).toList();

  @override
  Future<List<SyncObject<WrapB>>> listObjectsB() async =>
      stateB.keys.map((final key) => SyncObject<WrapB>(key, stateB[key]!)).toList();

  @override
  Future<String> getObjectETagA(final SyncObject<WrapA> object) async => etagA(object.data.content);

  @override
  Future<String> getObjectETagB(final SyncObject<WrapB> object) async => etagB(object.data.content);

  @override
  Future<SyncObject<WrapB>> writeObjectA(final SyncObject<WrapA> object) async {
    final wrap = WrapB(object.data.content);
    stateB[object.id] = wrap;
    return SyncObject<WrapB>(object.id, wrap);
  }

  @override
  Future<SyncObject<WrapA>> writeObjectB(final SyncObject<WrapB> object) async {
    final wrap = WrapA(object.data.content);
    stateA[object.id] = wrap;
    return SyncObject<WrapA>(object.id, wrap);
  }

  @override
  Future deleteObjectA(final SyncObject<WrapA> object) async => stateA.remove(object.id);

  @override
  Future deleteObjectB(final SyncObject<WrapB> object) async => stateB.remove(object.id);

  @override
  List<SyncAction<WrapA, WrapB>> sortActions(final List<SyncAction<WrapA, WrapB>> actions) => actions;

  @override
  SyncConflictSolution? findSolution(final SyncConflict<WrapA, WrapB> conflict) => null;
}

String etagA(final String content) => sha1.convert(utf8.encode('A$content')).toString();

String etagB(final String content) => sha1.convert(utf8.encode('B$content')).toString();

String randomEtag() => sha1.convert(utf8.encode(Random().nextDouble().toString())).toString();

Future main() async {
  group('sync', () {
    group('stub', () {
      test('all empty', () async {
        final sources = TestSyncSources({}, {});
        final status = SyncStatus([]);

        final conflicts = await sync(sources, status, {});
        expect(conflicts, isEmpty);
        expect(sources.stateA, isEmpty);
        expect(sources.stateB, isEmpty);
        expect(status.entries, isEmpty);
      });

      group('copy', () {
        group('missing', () {
          test('to A', () async {
            const id = '123';
            const content = '456';
            final sources = TestSyncSources(
              {},
              {
                id: WrapB(content),
              },
            );
            final status = SyncStatus([]);

            final conflicts = await sync(sources, status, {});
            expect(conflicts, isEmpty);
            expect(sources.stateA, hasLength(1));
            expect(sources.stateA[id]!.content, content);
            expect(sources.stateB, hasLength(1));
            expect(sources.stateB[id]!.content, content);
            expect(status.entries, hasLength(1));
            expect(status.entries.find(id)!.etagA, etagA(content));
            expect(status.entries.find(id)!.etagB, etagB(content));
          });

          test('to B', () async {
            const id = '123';
            const content = '456';
            final sources = TestSyncSources(
              {
                id: WrapA(content),
              },
              {},
            );
            final status = SyncStatus([]);

            final conflicts = await sync(sources, status, {});
            expect(conflicts, isEmpty);
            expect(sources.stateA, hasLength(1));
            expect(sources.stateA[id]!.content, content);
            expect(sources.stateB, hasLength(1));
            expect(sources.stateB[id]!.content, content);
            expect(status.entries, hasLength(1));
            expect(status.entries.find(id)!.etagA, etagA(content));
            expect(status.entries.find(id)!.etagB, etagB(content));
          });
        });

        group('changed', () {
          test('to A', () async {
            const id = '123';
            const contentA = '456';
            const contentB = '789';
            final sources = TestSyncSources(
              {
                id: WrapA(contentA),
              },
              {
                id: WrapB(contentB),
              },
            );
            final status = SyncStatus([
              SyncStatusEntry(id, etagA(contentA), randomEtag()),
            ]);

            final conflicts = await sync(sources, status, {});
            expect(conflicts, isEmpty);
            expect(sources.stateA, hasLength(1));
            expect(sources.stateA[id]!.content, contentB);
            expect(sources.stateB, hasLength(1));
            expect(sources.stateB[id]!.content, contentB);
            expect(status.entries, hasLength(1));
            expect(status.entries.find(id)!.etagA, etagA(contentB));
            expect(status.entries.find(id)!.etagB, etagB(contentB));
          });

          test('to B', () async {
            const id = '123';
            const contentA = '456';
            const contentB = '789';
            final sources = TestSyncSources(
              {
                id: WrapA(contentA),
              },
              {
                id: WrapB(contentB),
              },
            );
            final status = SyncStatus([
              SyncStatusEntry(id, randomEtag(), etagB(contentB)),
            ]);

            final conflicts = await sync(sources, status, {});
            expect(conflicts, isEmpty);
            expect(sources.stateA, hasLength(1));
            expect(sources.stateA[id]!.content, contentA);
            expect(sources.stateB, hasLength(1));
            expect(sources.stateB[id]!.content, contentA);
            expect(status.entries, hasLength(1));
            expect(status.entries.find(id)!.etagA, etagA(contentA));
            expect(status.entries.find(id)!.etagB, etagB(contentA));
          });
        });
      });

      group('delete', () {
        test('from A', () async {
          const id = '123';
          const content = '456';
          final sources = TestSyncSources(
            {
              id: WrapA(content),
            },
            {},
          );
          final status = SyncStatus([
            SyncStatusEntry(id, etagA(content), etagB(content)),
          ]);

          final conflicts = await sync(sources, status, {});
          expect(conflicts, isEmpty);
          expect(sources.stateA, isEmpty);
          expect(sources.stateB, isEmpty);
          expect(status.entries, isEmpty);
        });

        test('from B', () async {
          const id = '123';
          const content = '456';
          final sources = TestSyncSources(
            {},
            {
              id: WrapB(content),
            },
          );
          final status = SyncStatus([
            SyncStatusEntry(id, etagA(content), etagB(content)),
          ]);

          final conflicts = await sync(sources, status, {});
          expect(conflicts, isEmpty);
          expect(sources.stateA, isEmpty);
          expect(sources.stateB, isEmpty);
          expect(status.entries, isEmpty);
        });

        test('from status', () async {
          const id = '123';
          const content = '456';
          final sources = TestSyncSources({}, {});
          final status = SyncStatus([
            SyncStatusEntry(id, etagA(content), etagB(content)),
          ]);

          final conflicts = await sync(sources, status, {});
          expect(conflicts, isEmpty);
          expect(sources.stateA, isEmpty);
          expect(sources.stateB, isEmpty);
          expect(status.entries, isEmpty);
        });
      });

      group('conflict', () {
        test('status missing', () async {
          const id = '123';
          const content = '456';
          final sources = TestSyncSources(
            {
              id: WrapA(content),
            },
            {
              id: WrapB(content),
            },
          );
          final status = SyncStatus([]);

          final conflicts = await sync(sources, status, {});
          expect(conflicts, hasLength(1));
          expect(conflicts[0].type, SyncConflictType.bothNew);
          expect(sources.stateA, hasLength(1));
          expect(sources.stateA[id]!.content, content);
          expect(sources.stateB, hasLength(1));
          expect(sources.stateB[id]!.content, content);
          expect(status.entries, isEmpty);
        });

        test('both changed', () async {
          const id = '123';
          const contentA = '456';
          const contentB = '789';
          final sources = TestSyncSources(
            {
              id: WrapA(contentA),
            },
            {
              id: WrapB(contentB),
            },
          );
          final status = SyncStatus([
            SyncStatusEntry(id, randomEtag(), randomEtag()),
          ]);

          final conflicts = await sync(sources, status, {});
          expect(conflicts, hasLength(1));
          expect(conflicts[0].type, SyncConflictType.bothChanged);
          expect(sources.stateA, hasLength(1));
          expect(sources.stateA[id]!.content, contentA);
          expect(sources.stateB, hasLength(1));
          expect(sources.stateB[id]!.content, contentB);
          expect(status.entries, hasLength(1));
        });

        group('solution', () {
          group('status missing', () {
            test('skip', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final sources = TestSyncSources(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final status = SyncStatus([]);

              final conflicts = await sync(sources, status, {
                id: SyncConflictSolution.skip,
              });
              expect(conflicts, isEmpty);
              expect(sources.stateA, hasLength(1));
              expect(sources.stateA[id]!.content, contentA);
              expect(sources.stateB, hasLength(1));
              expect(sources.stateB[id]!.content, contentB);
              expect(status.entries, isEmpty);
            });

            test('overwrite A', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final sources = TestSyncSources(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final status = SyncStatus([]);

              final conflicts = await sync(sources, status, {
                id: SyncConflictSolution.overwriteA,
              });
              expect(conflicts, isEmpty);
              expect(sources.stateA, hasLength(1));
              expect(sources.stateA[id]!.content, contentB);
              expect(sources.stateB, hasLength(1));
              expect(sources.stateB[id]!.content, contentB);
              expect(status.entries, hasLength(1));
              expect(status.entries.find(id)!.etagA, etagA(contentB));
              expect(status.entries.find(id)!.etagB, etagB(contentB));
            });

            test('overwrite B', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final sources = TestSyncSources(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final status = SyncStatus([]);

              final conflicts = await sync(sources, status, {
                id: SyncConflictSolution.overwriteB,
              });
              expect(conflicts, isEmpty);
              expect(sources.stateA, hasLength(1));
              expect(sources.stateA[id]!.content, contentA);
              expect(sources.stateB, hasLength(1));
              expect(sources.stateB[id]!.content, contentA);
              expect(status.entries, hasLength(1));
              expect(status.entries.find(id)!.etagA, etagA(contentA));
              expect(status.entries.find(id)!.etagB, etagB(contentA));
            });
          });

          group('both changed', () {
            test('skip', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final sources = TestSyncSources(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final status = SyncStatus([
                SyncStatusEntry(id, randomEtag(), randomEtag()),
              ]);

              final conflicts = await sync(sources, status, {
                id: SyncConflictSolution.skip,
              });
              expect(conflicts, isEmpty);
              expect(sources.stateA, hasLength(1));
              expect(sources.stateA[id]!.content, contentA);
              expect(sources.stateB, hasLength(1));
              expect(sources.stateB[id]!.content, contentB);
              expect(status.entries, hasLength(1));
            });

            test('overwrite A', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final sources = TestSyncSources({
                id: WrapA(contentA),
              }, {
                id: WrapB(contentB),
              });
              final status = SyncStatus([
                SyncStatusEntry(id, randomEtag(), randomEtag()),
              ]);

              final conflicts = await sync(sources, status, {
                id: SyncConflictSolution.overwriteA,
              });
              expect(conflicts, isEmpty);
              expect(sources.stateA, hasLength(1));
              expect(sources.stateA[id]!.content, contentB);
              expect(sources.stateB, hasLength(1));
              expect(sources.stateB[id]!.content, contentB);
              expect(status.entries, hasLength(1));
              expect(status.entries.find(id)!.etagA, etagA(contentB));
              expect(status.entries.find(id)!.etagB, etagB(contentB));
            });

            test('overwrite B', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final sources = TestSyncSources({
                id: WrapA(contentA),
              }, {
                id: WrapB(contentB),
              });
              final status = SyncStatus([
                SyncStatusEntry(id, randomEtag(), randomEtag()),
              ]);

              final conflicts = await sync(sources, status, {
                id: SyncConflictSolution.overwriteB,
              });
              expect(conflicts, isEmpty);
              expect(sources.stateA, hasLength(1));
              expect(sources.stateA[id]!.content, contentA);
              expect(sources.stateB, hasLength(1));
              expect(sources.stateB[id]!.content, contentA);
              expect(status.entries, hasLength(1));
              expect(status.entries.find(id)!.etagA, etagA(contentA));
              expect(status.entries.find(id)!.etagB, etagB(contentA));
            });
          });
        });
      });
    });
  });
}
