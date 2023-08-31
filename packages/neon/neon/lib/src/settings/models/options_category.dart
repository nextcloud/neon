import 'package:meta/meta.dart';
import 'package:neon/src/models/label_builder.dart';

@immutable
class OptionsCategory {
  const OptionsCategory({
    required this.name,
  });

  final LabelBuilder name;
}
