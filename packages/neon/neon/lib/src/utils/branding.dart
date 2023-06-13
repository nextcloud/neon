part of '../../neon.dart';

class Branding {
  Branding({
    required this.name,
    required this.logo,
    this.legalese,
  });

  final String name;

  final Widget logo;

  final String? legalese;
}
