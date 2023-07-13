import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:neon/theme.dart';

final neonTheme = NeonTheme(
  branding: branding,
  colorScheme: colorScheme,
);

final branding = Branding(
  name: 'Nextcloud Neon',
  logo: SvgPicture.asset(
    'assets/logo.svg',
    width: 100,
    height: 100,
  ),
  legalese: 'Copyright © 2023, provokateurin\nUnder GPLv3 license',
);

const colorScheme = NeonColorScheme(
  primary: Color(0xFFF37736),
);
