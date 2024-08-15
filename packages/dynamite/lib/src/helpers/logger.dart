import 'package:logging/logging.dart';

final log = Logger('build.dynamite');

DynamiteLogger dynamiteLog = DynamiteLogger._();

class DynamiteLogger {
  DynamiteLogger._();

  static bool _integerPrecision = false;

  void integerPrecision() {
    if (_integerPrecision) {
      return;
    }

    log.warning(
      'All integers are represented as `int` meaning 64bit precision in the VM/wasm and 53bit precision on js.',
    );
    _integerPrecision = true;
  }

  static bool _requiredParameters = false;

  void requiredParameters() {
    if (_requiredParameters) {
      return;
    }

    log.severe('Required parameters should not specify default values.');
    _requiredParameters = true;
  }

  static bool _multipleMimeType = false;

  void multipleMimeTypes() {
    if (_multipleMimeType) {
      return;
    }

    log.warning('Can not work with multiple mime types right now. Using the first supported.');
    _multipleMimeType = true;
  }

  static bool _multipleResponseSchemas = false;

  void multipleResponseSchemas() {
    if (_multipleResponseSchemas) {
      return;
    }

    log.warning('Can not work with more than one response schema. Generating the first one');
    _multipleResponseSchemas = true;
  }
}
