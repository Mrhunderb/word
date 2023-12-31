import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/mydirct_page.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/plan/plan_page.dart';
import 'package:words/quiz/quiz_page.dart';
import 'package:words/home/widget/dict_progress.dart';
import 'package:words/home/widget/hello.dart';
import 'package:words/home/widget/item_card.dart';
import 'package:words/home/widget/learn_button.dart';
import 'package:words/home/widget/plan.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/utils/preference.dart';
import 'package:words/word/word_page.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  Future<Plan> _fetchUser() async {
    // 获取用户信息
    int userId = getInt(Preference.userId);
    Future<Plan> plan = ApiService().getPlan(userId);
    return plan;
  }

  Future<Dict> _fecthDict(int dictID) async {
    // 获取词典信息
    Future<Dict> dict = ApiService().getDict(dictID);
    return dict;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Plan? plan = snapshot.data;
          return FutureBuilder(
            future: _fecthDict(plan!.dictID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Dict? mydict = snapshot.data;
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
                          cardHeight: 155.0,
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
                            Get.to(() => MydictPage(
                                dict: mydict, progress: plan.progress));
                          },
                        ),
                        ItemCard(
                          title: "今日计划",
                          cardHeight: 205.0,
                          content: planContent(plan.nLearn),
                          funcOnTap: () {
                            Get.to(() => PlanPage(dict: mydict, plan: plan));
                          },
                        ),
                        const SizedBox(height: 20),
                        LearnButton(
                          buttonText: "开始背单词",
                          funcOnTap: () {
                            Get.to(() => WordPage(planId: plan.planID));
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
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
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
