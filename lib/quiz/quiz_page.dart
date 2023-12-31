import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/quiz/widget/quiz_content.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/word/model/word.dart';

class ExamPage extends StatelessWidget {
  final PageController pageController = Get.put(PageController());
  final int planID;

  Future<List<Word>> _getWord() async {
    List<Word> word = await ApiService().getWordTody(planID);
    return word;
  }

  ExamPage({
    super.key,
    required this.planID,
  });

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
      body: FutureBuilder(
        future: _getWord(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Word> words = snapshot.data as List<Word>;
            List<QuizContent> quizContent = [
              for (int i = 0; i < words.length; i++)
                QuizContent(
                  word: words[i],
                  index: i,
                  total: words.length,
                ),
            ];
            return PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: quizContent,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
