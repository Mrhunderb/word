class Word {
  final String word;
  final String pronunciation;
  final List<String> definition;
  final List<String> enExample;
  final List<String> chExample;

  Word({
    required this.word,
    required this.pronunciation,
    required this.definition,
    required this.enExample,
    required this.chExample,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    // Extracting data from the JSON map
    String word = json['Word'] ?? '';
    String pronunciation = json['Pronunciation'] ?? '';

    // Extracting definition strings from the list of definitions
    List<String> definitions = [];
    for (var definition in json['Definition'] ?? []) {
      definitions.add(
          definition['PartOfSpeech'] + '. ' + definition['Definition'] ?? '');
    }

    // Extracting English example strings from the list of examples
    List<String> enExamples = [];
    for (var example in json['Example'] ?? []) {
      enExamples.add(example['EnExample'] ?? '');
    }

    // Extracting Chinese example strings from the list of examples
    List<String> chExamples = [];
    for (var example in json['Example'] ?? []) {
      chExamples.add(example['ChExample'] ?? '');
    }

    // Creating and returning a Word object
    return Word(
      word: word,
      pronunciation: pronunciation,
      definition: definitions,
      enExample: enExamples,
      chExample: chExamples,
    );
  }
}
