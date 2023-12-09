import 'package:flutter/material.dart';

class LoginHint extends StatefulWidget {
  final String hintText;
  final String buttonText;
  final Function funcOnTap;
  const LoginHint({
    super.key,
    required this.hintText,
    required this.buttonText,
    required this.funcOnTap,
  });

  @override
  State<LoginHint> createState() => _LoginHintState();
}

class _LoginHintState extends State<LoginHint> {
  static const Color textButtonColor = Colors.blue;
  static const double fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${widget.hintText} ",
          style: const TextStyle(
            fontSize: fontSize,
          ),
        ),
        GestureDetector(
          onTap: () {
            // TODO
            widget.funcOnTap();
          },
          child: Text(
            widget.buttonText,
            style: const TextStyle(
              fontSize: fontSize,
              color: textButtonColor,
            ),
          ),
        )
      ],
    );
  }
}
