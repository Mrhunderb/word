import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:words/word/word_card.dart';

class WordSpec extends StatelessWidget {
  const WordSpec({super.key});

  List<Widget> _specContetn() {
    return [
      const Text(
        '单词详细',
        style: TextStyle(fontSize: 24),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('不认识'),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('认识'),
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
