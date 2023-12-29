import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:words/login/model/respon.dart';
import 'package:words/login/widget/app_icon.dart';
import 'package:words/login/widget/login_button.dart';
import 'package:words/login/widget/login_hint.dart';
import 'package:words/login/widget/login_input.dart';
import 'package:words/net/api_service.dart';

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

  void _showRegisterErrorSnackBar(BuildContext context, String message) {
    Get.snackbar(
      "注册失败",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void _judgeRegister() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String repeat = _repeatController.text;
    if (username.isEmpty || password.isEmpty || repeat.isEmpty) {
      _showRegisterErrorSnackBar(context, "用户名或密码不能为空");
      return;
    } else if (password != repeat) {
      _showRegisterErrorSnackBar(context, "两次输入的密码不一致");
      return;
    } else {
      register();
    }
  }

  void register() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    ApiService().registerUser(username, password).then((value) {
      var respone = LoginResponse.fromJson(value.data);
      if (respone.statusCode == 0) {
        Get.back();
      } else {
        _showRegisterErrorSnackBar(context, respone.statusMsg);
      }
    }).catchError(
      (error) {
        _showRegisterErrorSnackBar(context, error.toString());
      },
    );
  }

  Widget registerContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppIconWidget(),
        const Padding(
          padding: EdgeInsets.only(bottom: 30),
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
        const Text(
          "密码长度为6-16位，且不能包含空格",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 23),
        ),
        LoginInput(
          prefixIcon: MingCuteIcons.mgc_repeat_fill,
          hint: "请重复密码",
          inputController: _repeatController,
          isHidden: false,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 35),
        ),
        LoginButton(
          buttonText: "确认注册",
          funcOnTap: () {
            _judgeRegister();
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
