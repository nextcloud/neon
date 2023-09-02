const docsSeparator = '///';

Iterable<String> descriptionToDocs(final String? description) sync* {
  if (description != null && description.isNotEmpty) {
    for (final line in description.split('\n')) {
      yield '$docsSeparator $line';
    }
  }
}
