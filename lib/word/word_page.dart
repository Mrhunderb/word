import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/view_spec.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  final PageController _controller = PageController();

  Word example1 = Word(
    word: 'example1',
    pronunciation: 'ɪɡˈzæmpəl',
    definition: 'n. 例子；范例；模范',
    example: 'This is an example.',
  );
  Word example2 = Word(
    word: 'example2',
    pronunciation: 'ɪɡˈzæmpəl',
    definition: 'n. 例子；范例；模范',
    example: 'This is an example.',
  );
  Word example3 = Word(
    word: 'example3',
    pronunciation: 'ɪɡˈzæmpəl',
    definition: 'n. 例子；范例；模范',
    example: 'This is an example.',
  );

  void _next() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  late List<Widget> words = [
    ViewSpec(word: example1, next: _next),
    ViewSpec(word: example2, next: _next),
    ViewSpec(word: example3, next: _next),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('背单词'),
        centerTitle: true, // Aligns the title in the middle
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: words,
      ),
    );
  }
}
