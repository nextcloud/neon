import 'dart:ui';

import 'package:neon/theme.dart';
import 'package:vector_graphics/vector_graphics.dart';

const neonTheme = NeonTheme(
  branding: branding,
  colorScheme: colorScheme,
);

const branding = Branding(
  name: 'Nextcloud Neon',
  logo: VectorGraphic(
    width: 100,
    height: 100,
    loader: AssetBytesLoader(
      'assets/logo.svg.vec',
    ),
  ),
  legalese: 'Copyright © 2023, provokateurin\nUnder GPLv3 license',
);

const colorScheme = NeonColorScheme(
  primary: Color(0xFFF37736),
);
