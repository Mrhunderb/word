import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/collect/collect_page.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/mydirct_page.dart';
import 'package:words/login/login.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/plan/plan_page.dart';
import 'package:words/user/widget/history_card.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/utils/preference.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final String username = getString(Preference.userName);
  final int userId = getInt(Preference.userId);
  late Plan plan;
  late Dict mydict;

  Future<Plan> _fetchUser() async {
    // 获取用户信息
    int userId = getInt(Preference.userId);
    Future<Plan> plan = ApiService().getPlan(userId);
    return plan;
  }

  Future<Dict> _fechDict(int dictID) async {
    // 获取词典信息
    Future<Dict> dict = ApiService().getDict(dictID);
    return dict;
  }

  List<Widget> pageConetnt() {
    return [
      Row(
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundColor: Theme.of(context).primaryColor,
            // backgroundImage: NetworkImage(
            //     'https://example.com/user_profile_image.jpg'), // 替换成用户头像的URL
          ),
          const SizedBox(width: 40.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username, // 替换成用户的姓名
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'ID: $userId', // 替换成用户的邮箱
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
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HistoryCard(unit: "天", content: "连续打卡", n: 0),
          HistoryCard(unit: "天", content: "累计学习", n: 86),
          HistoryCard(unit: "词", content: "累计学习", n: 2881),
        ],
      ),
      const SizedBox(height: 24.0),
      ListTile(
        leading: const Icon(Icons.book),
        title: const Text('我的词典'),
        onTap: () {
          Get.to(() => MydictPage(dict: mydict, progress: plan.progress));
        },
      ),
      ListTile(
        leading: const Icon(Icons.date_range),
        title: const Text('我的计划'),
        onTap: () {
          Get.to(() => PlanPage(dict: mydict));
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
      child: FractionallySizedBox(
          widthFactor: 0.9,
          child: FutureBuilder(
            future: _fetchUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                plan = snapshot.data!;
                return FutureBuilder(
                  future: _fechDict(plan.dictID),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      mydict = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageConetnt(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
