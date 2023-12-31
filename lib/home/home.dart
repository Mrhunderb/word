import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:words/dict/dict_page.dart';
import 'package:words/home/model/page_info.dart';
import 'package:words/home/widget/home_content.dart';
import 'package:words/user/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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

  static final List<Widget> _pages = [
    const HomeContent(),
    const DictPage(),
    const UserPage(),
  ];

  void _bottomItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
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
