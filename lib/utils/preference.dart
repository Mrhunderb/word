import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

enum Preference {
  userId(key: "userId", type: "int"), // 用户ID
  userName(key: "userName", type: "String"), // 帐号
  password(key: "password", type: "String"), // 密码
  planId(key: "planId", type: "int"),
  lastIndex(key: "lastIndex", type: "int");

  const Preference({required this.key, this.type = "String"});
  factory Preference.fromKey(String key) {
    return values.firstWhere((e) => e.key == key);
  }

  final String key;
  final String type;
}

String getString(Preference key) {
  return prefs.getString(key.key) ?? "";
}

bool getBool(Preference key) {
  return prefs.getBool(key.key) ?? false;
}

int getInt(Preference key) {
  return prefs.getInt(key.key) ?? 0;
}

void setString(Preference key, String value) {
  prefs.setString(key.key, value);
  prefs.reload();
}

void setBool(Preference key, bool value) {
  prefs.setBool(key.key, value);
  prefs.reload();
}

void setInt(Preference key, int value) {
  prefs.setInt(key.key, value);
  prefs.reload();
}

void prefrenceClear() {
  prefs.clear();
  prefs.reload();
}
