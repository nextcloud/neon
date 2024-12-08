import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart' as core;

/// Widget used to render rich object parameters with unknown types.
class NeonRichObjectFallback extends StatelessWidget {
  /// Creates a new Neon rich object fallback
  const NeonRichObjectFallback({
    required this.parameter,
    super.key,
  });

  /// The parameter to display.
  final core.RichObjectParameter parameter;

  @override
  Widget build(BuildContext context) {
    final iconUrl = parameter.iconUrl;

    EdgeInsetsGeometry? labelPadding;
    Widget? avatar;
    if (iconUrl != null) {
      labelPadding = const EdgeInsetsDirectional.only(end: 8);
      avatar = Padding(
        padding: const EdgeInsets.all(4),
        child: CircleAvatar(
          child: ClipOval(
            child: NeonUriImage(
              uri: Uri.parse(iconUrl),
              account: NeonProvider.of<Account>(context),
            ),
          ),
        ),
      );
    }

    return ActionChip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.zero,
      labelPadding: labelPadding,
      avatar: avatar,
      label: Text(parameter.name),
      onPressed: () async {
        final link = parameter.link;
        if (link != null) {
          await launchUrl(NeonProvider.of<Account>(context), link);
        }
      },
    );
  }
}
