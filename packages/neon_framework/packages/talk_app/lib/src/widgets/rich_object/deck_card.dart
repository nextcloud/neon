import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/core.dart' as core;

/// Widget to display a Deck card from a rich object.
class TalkRichObjectDeckCard extends StatelessWidget {
  /// Creates a new Talk rich object Deck card.
  const TalkRichObjectDeckCard({
    required this.parameter,
    super.key,
  });

  /// The parameter to display.
  final core.RichObjectParameter parameter;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () async {
            await launchUrl(NeonProvider.of<Account>(context), parameter.link!);
          },
          child: ListTile(
            // TODO: Use the actual Deck logo
            leading: const Icon(MdiIcons.cardMultiple),
            title: Text(parameter.name),
            subtitle: Text('${parameter.boardname!}: ${parameter.stackname!}'),
          ),
        ),
      ),
    );
  }
}
