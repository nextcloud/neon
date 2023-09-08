import 'package:flutter/widgets.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:vector_graphics/vector_graphics.dart';

class NextcloudLogo extends StatelessWidget {
  const NextcloudLogo({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => VectorGraphic(
        width: 100,
        height: 100,
        loader: const AssetBytesLoader(
          'assets/logo_nextcloud.svg.vec',
          packageName: 'neon',
        ),
        semanticsLabel: AppLocalizations.of(context).nextcloudLogo,
      );
}
