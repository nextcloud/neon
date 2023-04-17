part of '../../neon.dart';

class Branding {
  Branding({
    required this.name,
    required this.buildLogo,
    this.legalese,
  });

  final String name;

  final Widget Function(BuildContext, Size) buildLogo;

  final String? legalese;
}
