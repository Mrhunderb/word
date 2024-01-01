import 'package:words/quiz/model/quiz.dart';

class Word {
  final int id;
  final String word;
  final String pronunciation;
  final List<String> definition;
  final List<String> enExample;
  final List<String> chExample;
  final Quiz quiz;

  Word({
    required this.id,
    required this.word,
    required this.pronunciation,
    required this.definition,
    required this.enExample,
    required this.chExample,
    required this.quiz,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    // Extracting data from the JSON map
    int id = json['WordID'] ?? 0;
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
        id: id,
        word: word,
        pronunciation: pronunciation,
        definition: definitions,
        enExample: enExamples,
        chExample: chExamples,
        quiz: Quiz.fromJson(json['Quiz'] ?? {}));
  }
}
