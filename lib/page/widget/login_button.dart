import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final String buttonText;
  final Function funcOnTap;

  const LoginButton({
    super.key,
    required this.buttonText,
    required this.funcOnTap,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  static const double _buttomRadius = 20.0;
  static const double _buttonHeight = 60.0;
  static const double _buttonWidth = double.infinity;
  static const double _buttonTextSize = 24;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        minimumSize: const Size(_buttonWidth, _buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_buttomRadius),
        ),
      ),
      onPressed: () {
        widget.funcOnTap();
      },
      child: Text(
        widget.buttonText,
        style: const TextStyle(
          fontSize: _buttonTextSize,
        ),
      ),
    );
  }
}
