class LoginResponse {
  final int statusCode;
  final String statusMsg;
  final int userID;
  final String userName;
  final int planID;

  LoginResponse({
    required this.statusCode,
    required this.statusMsg,
    required this.userID,
    required this.userName,
    required this.planID,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['StatusCode'],
      statusMsg: json['StatusMsg'],
      userID: json['UserID'],
      userName: json['UserName'],
      planID: json['PlanID'],
    );
  }
}
