import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:rxdart/rxdart.dart';

/// The Bloc responsible for loading URL references.
@sealed
abstract interface class ReferencesBloc implements Bloc {
  factory ReferencesBloc({
    required Account account,
    required BehaviorSubject<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilities,
  }) = _ReferencesBloc;

  /// Loads new references from the given URLs.
  void loadReferences(BuiltList<String> references);

  /// The Regex used for extracting references.
  BehaviorSubject<Result<RegExp?>> get referenceRegex;

  /// Map of resolved references and their details.
  BehaviorSubject<BuiltMap<String, Result<core.Reference>>> get references;
}

class _ReferencesBloc extends Bloc implements ReferencesBloc {
  _ReferencesBloc({
    required this.account,
    required this.capabilities,
  }) {
    capabilities.listen((result) {
      referenceRegex.add(
        result.transform((data) {
          final regex = data.capabilities.coreCapabilities?.core.referenceRegex;
          if (regex != null) {
            return RegExp(
              regex,
              multiLine: true,
              caseSensitive: false,
            );
          }

          return null;
        }),
      );
    });
  }

  final Account account;
  final BehaviorSubject<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilities;

  @override
  final log = Logger('ReferencesBloc');

  @override
  final referenceRegex = BehaviorSubject.seeded(Result.success(null));

  @override
  final references = BehaviorSubject.seeded(BuiltMap());

  @override
  void dispose() {
    unawaited(referenceRegex.close());
    unawaited(references.close());
  }

  @override
  Future<void> loadReferences(BuiltList<String> references) async {
    // Skip references that were already resolved successfully.
    final filteredReferences = references.rebuild((b) {
      b.removeWhere((reference) => this.references.value[reference]?.hasSuccessfulData ?? false);
    });
    if (filteredReferences.isEmpty) {
      return;
    }

    this.references.add(
          this.references.value.rebuild((b) {
            for (final reference in filteredReferences) {
              b[reference] = b[reference]?.asLoading() ?? Result.loading();
            }
          }),
        );

    try {
      await RequestManager.instance.timeout(() async {
        final response = await account.client.core.referenceApi.resolve(
          $body: core.ReferenceApiResolveRequestApplicationJson(
            (b) => b
              ..references.replace(filteredReferences)
              // Just always load all references.
              // If less are desired simply pass only the ones you want or filter the results.
              // TBH I don't understand why this logic is handled by the API and not the clients.
              ..limit = filteredReferences.length,
          ),
        );

        this.references.add(
              this.references.value.rebuild((b) {
                for (final entry in response.body.ocs.data.references.entries) {
                  b[entry.key] = Result.success(entry.value);
                }
              }),
            );
      });
    } on Exception catch (error, stackTrace) {
      log.info(
        'Error resolving references',
        error,
        stackTrace,
      );

      final result = Result<core.Reference>.error(error);

      this.references.add(
            this.references.value.rebuild((b) {
              for (final reference in filteredReferences) {
                b[reference] = result;
              }
            }),
          );
    }
  }
}
