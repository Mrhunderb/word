import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/quiz/quiz_page.dart';
import 'package:words/home/widget/dict_progress.dart';
import 'package:words/home/widget/hello.dart';
import 'package:words/home/widget/item_card.dart';
import 'package:words/home/widget/learn_button.dart';
import 'package:words/home/widget/plan.dart';
import 'package:words/word/word_page.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HelloIcon(),
            const SizedBox(height: 20),
            ItemCard(
              title: "我的词典",
              cardHeight: 125.0,
              content: const [
                SizedBox(height: 8),
                DictProgress(total: 100, achive: 45)
              ],
            ),
            ItemCard(
              title: "今日计划",
              cardHeight: 205.0,
              content: planContent(),
            ),
            const SizedBox(height: 20),
            LearnButton(
              buttonText: "开始背单词",
              funcOnTap: () {
                Get.to(const WordPage());
              },
            ),
            const SizedBox(height: 25),
            LearnButton(
              buttonText: "开始测试",
              funcOnTap: () {
                Get.to(ExamPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
