import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:words/page/widget/login_button.dart';
import 'package:words/page/widget/login_hint.dart';
import 'package:words/page/widget/login_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final double widthOfSquare = 40.0;
  // Controller
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatController = TextEditingController();

  void register() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String repeat = _repeatController.text;
    // TODO
    username.isEmpty;
    password.isEmpty;
    repeat.isEmpty;
  }

  Widget registerContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
          padding: EdgeInsets.only(bottom: 30),
        ),
        LoginInput(
          prefixIcon: MingCuteIcons.mgc_repeat_fill,
          hint: "请重复密码",
          inputController: _passwordController,
          isHidden: false,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 45),
        ),
        LoginButton(
          buttonText: "确认注册",
          funcOnTap: () {
            // TODO
            Get.back();
          },
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
        ),
        LoginHint(
          hintText: "已拥有账户？",
          buttonText: "登陆",
          funcOnTap: () {
            Get.back();
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
        child: registerContent(),
      ),
    );
  }
}
