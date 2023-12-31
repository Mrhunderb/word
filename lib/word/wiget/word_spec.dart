import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/audio_button.dart';
import 'package:words/word/wiget/word_item.dart';
import 'package:words/word/wiget/word_card.dart';

class WordSpec extends StatelessWidget {
  final Word word;
  final Function next;

  const WordSpec({
    super.key,
    required this.word,
    required this.next,
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
            mainAxisAlignment: MainAxisAlignment.start,
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
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(5),
              minimumSize: MaterialStateProperty.all(
                const Size(125, 52),
              ),
            ),
            onPressed: () {
              next();
            },
            child: const Text(
              '不认识',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 40),
          FilledButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                const Size(125, 52),
              ),
            ),
            onPressed: () {
              next();
            },
            child: const Text(
              '认识',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ).paddingOnly(bottom: 20),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FractionallySizedBox(
          widthFactor: 0.9,
          child: WordCard(contents: _specContetn()),
        ),
      ],
    );
  }
}
