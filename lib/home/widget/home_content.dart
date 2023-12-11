import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:words/home/widget/dict_progress.dart';
import 'package:words/home/widget/hello.dart';
import 'package:words/home/widget/item_card.dart';
import 'package:words/home/widget/learn_button.dart';
import 'package:words/home/widget/plan.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HelloIcon().paddingOnly(bottom: 20),
        // DictCard(),
        ItemCard(
          title: "我的词典",
          cardHeight: 125.0,
          content: const [DictProgress(total: 100, achive: 45)],
        ),
        ItemCard(
          title: "今日计划",
          cardHeight: 205.0,
          content: planContent(),
        ),
        LearnButton(buttonText: "开始背单词", funcOnTap: () {})
            .paddingOnly(top: 20, bottom: 20),
        LearnButton(buttonText: "开始测试", funcOnTap: () {}),
      ],
    );
  }
}
