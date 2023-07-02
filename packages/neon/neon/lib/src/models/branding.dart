import 'package:flutter/widgets.dart';

@immutable
class Branding {
  const Branding({
    required this.name,
    required this.logo,
    this.legalese,
  });

  final String name;

  final Widget logo;

  final String? legalese;
}
