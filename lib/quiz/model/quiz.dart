class Quiz {
  int id;
  List<String> options;
  int correctOption;

  Quiz({
    required this.id,
    required this.options,
    required this.correctOption,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    List<String> options = [
      json['OptionA'],
      json['OptionB'],
      json['OptionC'],
      json['OptionD'],
    ];
    return Quiz(
      id: json['QuizID'],
      options: options,
      correctOption: json['CorrectOption'],
    );
  }
}
