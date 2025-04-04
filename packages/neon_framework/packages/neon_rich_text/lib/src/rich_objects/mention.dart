import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart' as core;

/// Displays a mention chip from a rich object.
class NeonRichObjectMention extends StatelessWidget {
  /// Create a new Neon rich object mention.
  const NeonRichObjectMention({
    required this.parameter,
    super.key,
  });

  /// The parameter to display.
  final core.RichObjectParameter parameter;

  @override
  Widget build(BuildContext context) {
    final Widget child;
    final bool highlight;

    switch (parameter.type) {
      case core.RichObjectParameter_Type.user:
        final account = NeonProvider.of<Account>(context);

        highlight = account.username == parameter.id;
        child = NeonUserAvatar(
          username: parameter.id,
          account: NeonProvider.of<Account>(context),
        );
      case core.RichObjectParameter_Type.call:
        highlight = true;
        child = CircleAvatar(
          child: ClipOval(
            child: NeonUriImage(
              uri: Uri.parse(parameter.iconUrl!),
              account: NeonProvider.of<Account>(context),
            ),
          ),
        );
      case core.RichObjectParameter_Type.guest:
        // TODO: Add highlighting when the mention is about the current guest user.
        highlight = false;
        child = CircleAvatar(
          child: Icon(AdaptiveIcons.person),
        );
      case core.RichObjectParameter_Type.userGroup:
        final userDetailsBloc = NeonProvider.of<UserDetailsBloc>(context);
        final groups = userDetailsBloc.userDetails.valueOrNull?.data?.groups ?? BuiltList();

        highlight = groups.contains(parameter.id);
        child = CircleAvatar(
          child: Icon(AdaptiveIcons.group),
        );
      default:
        child = throw UnimplementedError('Unknown mention type: $parameter'); // coverage:ignore-line
    }

    Color? backgroundColor;
    Color? foregroundColor;
    if (highlight) {
      backgroundColor = Theme.of(context).colorScheme.primary;
      foregroundColor = Theme.of(context).colorScheme.onPrimary;
    }

    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsetsDirectional.only(
        end: 4,
        start: -4,
        top: -2,
        bottom: -2,
      ),
      avatar: Padding(
        padding: const EdgeInsets.all(6),
        child: child,
      ),
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      label: Text(
        parameter.name,
        style: TextStyle(
          color: foregroundColor,
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
