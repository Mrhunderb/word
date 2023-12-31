import 'package:flutter/material.dart';
import 'package:words/quiz/model/quiz.dart';
import 'package:words/quiz/widget/quiz_button.dart';
import 'package:words/word/model/word.dart';

class QuizContent extends StatelessWidget {
  final int index;
  final int total;
  final Word word;
  const QuizContent({
    super.key,
    required this.index,
    required this.total,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'question ${index + 1} / $total',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                word.word,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 50),
            QuizButton(word: word),
          ],
        ),
      ),
    );
  }
}
