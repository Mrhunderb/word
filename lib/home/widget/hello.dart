import 'package:flutter/material.dart';

class HelloIcon extends StatelessWidget {
  const HelloIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(
        "assets/hi.png",
        width: 85,
        height: 85,
      ),
    );
  }
}
