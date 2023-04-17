import 'package:flutter_svg/flutter_svg.dart';
import 'package:neon/neon.dart';

Branding getNeonBranding() => Branding(
      name: 'Nextcloud Neon',
      legalese: 'Copyright © 2023, provokateurin\nUnder GPLv3 license',
      buildLogo: (final context, final size) => SvgPicture.asset(
        'assets/logo_neon.svg',
        width: size.width,
        height: size.height,
      ),
    );
