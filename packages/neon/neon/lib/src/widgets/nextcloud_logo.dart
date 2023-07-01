import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NextcloudLogo extends StatelessWidget {
  const NextcloudLogo({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => SvgPicture.asset(
        'assets/logo_nextcloud.svg',
        package: 'neon',
        width: 100,
        height: 100,
      );
}
