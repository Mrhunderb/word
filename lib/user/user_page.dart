import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/collect/collect_page.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/mydirct_page.dart';
import 'package:words/login/login.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/plan/plan_page.dart';
import 'package:words/user/model/history.dart';
import 'package:words/user/model/user.dart';
import 'package:words/user/widget/history_card.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/utils/preference.dart';

class UserPage extends StatefulWidget {
  final User user;
  final Plan plan;
  const UserPage({
    super.key,
    required this.plan,
    required this.user,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Dict mydict;
  late MyHistory myhistory;

  Future<Dict> _fechDict(int dictID) async {
    // 获取词典信息
    Future<Dict> dict = ApiService().getDict(dictID);
    return dict;
  }

  Future<MyHistory> _fetchHistory() async {
    // 获取用户历史信息
    Future<MyHistory> history = ApiService().getHistoryInfo(widget.user.id);
    return history;
  }

  List<Widget> pageConetnt() {
    return [
      Row(
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.name, // 替换成用户的姓名
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'ID: ${widget.user.id}', // 替换成用户的邮箱
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
      const SizedBox(height: 24.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HistoryCard(unit: "天", content: "连续打卡", n: myhistory.totalDays),
          HistoryCard(unit: "天", content: "累计学习", n: myhistory.totalDays),
          HistoryCard(unit: "词", content: "累计学习", n: myhistory.totalWords),
        ],
      ),
      const SizedBox(height: 24.0),
      ListTile(
        leading: const Icon(Icons.book),
        title: const Text('我的词典'),
        onTap: () {
          Get.to(
              () => MydictPage(dict: mydict, progress: widget.plan.progress));
        },
      ),
      ListTile(
        leading: const Icon(Icons.date_range),
        title: const Text('我的计划'),
        onTap: () {
          Get.to(() => PlanPage(dict: mydict, plan: widget.plan));
        },
      ),
      ListTile(
        leading: const Icon(Icons.bookmark),
        title: const Text('生词本'),
        onTap: () {
          Get.to(() => const CollectPage());
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('设置'),
        onTap: () {
          // 处理点击设置的逻辑
          // 可以导航到设置页面或弹出设置对话框
          // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.exit_to_app_rounded),
        title: const Text('退出'),
        onTap: () {
          // 处理注销逻辑
          // 可以弹出确认对话框，然后执行注销操作
          prefs.clear();
          Get.off(() => const LoginPage());
        },
      ),
      const SizedBox(height: 30),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: Future.wait([_fechDict(widget.plan.dictID), _fetchHistory()]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            mydict = snapshot.data![0] as Dict;
            myhistory = snapshot.data![1] as MyHistory;
            return FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageConetnt(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
