import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/word_card.dart';

class WordView extends StatelessWidget {
  final Word word;
  final GlobalKey<FlipCardState> cardKey;

  const WordView({
    super.key,
    required this.word,
    required this.cardKey,
  });

  List<Widget> header() {
    return [
      Column(
        children: [
          Text(
            word.word,
            style: const TextStyle(
              fontSize: 35,
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
      const Text(
        "请回想中文释义",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 24),
      FilledButton(
        onPressed: () {
          cardKey.currentState!.toggleCard();
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
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                cardKey.currentState!.toggleCard();
              }
            },
            onTap: () {
              cardKey.currentState!.toggleCard();
            },
            child: WordCard(contents: header()),
          ),
        ),
      ],
    );
  }
}
