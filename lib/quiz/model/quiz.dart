class Quiz {
  String question;
  List<String> options;
  List<String> meanings;
  int correctOption;
  String explanation;

  Quiz({
    required this.question,
    required this.options,
    required this.meanings,
    required this.correctOption,
    required this.explanation,
  });
}
