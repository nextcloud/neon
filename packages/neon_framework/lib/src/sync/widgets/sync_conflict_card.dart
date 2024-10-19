import 'package:flutter/material.dart';
import 'package:synchronize/synchronize.dart';

class SyncConflictCard extends StatelessWidget {
  const SyncConflictCard({
    required this.title,
    required this.child,
    required this.selected,
    required this.solution,
    required this.onSelected,
    super.key,
  });

  final String title;
  final Widget child;
  final bool selected;
  final SyncConflictSolution solution;
  final void Function(SyncConflictSolution solution) onSelected;

  @override
  Widget build(BuildContext context) => Card(
        shape: selected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              )
            : null,
        child: InkWell(
          onTap: () {
            onSelected(solution);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              child,
            ],
          ),
        ),
      );
}
