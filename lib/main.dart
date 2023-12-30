import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:words/home/home.dart';
import 'package:words/theme.dart';
import 'package:words/login/login.dart';
import 'package:words/utils/preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  String userName = getString(Preference.userName);
  String password = getString(Preference.password);
  if (userName.isNotEmpty && password.isNotEmpty) {
    runApp(const MyApp(isLogin: true));
  } else {
    runApp(const MyApp(isLogin: false));
  }
}

class MyApp extends StatefulWidget {
  final bool isLogin;
  const MyApp({
    super.key,
    required this.isLogin,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Word App',
      theme: demoBlue,
      home: widget.isLogin ? const HomePage() : const LoginPage(),
    );
  }
}
