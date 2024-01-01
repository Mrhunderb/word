import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/mydirct_page.dart';
import 'package:words/home/model/today.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/plan/plan_page.dart';
import 'package:words/quiz/quiz_page.dart';
import 'package:words/home/widget/dict_progress.dart';
import 'package:words/home/widget/hello.dart';
import 'package:words/home/widget/item_card.dart';
import 'package:words/home/widget/learn_button.dart';
import 'package:words/home/widget/plan.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/word/word_page.dart';

class HomeContent extends StatelessWidget {
  final Plan plan;
  const HomeContent({super.key, required this.plan});

  Future<Dict> _fecthDict(int dictID) async {
    // 获取词典信息
    Future<Dict> dict = ApiService().getDict(dictID);
    return dict;
  }

  Future<Today> _fetchTodyLearn(int planID) async {
    // 获取今日单词
    Future<Today> today = ApiService().getTodyLearn(planID);
    return today;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Future.wait([_fecthDict(plan.dictID), _fetchTodyLearn(plan.planID)]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Dict? mydict = snapshot.data![0] as Dict?;
          Today today = snapshot.data![1] as Today;
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
                    cardHeight: 160.0,
                    content: [
                      Text(
                        mydict!.dictName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      DictProgress(
                          total: mydict.totalWords, achive: plan.progress)
                    ],
                    funcOnTap: () {
                      Get.to(() =>
                          MydictPage(dict: mydict, progress: plan.progress));
                    },
                  ),
                  ItemCard(
                    title: "今日计划",
                    cardHeight: 205.0,
                    content: planContent(plan, today),
                    funcOnTap: () {
                      Get.to(() => PlanPage(dict: mydict, plan: plan));
                    },
                  ),
                  const SizedBox(height: 20),
                  LearnButton(
                    buttonText: "开始背单词",
                    funcOnTap: () {
                      Get.to(() => WordPage(planId: plan.planID, today: today));
                    },
                  ),
                  const SizedBox(height: 25),
                  LearnButton(
                    buttonText: "开始测试",
                    funcOnTap: () {
                      Get.to(() => ExamPage(planID: plan.planID));
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
