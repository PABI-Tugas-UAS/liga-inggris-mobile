String snakeCaseToPascalString(String snakeCase) {
  final List<String> words = snakeCase.split('_');
  final List<String> result = [];
  for (final word in words) {
    result.add(word[0].toUpperCase() + word.substring(1));
  }
  return result.join(' ');
}
