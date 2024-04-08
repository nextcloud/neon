const _docsSeparator = '///';

/// Escapes the given [description] with a `///` for dart doc comments.
///
/// All user generated strings SHOULD be formatted with [formatDescription].
Iterable<String> escapeDescription(String? description) sync* {
  if (description == null || description.isEmpty) {
    return;
  }

  final lines = description.split('\n');

  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];

    if (i == lines.length - 1 && line.isEmpty) {
      break;
    }

    yield '$_docsSeparator $line';
  }
}

/// Formats the given [description] in the dart doc style.
///
/// Non empty lines that do not end with a `:` will have a period `.` appended.
/// If the input description is either null or empty `null` will be returned.
/// The formatted description will never be the empty word `''`.
///
/// See:
///   * use [escapeDescription] to escape a doc comment with the `///`.
String? formatDescription(String? description) {
  if (description == null || description.isEmpty) {
    return null;
  }

  final buffer = StringBuffer();
  final lines = description.split('\n');
  for (var i = 0; i < lines.length; i++) {
    final line = lines[i].trim();
    buffer.write(line);

    if (!line.endsWith('.') && !line.endsWith(':') && line.isNotEmpty) {
      buffer.write('.');
    }

    if (i == lines.length - 1) {
      break;
    }

    buffer.write('\n');
  }

  final formatted = buffer.toString();
  if (formatted.isEmpty) {
    return null;
  }

  return formatted;
}
