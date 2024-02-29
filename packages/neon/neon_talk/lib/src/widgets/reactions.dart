import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

/// Displays the [reactions] including the counts.
class TalkReactions extends StatelessWidget {
  /// Creates new Talk reactions.
  const TalkReactions({
    required this.reactions,
    super.key,
  });

  /// The reactions as the emoji and the count.
  final BuiltMap<String, int> reactions;

  @override
  Widget build(BuildContext context) {
    assert(reactions.isNotEmpty, 'Reactions must not be empty');

    return Row(
      children: reactions.entries
          .map<Widget>(
            (reaction) => Chip(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              avatar: Text(reaction.key),
              label: Text(reaction.value.toString()),
              padding: EdgeInsets.zero,
              labelPadding: const EdgeInsetsDirectional.fromSTEB(0, -2.5, 10, -2.5),
            ),
          )
          .intersperse(
            const SizedBox(
              width: 5,
            ),
          )
          .toList(),
    );
  }
}
