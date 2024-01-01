import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:words/dict/home_dict.dart';
import 'package:words/home/model/page_info.dart';
import 'package:words/home/widget/home_content.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/user/model/user.dart';
import 'package:words/user/user_page.dart';
import 'package:words/utils/api_service.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({
    super.key,
    required this.user,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late Plan plan;

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

  Future<Plan> _fetchUser() async {
    // 获取用户信息
    int userId = widget.user.id;
    Future<Plan> plan = ApiService().getPlan(userId);
    return plan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: _fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              plan = snapshot.data!;
              List<Widget> pages = [
                HomeContent(plan: plan),
                const HomeDict(),
                UserPage(user: widget.user, plan: plan),
              ];
              return pages[_selectedIndex];
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomItems
              .map(
                (e) => BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  label: e.name,
                  activeIcon: Icon(e.iconChoice),
                ),
              )
              .toList(),
          currentIndex: _selectedIndex,
          onTap: _bottomItemTap,
        ));
  }
}
