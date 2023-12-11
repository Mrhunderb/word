class Word {
  final String word;
  final String pronunciation;
  final String definition;
  final String example;

  Word({
    required this.word,
    required this.pronunciation,
    required this.definition,
    required this.example,
  });

  // factory Word.fromJson(Map<String, dynamic> json) {
  //   return Word(
  //     word: json['word'],
  //     pronunciation: json['pronunciation'],
  //     definition: json['definition'],
  //     example: json['example'],
  //   );
  // }
}
