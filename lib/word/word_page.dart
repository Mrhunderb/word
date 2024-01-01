import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/home/home.dart';
import 'package:words/home/model/today.dart';
import 'package:words/user/model/user.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/utils/preference.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/view_spec.dart';

class WordPage extends StatefulWidget {
  final int planId;
  final Today today;
  const WordPage({
    super.key,
    required this.planId,
    required this.today,
  });

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  final PageController _controller = PageController();
  late Future<List<Word>> _wordFuture;

  @override
  void initState() {
    super.initState();
    _wordFuture = ApiService().getWordTody(widget.planId);
  }

  void _next() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('结束学习'),
                  content: const Text('今天就学到这里了吗？'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // 关闭AlertDialog
                        int userId = getInt(Preference.userId);
                        String userName = getString(Preference.userName);
                        int planId = getInt(Preference.planId);
                        User user =
                            User(id: userId, name: userName, planID: planId);
                        Get.off(() => HomePage(user: user));
                      },
                      child: const Text('确定结束'),
                    ),
                    TextButton(
                      onPressed: () {
                        // 关闭AlertDialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('继续学习'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        title: const Text('背单词'),
        centerTitle: true, // Aligns the title in the middle
      ),
      body: FutureBuilder(
        future: _wordFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            List<Word> list = snapshot.data as List<Word>;
            int index =
                (widget.today.nLearn + widget.today.nReview) % list.length;
            List<Widget> words = [
              for (int i = index; i < list.length; i++)
                ViewSpec(
                  word: list[i],
                  index: i,
                  total: list.length,
                  next: _next,
                  planID: widget.planId,
                ),
            ];
            return PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: words,
            );
          }
        },
      ),
    );
  }
}
