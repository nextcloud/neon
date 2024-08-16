import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart' as core;

/// Widget for displaying a preview of a link reference.
class TalkReferencePreview extends StatelessWidget {
  /// Creates a new Talk reference preview.
  const TalkReferencePreview({
    required this.url,
    required this.openGraphObject,
    super.key,
  });

  /// URL of the reference.
  final String url;

  /// Open Graph object of the reference.
  final core.OpenGraphObject? openGraphObject;

  @override
  Widget build(BuildContext context) {
    if (openGraphObject != null) {
      final thumb = openGraphObject!.thumb;
      final title = openGraphObject!.name;
      final subtitle = openGraphObject!.description;

      Widget child = Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.replaceAll('\n', ' '),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (subtitle != null)
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            Text(
              url,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      );

      if (thumb != null) {
        child = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size.square(100)),
              child: NeonUriImage(
                uri: Uri.parse(thumb),
                fit: BoxFit.cover,
                account: NeonProvider.of<Account>(context),
              ),
            ),
            Flexible(
              child: child,
            ),
          ],
        );
      }

      return Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondaryContainer,
            width: 2,
          ),
        ),
        child: InkWell(
          onTap: () async => launchUrl(NeonProvider.of<Account>(context), url),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 100,
            ),
            child: child,
          ),
        ),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(8),
        child: CircularProgressIndicator(),
      );
    }
  }
}
