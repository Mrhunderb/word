class Today {
  final int nLearn;
  final int nReview;

  Today({
    required this.nLearn,
    required this.nReview,
  });

  factory Today.fromJson(Map<String, dynamic> json) {
    return Today(
      nLearn: json['n_learn'],
      nReview: json['n_review'],
    );
  }
}
