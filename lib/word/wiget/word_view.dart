import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/audio_button.dart';
import 'package:words/word/wiget/word_card.dart';

class WordView extends StatelessWidget {
  final Word word;
  final int index;
  final int total;
  final GlobalKey<FlipCardState> cardKey;

  const WordView({
    super.key,
    required this.word,
    required this.cardKey,
    required this.index,
    required this.total,
  });

  List<Widget> header() {
    return [
      Column(
        children: [
          Text(
            "${index + 1} / $total",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            word.word,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          PlayAudioButton(word: word, type: 1),
        ],
      ),
      const Text(
        "请回想中文释义",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 28),
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
