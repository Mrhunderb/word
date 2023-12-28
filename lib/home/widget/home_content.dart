import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/mydirct_page.dart';
import 'package:words/plan/plan_page.dart';
import 'package:words/quiz/quiz_page.dart';
import 'package:words/home/widget/dict_progress.dart';
import 'package:words/home/widget/hello.dart';
import 'package:words/home/widget/item_card.dart';
import 'package:words/home/widget/learn_button.dart';
import 'package:words/home/widget/plan.dart';
import 'package:words/word/word_page.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  final Dict mydict = Dict(
    id: 1,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 1000,
  );

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
              funcOnTap: () {
                Get.to(() => MydictPage(dict: mydict));
              },
            ),
            ItemCard(
              title: "今日计划",
              cardHeight: 205.0,
              content: planContent(),
              funcOnTap: () {
                Get.to(() => PlanPage(dict: mydict));
              },
            ),
            const SizedBox(height: 20),
            LearnButton(
              buttonText: "开始背单词",
              funcOnTap: () {
                Get.to(() => const WordPage());
              },
            ),
            const SizedBox(height: 25),
            LearnButton(
              buttonText: "开始测试",
              funcOnTap: () {
                Get.to(() => ExamPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
