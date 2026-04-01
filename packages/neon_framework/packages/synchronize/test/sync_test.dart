import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:synchronize/synchronize.dart';
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

class TestSyncState {
  TestSyncState(
    this.stateA,
    this.stateB,
  );

  final Map<String, WrapA> stateA;
  final Map<String, WrapB> stateB;
}

class TestSyncSourceA implements SyncSource<WrapA, WrapB> {
  TestSyncSourceA(this.state);

  final Map<String, WrapA> state;

  @override
  Future<List<SyncObject<WrapA>>> listObjects() async => state.keys.map((key) => (id: key, data: state[key]!)).toList();

  @override
  Future<String> getObjectETag(SyncObject<WrapA> object) async => etagA(object.data.content);

  @override
  Future<SyncObject<WrapA>> writeObject(SyncObject<WrapB> object) async {
    final wrap = WrapA(object.data.content);
    state[object.id] = wrap;
    return (id: object.id, data: wrap);
  }

  @override
  Future<void> deleteObject(SyncObject<WrapA> object) async => state.remove(object.id);
}

class TestSyncSourceB implements SyncSource<WrapB, WrapA> {
  TestSyncSourceB(this.state);

  final Map<String, WrapB> state;

  @override
  Future<List<SyncObject<WrapB>>> listObjects() async => state.keys.map((key) => (id: key, data: state[key]!)).toList();

  @override
  Future<String> getObjectETag(SyncObject<WrapB> object) async => etagB(object.data.content);

  @override
  Future<SyncObject<WrapB>> writeObject(SyncObject<WrapA> object) async {
    final wrap = WrapB(object.data.content);
    state[object.id] = wrap;
    return (id: object.id, data: wrap);
  }

  @override
  Future<void> deleteObject(SyncObject<WrapB> object) async => state.remove(object.id);
}

class TestSyncSources implements SyncSources<WrapA, WrapB> {
  TestSyncSources(
    this.sourceA,
    this.sourceB,
  );

  factory TestSyncSources.fromState(TestSyncState state) => TestSyncSources(
        TestSyncSourceA(state.stateA),
        TestSyncSourceB(state.stateB),
      );

  @override
  final SyncSource<WrapA, WrapB> sourceA;

  @override
  final SyncSource<WrapB, WrapA> sourceB;

  @override
  SyncConflictSolution? findSolution(SyncObject<WrapA> objectA, SyncObject<WrapB> objectB) => null;
}

String etagA(String content) => sha1.convert(utf8.encode('A$content')).toString();

String etagB(String content) => sha1.convert(utf8.encode('B$content')).toString();

String randomEtag() => sha1.convert(utf8.encode(Random().nextDouble().toString())).toString();

