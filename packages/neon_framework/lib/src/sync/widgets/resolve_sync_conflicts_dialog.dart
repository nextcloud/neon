import 'package:flutter/material.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/sync/models/conflicts.dart';
import 'package:neon_framework/src/sync/widgets/sync_conflict_card.dart';
import 'package:neon_framework/src/theme/dialog.dart';
import 'package:synchronize/synchronize.dart';

class NeonResolveSyncConflictsDialog<T1, T2> extends StatefulWidget {
  const NeonResolveSyncConflictsDialog({
    required this.conflicts,
    super.key,
  });

  final SyncConflicts<T1, T2> conflicts;

  @override
  State<NeonResolveSyncConflictsDialog<T1, T2>> createState() => _NeonResolveSyncConflictsDialogState<T1, T2>();
}

class _NeonResolveSyncConflictsDialogState<T1, T2> extends State<NeonResolveSyncConflictsDialog<T1, T2>> {
  var _index = 0;
  final _solutions = <String, SyncConflictSolution>{};

  SyncConflict<T1, T2> get conflict => widget.conflicts.conflicts[_index];

  SyncConflictSolution? get selectedSolution => _solutions[conflict.id];

  void onSolution(SyncConflictSolution solution) {
    setState(() {
      _solutions[conflict.id] = solution;
    });
  }

  bool get isFirst => _index == 0;
  bool get isLast => _index == widget.conflicts.conflicts.length - 1;

  @override
  Widget build(BuildContext context) {
    final body = Column(
      children: [
        Text(
          NeonLocalizations.of(context).syncResolveConflictsTitle(
            widget.conflicts.conflicts.length,
            NeonLocalizations.of(context).appImplementationName(widget.conflicts.implementation.id),
          ),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SyncConflictCard(
              title: NeonLocalizations.of(context).syncResolveConflictsLocal,
              solution: SyncConflictSolution.overwriteA,
              selected: selectedSolution == SyncConflictSolution.overwriteA,
              onSelected: onSolution,
              child: widget.conflicts.implementation.getConflictDetailsLocal(context, conflict.objectB.data),
            ),
            SyncConflictCard(
              title: NeonLocalizations.of(context).syncResolveConflictsRemote,
              solution: SyncConflictSolution.overwriteB,
              selected: selectedSolution == SyncConflictSolution.overwriteB,
              onSelected: onSolution,
              child: widget.conflicts.implementation.getConflictDetailsRemote(context, conflict.objectA.data),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                if (isFirst) {
                  Navigator.of(context).pop();
                } else {
                  setState(() {
                    _index--;
                  });
                }
              },
              child: Text(
                isFirst ? NeonLocalizations.of(context).actionCancel : NeonLocalizations.of(context).actionPrevious,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isLast) {
                  Navigator.of(context).pop(_solutions);
                } else {
                  setState(() {
                    _index++;
                  });
                }
              },
              child: Text(
                isLast ? NeonLocalizations.of(context).actionFinish : NeonLocalizations.of(context).actionNext,
              ),
            ),
          ],
        ),
      ],
    );

    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(24),
          constraints: NeonDialogTheme.of(context).constraints,
          child: body,
        ),
      ),
    );
  }
}
