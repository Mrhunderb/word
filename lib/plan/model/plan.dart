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
      planID: json['PlanID'],
      mode: json['Mode'],
      nLearn: json['NLearn'],
      nReview: json['NReview'],
      userID: json['UserID'],
      dictID: json['DictID'],
      progress: json['Progress'],
    );
  }
}
