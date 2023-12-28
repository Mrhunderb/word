import 'package:flutter/material.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/audio_button.dart';
import 'package:words/word/wiget/word_card.dart';
import 'package:words/word/wiget/word_item.dart';

class CollectSpec extends StatelessWidget {
  final Word word;
  const CollectSpec({
    super.key,
    required this.word,
  });

  List<Widget> _specContetn() {
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
          PlayAudioButton(word: word, type: 1),
        ],
      ),
      WordItem(
        header: "释义",
        content: word.definition
            .map(
              (e) => Text(
                e,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            )
            .toList(),
      ),
      WordItem(
        header: "例句",
        content: List.generate(
          word.enExample.length,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                word.enExample[index],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                word.chExample[index],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 30),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("单词详细"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: WordCard(contents: _specContetn()),
            ),
          ],
        ),
      ),
    );
  }
}
