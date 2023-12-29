const docsSeparator = '///';

Iterable<String> descriptionToDocs(final String? description) sync* {
  if (description != null && description.isNotEmpty) {
    for (final line in description.split('\n')) {
      final buffer = StringBuffer('$docsSeparator ')..write(line);

      if (!line.endsWith('.') && line.isNotEmpty) {
        buffer.write('.');
      }

      yield buffer.toString();
    }
  }
}
