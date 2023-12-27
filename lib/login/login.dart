import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:words/home/home.dart';
import 'package:words/login/register.dart';
import 'package:words/login/widget/app_icon.dart';
import 'package:words/login/widget/login_button.dart';
import 'package:words/login/widget/login_hint.dart';
import 'package:words/login/widget/login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final double widthOfSquare = 40.0;
  // Controller
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    // TODO
    username.isEmpty;
    password.isEmpty;
    Get.off(const HomePage());
  }

  Widget loginContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppIconWidget(),
        const Padding(
          padding: EdgeInsets.only(bottom: 50),
        ),
        LoginInput(
          prefixIcon: MingCuteIcons.mgc_user_2_fill,
          hint: "请输入用户名",
          inputController: _usernameController,
          isHidden: true,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 30),
        ),
        LoginInput(
          prefixIcon: MingCuteIcons.mgc_key_2_fill,
          hint: "请输入密码",
          inputController: _passwordController,
          isHidden: false,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 80),
        ),
        LoginButton(buttonText: "登陆", funcOnTap: login),
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
        ),
        LoginHint(
          hintText: "还没有账户？",
          buttonText: "注册",
          funcOnTap: () {
            Get.to(
              () => const RegisterPage(),
              transition: Transition.downToUp,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 防止输入框随着键盘弹出而移动
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          left: widthOfSquare,
          right: widthOfSquare,
          // top: kToolbarHeight,
        ),
        child: loginContent(),
      ),
    );
  }
}
