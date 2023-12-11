import 'package:flip/flip.dart';
import 'package:flutter/material.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/word_card.dart';

class WordView extends StatelessWidget {
  final FlipController controller;
  final Word word;

  const WordView({
    super.key,
    required this.controller,
    required this.word,
  });

  List<Widget> header() {
    return [
      Column(
        children: [
          Text(
            word.word,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "[${word.pronunciation}]",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
      FilledButton(
        onPressed: () {
          controller.flip();
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(135, 52)),
        ),
        child: const Text(
          "查看详细",
          style: TextStyle(fontSize: 16),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FractionallySizedBox(
          widthFactor: 0.88,
          child: WordCard(contents: header()),
        ),
      ],
    );
  }
}
