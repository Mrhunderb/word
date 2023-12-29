class LoginResponse {
  final int statusCode;
  final String statusMsg;
  final int userID;
  final String userName;

  LoginResponse({
    required this.statusCode,
    required this.statusMsg,
    required this.userID,
    required this.userName,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['StatusCode'],
      statusMsg: json['StatusMsg'],
      userID: json['UserID'],
      userName: json['UserName'],
    );
  }
}
