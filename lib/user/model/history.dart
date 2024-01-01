class MyHistory {
  int totalWords;
  int totalDays;

  MyHistory({
    required this.totalWords,
    required this.totalDays,
  });

  factory MyHistory.fromJson(Map<String, dynamic> json) {
    return MyHistory(
      totalWords: json['total_words'],
      totalDays: json['total_days'],
    );
  }
}
