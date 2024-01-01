import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:words/home/home.dart';
import 'package:words/theme.dart';
import 'package:words/login/login.dart';
import 'package:words/user/model/user.dart';
import 'package:words/utils/preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  String userName = getString(Preference.userName);
  String password = getString(Preference.password);
  int userId = getInt(Preference.userId);
  int planId = getInt(Preference.planId);
  User user = User(id: userId, name: userName, planID: planId);
  if (userName.isNotEmpty && password.isNotEmpty) {
    runApp(MyApp(isLogin: true, user: user));
  } else {
    runApp(MyApp(isLogin: false, user: user));
  }
}

class MyApp extends StatefulWidget {
  final bool isLogin;
  final User user;
  const MyApp({super.key, required this.isLogin, required this.user});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Word App',
      theme: demoBlue,
      home: widget.isLogin ? HomePage(user: widget.user) : const LoginPage(),
    );
  }
}
