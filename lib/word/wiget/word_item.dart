import 'package:flutter/material.dart';

class WordItem extends StatelessWidget {
  final String header;
  final List<Widget> content;
  const WordItem({
    super.key,
    required this.header,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Row(
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        Column(children: content),
      ],
    );
  }
}
