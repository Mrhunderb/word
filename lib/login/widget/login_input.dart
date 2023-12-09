import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final IconData prefixIcon;
  final String hint;
  final TextEditingController inputController;
  final bool isHidden;

  const LoginInput({
    super.key,
    required this.prefixIcon,
    required this.hint,
    required this.inputController,
    required this.isHidden,
  });

  @override
  State<LoginInput> createState() => _LoginInput();
}

class _LoginInput extends State<LoginInput> {
  static const double _inputFieldIconSize = 28;
  static const double _inputFieldFontSize = 18;
  static const double _inputBorderRadius = 20.0;
  static const Color _inputFieldColor = Color.fromRGBO(35, 62, 99, 0.35);

  bool _isHidden = true;

  void _changeVisiable() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  IconButton _hiddenButton() {
    return IconButton(
      onPressed: () {
        _changeVisiable();
      },
      icon: Icon(
        _isHidden ? Icons.visibility : Icons.visibility_off,
      ),
      color: _inputFieldColor,
      iconSize: _inputFieldIconSize,
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_inputBorderRadius),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: Icon(
        widget.prefixIcon,
        size: _inputFieldIconSize,
        color: _inputFieldColor,
      ),
      hintStyle: const TextStyle(
        fontSize: _inputFieldFontSize,
        color: _inputFieldColor,
      ),
      hintText: widget.hint,
      suffixIcon: widget.isHidden ? null : _hiddenButton(),
    );
  }

  @override
  void initState() {
    super.initState();
    _isHidden = widget.isHidden;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.inputController,
      obscureText: !_isHidden,
      decoration: _decoration(),
    );
  }
}
