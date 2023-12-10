import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:words/home/widget/dict_progress.dart';
import 'package:words/home/widget/hello.dart';
import 'package:words/home/widget/item_card.dart';
import 'package:words/home/widget/plan.dart';
import 'package:words/login/widget/login_button.dart';

class PageInformation {
  final int index;
  final String name;
  final IconData icon;
  final IconData iconChoice;

  PageInformation({
    required this.index,
    required this.name,
    required this.icon,
    required this.iconChoice,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const HelloIcon(),
  ];

  static final _bottomItems = [
    PageInformation(
      index: 0,
      name: "主页",
      icon: MingCuteIcons.mgc_home_2_line,
      iconChoice: MingCuteIcons.mgc_home_2_fill,
    ),
    PageInformation(
      index: 1,
      name: "词典",
      icon: MingCuteIcons.mgc_book_2_line,
      iconChoice: MingCuteIcons.mgc_book_2_fill,
    ),
    PageInformation(
      index: 2,
      name: "用户",
      icon: MingCuteIcons.mgc_user_2_line,
      iconChoice: MingCuteIcons.mgc_user_2_fill,
    ),
  ];

  void _bottomItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
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
            LoginButton(buttonText: "开始背单词", funcOnTap: () {})
                .paddingOnly(bottom: 20),
            LoginButton(buttonText: "开始测试", funcOnTap: () {}),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _bottomItemTap,
        items: _bottomItems
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(_selectedIndex == e.index ? e.iconChoice : e.icon),
                label: e.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
