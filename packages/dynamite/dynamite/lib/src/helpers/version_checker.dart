import 'package:build/build.dart' hide log;
import 'package:dynamite/src/helpers/logger.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

// Also update the README.md if you change this.
final dependencies = {
  'built_collection': Version.parse('5.0.0'),
  'built_value': Version.parse('8.9.0'),
  'collection': Version.parse('1.0.0'),
  'dynamite_runtime': Version.parse('0.3.0'),
  'http': Version.parse('1.2.0'),
  'meta': Version.parse('1.0.0'),
  'uri': Version.parse('1.0.0'),
};

// Also update the README.md if you change this.
final devDependencies = {
  'built_value_generator': Version.parse('8.9.0'),
};

/// Checks whether the correct version of the dependencies are present in the pubspec.yaml file.
Future<bool> helperVersionCheck(BuildStep buildStep) async {
  final pubspecAsset = AssetId(buildStep.inputId.package, 'pubspec.yaml');

  if (!await buildStep.canRead(pubspecAsset)) {
    log.severe('Failed to read the pubspec.yaml file. Version constraints of required packages can not be validated.');
    return true;
  }

  final pubspecContent = await buildStep.readAsString(pubspecAsset);
  final pubspec = Pubspec.parse(pubspecContent, sourceUrl: pubspecAsset.uri);

  var hasFatal = false;

  for (final constraint in dependencies.entries) {
    final isFatal = _validateVersion(pubspec.dependencies, constraint.key, constraint.value);

    if (isFatal) {
      hasFatal = true;
    }
  }

  for (final constraint in devDependencies.entries) {
    final isFatal = _validateVersion(pubspec.devDependencies, constraint.key, constraint.value);

    if (isFatal) {
      hasFatal = true;
    }
  }

  return !hasFatal;
}

bool _validateVersion(
  Map<String, Dependency> dependencies,
  String packageName,
  Version minVersion,
) {
  final dependency = dependencies[packageName];
  final maxVersion = minVersion.nextBreaking;

  if (dependency == null) {
    log.info(
      'Could not find the dependency on `$packageName` in pubspec.yaml file. Compatibility check is being skipped.',
    );

    return false;
  } else if (dependency is HostedDependency) {
    final constraint = dependency.version;
    final invalidConstraintMessage =
        'The version constraint $constraint on `$packageName` allows versions before $minVersion or after $maxVersion which is not allowed.';

    if (constraint is Version && (constraint < minVersion || constraint > maxVersion)) {
      log.severe(invalidConstraintMessage);
      return true;
    }

    final range = constraint as VersionRange;
    final rangeMin = range.min;
    final rangeMax = range.max;

    if (rangeMin == null || rangeMax == null || rangeMin < minVersion || rangeMax > maxVersion) {
      log.severe(invalidConstraintMessage);
      return true;
    }
  }

  return false;
}