Future<void> main() async {
  group('sync', () {
    group('stub', () {
      test('all empty', () async {
        final state = TestSyncState({}, {});
        final sources = TestSyncSources.fromState(state);
        final journal = SyncJournal();

        final conflicts = await sync(sources, journal);
        expect(conflicts, isEmpty);
        expect(state.stateA, isEmpty);
        expect(state.stateB, isEmpty);
        expect(journal.entries, isEmpty);
      });

      group('copy', () {
        group('missing', () {
          test('to A', () async {
            const id = '123';
            const content = '456';
            final state = TestSyncState(
              {},
              {
                id: WrapB(content),
              },
            );
            final sources = TestSyncSources.fromState(state);
            final journal = SyncJournal();

            final conflicts = await sync(sources, journal);
            expect(conflicts, isEmpty);
            expect(state.stateA, hasLength(1));
            expect(state.stateA[id]!.content, content);
            expect(state.stateB, hasLength(1));
            expect(state.stateB[id]!.content, content);
            expect(journal.entries, hasLength(1));
            expect(journal.entries.tryFind(id)!.etagA, etagA(content));
            expect(journal.entries.tryFind(id)!.etagB, etagB(content));
          });

          test('to B', () async {
            const id = '123';
            const content = '456';
            final state = TestSyncState(
              {
                id: WrapA(content),
              },
              {},
            );
            final sources = TestSyncSources.fromState(state);
            final journal = SyncJournal();

            final conflicts = await sync(sources, journal);
            expect(conflicts, isEmpty);
            expect(state.stateA, hasLength(1));
            expect(state.stateA[id]!.content, content);
            expect(state.stateB, hasLength(1));
            expect(state.stateB[id]!.content, content);
            expect(journal.entries, hasLength(1));
            expect(journal.entries.tryFind(id)!.etagA, etagA(content));
            expect(journal.entries.tryFind(id)!.etagB, etagB(content));
          });
        });

        group('changed', () {
          test('to A', () async {
            const id = '123';
            const contentA = '456';
            const contentB = '789';
            final state = TestSyncState(
              {
                id: WrapA(contentA),
              },
              {
                id: WrapB(contentB),
              },
            );
            final sources = TestSyncSources.fromState(state);
            final journal = SyncJournal({
              SyncJournalEntry(id, etagA(contentA), randomEtag()),
            });

            final conflicts = await sync(sources, journal);
            expect(conflicts, isEmpty);
            expect(state.stateA, hasLength(1));
            expect(state.stateA[id]!.content, contentB);
            expect(state.stateB, hasLength(1));
            expect(state.stateB[id]!.content, contentB);
            expect(journal.entries, hasLength(1));
            expect(journal.entries.tryFind(id)!.etagA, etagA(contentB));
            expect(journal.entries.tryFind(id)!.etagB, etagB(contentB));
          });

          test('to B', () async {
            const id = '123';
            const contentA = '456';
            const contentB = '789';
            final state = TestSyncState(
              {
                id: WrapA(contentA),
              },
              {
                id: WrapB(contentB),
              },
            );
            final sources = TestSyncSources.fromState(state);
            final journal = SyncJournal({
              SyncJournalEntry(id, randomEtag(), etagB(contentB)),
            });

            final conflicts = await sync(sources, journal);
            expect(conflicts, isEmpty);
            expect(state.stateA, hasLength(1));
            expect(state.stateA[id]!.content, contentA);
            expect(state.stateB, hasLength(1));
            expect(state.stateB[id]!.content, contentA);
            expect(journal.entries, hasLength(1));
            expect(journal.entries.tryFind(id)!.etagA, etagA(contentA));
            expect(journal.entries.tryFind(id)!.etagB, etagB(contentA));
          });
        });
      });

      group('delete', () {
        test('from A', () async {
          const id = '123';
          const content = '456';
          final state = TestSyncState(
            {
              id: WrapA(content),
            },
            {},
          );
          final sources = TestSyncSources.fromState(state);
          final journal = SyncJournal({
            SyncJournalEntry(id, etagA(content), etagB(content)),
          });

          final conflicts = await sync(sources, journal);
          expect(conflicts, isEmpty);
          expect(state.stateA, isEmpty);
          expect(state.stateB, isEmpty);
          expect(journal.entries, isEmpty);
        });

        test('from B', () async {
          const id = '123';
          const content = '456';
          final state = TestSyncState(
            {},
            {
              id: WrapB(content),
            },
          );
          final sources = TestSyncSources.fromState(state);
          final journal = SyncJournal({
            SyncJournalEntry(id, etagA(content), etagB(content)),
          });

          final conflicts = await sync(sources, journal);
          expect(conflicts, isEmpty);
          expect(state.stateA, isEmpty);
          expect(state.stateB, isEmpty);
          expect(journal.entries, isEmpty);
        });

        test('from journal', () async {
          const id = '123';
          const content = '456';
          final state = TestSyncState({}, {});
          final sources = TestSyncSources.fromState(state);
          final journal = SyncJournal({
            SyncJournalEntry(id, etagA(content), etagB(content)),
          });

          final conflicts = await sync(sources, journal);
          expect(conflicts, isEmpty);
          expect(state.stateA, isEmpty);
          expect(state.stateB, isEmpty);
          expect(journal.entries, isEmpty);
        });
      });

      group('conflict', () {
        test('journal missing', () async {
          const id = '123';
          const content = '456';
          final state = TestSyncState(
            {
              id: WrapA(content),
            },
            {
              id: WrapB(content),
            },
          );
          final sources = TestSyncSources.fromState(state);
          final journal = SyncJournal();

          final conflicts = await sync(sources, journal);
          expect(conflicts, hasLength(1));
          expect(conflicts[0].type, SyncConflictType.bothNew);
          expect(state.stateA, hasLength(1));
          expect(state.stateA[id]!.content, content);
          expect(state.stateB, hasLength(1));
          expect(state.stateB[id]!.content, content);
          expect(journal.entries, isEmpty);
        });

        test('both changed', () async {
          const id = '123';
          const contentA = '456';
          const contentB = '789';
          final state = TestSyncState(
            {
              id: WrapA(contentA),
            },
            {
              id: WrapB(contentB),
            },
          );
          final sources = TestSyncSources.fromState(state);
          final journal = SyncJournal({
            SyncJournalEntry(id, randomEtag(), randomEtag()),
          });

          final conflicts = await sync(sources, journal);
          expect(conflicts, hasLength(1));
          expect(conflicts[0].type, SyncConflictType.bothChanged);
          expect(state.stateA, hasLength(1));
          expect(state.stateA[id]!.content, contentA);
          expect(state.stateB, hasLength(1));
          expect(state.stateB[id]!.content, contentB);
          expect(journal.entries, hasLength(1));
        });

        group('solution', () {
          group('journal missing', () {
            test('skip', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final state = TestSyncState(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final sources = TestSyncSources.fromState(state);
              final journal = SyncJournal();

              final conflicts = await sync(
                sources,
                journal,
                conflictSolutions: {
                  id: SyncConflictSolution.skip,
                },
              );
              expect(conflicts, isEmpty);
              expect(state.stateA, hasLength(1));
              expect(state.stateA[id]!.content, contentA);
              expect(state.stateB, hasLength(1));
              expect(state.stateB[id]!.content, contentB);
              expect(journal.entries, isEmpty);
            });

            test('overwrite A', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final state = TestSyncState(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final sources = TestSyncSources.fromState(state);
              final journal = SyncJournal();

              final conflicts = await sync(
                sources,
                journal,
                conflictSolutions: {
                  id: SyncConflictSolution.overwriteA,
                },
              );
              expect(conflicts, isEmpty);
              expect(state.stateA, hasLength(1));
              expect(state.stateA[id]!.content, contentB);
              expect(state.stateB, hasLength(1));
              expect(state.stateB[id]!.content, contentB);
              expect(journal.entries, hasLength(1));
              expect(journal.entries.tryFind(id)!.etagA, etagA(contentB));
              expect(journal.entries.tryFind(id)!.etagB, etagB(contentB));
            });

            test('overwrite B', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final state = TestSyncState(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final sources = TestSyncSources.fromState(state);
              final journal = SyncJournal();

              final conflicts = await sync(
                sources,
                journal,
                conflictSolutions: {
                  id: SyncConflictSolution.overwriteB,
                },
              );
              expect(conflicts, isEmpty);
              expect(state.stateA, hasLength(1));
              expect(state.stateA[id]!.content, contentA);
              expect(state.stateB, hasLength(1));
              expect(state.stateB[id]!.content, contentA);
              expect(journal.entries, hasLength(1));
              expect(journal.entries.tryFind(id)!.etagA, etagA(contentA));
              expect(journal.entries.tryFind(id)!.etagB, etagB(contentA));
            });
          });

          group('both changed', () {
            test('skip', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final state = TestSyncState(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final sources = TestSyncSources.fromState(state);
              final journal = SyncJournal({
                SyncJournalEntry(id, randomEtag(), randomEtag()),
              });

              final conflicts = await sync(
                sources,
                journal,
                conflictSolutions: {
                  id: SyncConflictSolution.skip,
                },
              );
              expect(conflicts, isEmpty);
              expect(state.stateA, hasLength(1));
              expect(state.stateA[id]!.content, contentA);
              expect(state.stateB, hasLength(1));
              expect(state.stateB[id]!.content, contentB);
              expect(journal.entries, hasLength(1));
            });

            test('overwrite A', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final state = TestSyncState(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final sources = TestSyncSources.fromState(state);
              final journal = SyncJournal({
                SyncJournalEntry(id, randomEtag(), randomEtag()),
              });

              final conflicts = await sync(
                sources,
                journal,
                conflictSolutions: {
                  id: SyncConflictSolution.overwriteA,
                },
              );
              expect(conflicts, isEmpty);
              expect(state.stateA, hasLength(1));
              expect(state.stateA[id]!.content, contentB);
              expect(state.stateB, hasLength(1));
              expect(state.stateB[id]!.content, contentB);
              expect(journal.entries, hasLength(1));
              expect(journal.entries.tryFind(id)!.etagA, etagA(contentB));
              expect(journal.entries.tryFind(id)!.etagB, etagB(contentB));
            });

            test('overwrite B', () async {
              const id = '123';
              const contentA = '456';
              const contentB = '789';
              final state = TestSyncState(
                {
                  id: WrapA(contentA),
                },
                {
                  id: WrapB(contentB),
                },
              );
              final sources = TestSyncSources.fromState(state);
              final journal = SyncJournal({
                SyncJournalEntry(id, randomEtag(), randomEtag()),
              });

              final conflicts = await sync(
                sources,
                journal,
                conflictSolutions: {
                  id: SyncConflictSolution.overwriteB,
                },
              );
              expect(conflicts, isEmpty);
              expect(state.stateA, hasLength(1));
              expect(state.stateA[id]!.content, contentA);
              expect(state.stateB, hasLength(1));
              expect(state.stateB[id]!.content, contentA);
              expect(journal.entries, hasLength(1));
              expect(journal.entries.tryFind(id)!.etagA, etagA(contentA));
              expect(journal.entries.tryFind(id)!.etagB, etagB(contentA));
            });
          });
        });
      });
    });
  });
}
