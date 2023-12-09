import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(
        "asserts/icon.png",
        width: 120,
        height: 120,
      ),
    );
  }
}
