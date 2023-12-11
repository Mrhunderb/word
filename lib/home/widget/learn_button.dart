import 'package:flutter/material.dart';

class LearnButton extends StatefulWidget {
  final String buttonText;
  final Function funcOnTap;

  const LearnButton({
    super.key,
    required this.buttonText,
    required this.funcOnTap,
  });

  @override
  State<LearnButton> createState() => _LearnButtonState();
}

class _LearnButtonState extends State<LearnButton> {
  static const double _buttomRadius = 40.0;
  static const double _buttonHeight = 48.0;
  static const double _buttonWidth = double.infinity;
  static const double _buttonTextSize = 21;

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
