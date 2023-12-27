import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/quiz/model/quiz.dart';
import 'package:words/quiz/widget/quiz_content.dart';

class ExamPage extends StatelessWidget {
  final PageController pageController = Get.put(PageController());

  final List<Quiz> quiz = [
    for (int i = 0; i < 50; i++)
      Quiz(
        question:
            'As we can no longer wait for the delivery of our order, we have to _______ it.',
        options: [
          'cancel',
          'postpone',
          'delay',
          'suspend',
        ],
        meanings: [
          '取消',
          '推迟',
          '延迟',
          '暂停',
        ],
        correctOption: 1,
        explanation: '句意：  订购的货物尚未送到， 我们不能再等了， 不得不取消订单。',
      ),
  ];

  List<QuizContent> get quizContent {
    List<QuizContent> quizContent = [];
    for (int i = 0; i < quiz.length; i++) {
      quizContent.add(QuizContent(quiz: quiz[i]));
    }
    return quizContent;
  }

  // void _next() {
  //   pageController.nextPage(
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('测试'),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: quizContent,
      ),
    );
  }
}
