import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:words/dict/login_dict.dart';
import 'package:words/home/home.dart';
import 'package:words/login/model/respon.dart';
import 'package:words/login/register.dart';
import 'package:words/login/widget/app_icon.dart';
import 'package:words/login/widget/login_button.dart';
import 'package:words/login/widget/login_hint.dart';
import 'package:words/login/widget/login_input.dart';
import 'package:words/user/model/user.dart';
import 'package:words/utils/api_service.dart';

import '../utils/preference.dart';

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

  void _showLoginErrorSnackBar(BuildContext context, String message) {
    Get.snackbar(
      "登陆失败",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      _showLoginErrorSnackBar(context, "用户名或密码不能为空");
      return;
    }
    ApiService().loginUser(username, password).then((value) {
      var respone = LoginResponse.fromJson(value.data);
      if (respone.statusCode == 0) {
        setInt(Preference.userId, respone.userID);
        setString(Preference.userName, username);
        setString(Preference.password, password);
        setInt(Preference.planId, respone.planID);
        User user = User(
          id: respone.userID,
          name: username,
          planID: respone.planID,
        );
        if (respone.planID == 0) {
          Get.off(() => const LoginDict());
        } else {
          Get.off(() => HomePage(user: user));
        }
      } else {
        _showLoginErrorSnackBar(context, respone.statusMsg);
      }
    }).catchError(
      (error) {
        _showLoginErrorSnackBar(context, error.toString());
      },
    );
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
