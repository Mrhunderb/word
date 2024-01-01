class Plan {
  int planID;
  int mode;
  int nLearn;
  int nReview;
  int userID;
  int dictID;
  int progress;

  Plan({
    required this.planID,
    required this.mode,
    required this.nLearn,
    required this.nReview,
    required this.userID,
    required this.dictID,
    required this.progress,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      planID: json['PlanID'] ?? 0,
      mode: json['Mode'] ?? 0,
      nLearn: json['NLearn'] ?? 30,
      nReview: json['NReview'] ?? 30,
      userID: json['UserID'] ?? 0,
      dictID: json['DictID'] ?? 0,
      progress: json['Progress'] ?? 0,
    );
  }
}
