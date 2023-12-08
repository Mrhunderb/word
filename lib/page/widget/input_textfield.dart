import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final IconData prefixIcon;
  final String hint;
  final TextEditingController inputController;
  final bool isVisiable;

  const InputText({
    super.key,
    required this.prefixIcon,
    required this.hint,
    required this.inputController,
    required this.isVisiable,
  });

  @override
  State<InputText> createState() => _InputText();
}

class _InputText extends State<InputText> {
  static const double _inputFieldIconSize = 30;
  static const double _inputFieldFontSize = 20;
  static const Color _inputFieldColor = Color.fromRGBO(35, 62, 99, 0.35);

  bool _isVisiable = true;

  void _changeVisiable() {
    setState(() {
      _isVisiable = !_isVisiable;
    });
  }

  @override
  void initState() {
    super.initState();
    _isVisiable = widget.isVisiable;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.inputController,
      obscureText: !_isVisiable,
      decoration: InputDecoration(
        border: InputBorder.none,
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
        suffixIcon: widget.isVisiable
            ? null
            : IconButton(
                onPressed: () {
                  _changeVisiable();
                },
                icon: Icon(
                  _isVisiable ? Icons.visibility : Icons.visibility_off,
                ),
                color: _inputFieldColor,
              ),
      ),
    );
  }
}
