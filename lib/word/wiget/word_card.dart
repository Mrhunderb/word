import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final List<Widget> contents;
  const WordCard({
    super.key,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Wrap the text widget with Card
      elevation: 2,
      child: Container(
        height: 740,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
        ),
        padding:
            const EdgeInsets.only(top: 30, bottom: 40, left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: contents,
          ),
        ),
      ),
    );
  }
}
