import 'package:flutter/material.dart';
import 'package:words/quiz/model/quiz.dart';
import 'package:words/quiz/widget/quiz_button.dart';

class QuizContent extends StatelessWidget {
  final Quiz quiz;
  const QuizContent({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Question 1:',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                quiz.question,
                style: const TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(height: 20),
            QuizButton(quiz: quiz),
          ],
        ),
      ),
    );
  }
}
