import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final double widthOfSquare = 32.0;
  // Controller
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    // TODO
    username.isEmpty;
    password.isEmpty;
  }

  Widget loginContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _usernameController,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: widthOfSquare,
          right: widthOfSquare,
          top: kToolbarHeight,
        ),
        child: Column(children: []),
      ),
    );
  }
}
