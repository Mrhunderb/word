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

  // factory Word.fromJson(Map<String, dynamic> json) {
  //   return Word(
  //     word: json['word'],
  //     pronunciation: json['pronunciation'],
  //     definition: json['definition'],
  //     example: json['example'],
  //   );
  // }
}
