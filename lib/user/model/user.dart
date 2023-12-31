class User {
  String id;
  String name;
  int planID;

  User({
    required this.id,
    required this.name,
    required this.planID,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      planID: json['planID'],
    );
  }
}
