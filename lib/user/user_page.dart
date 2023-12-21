import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<Widget> pageConetnt() {
    return [
      const Row(
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundImage: NetworkImage(
                'https://example.com/user_profile_image.jpg'), // 替换成用户头像的URL
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe', // 替换成用户的姓名
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'john.doe@example.com', // 替换成用户的邮箱
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
      const SizedBox(height: 24.0),
      ListTile(
        leading: const Icon(Icons.book),
        title: const Text('我的词典'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.date_range),
        title: const Text('我的计划'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.bookmark),
        title: const Text('生词本'),
        onTap: () {},
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pageConetnt(),
        ),
      ),
    );
  }
}
