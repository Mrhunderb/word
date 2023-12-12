import 'package:flip/flip.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/word_spec.dart';
import 'package:words/word/wiget/word_view.dart';

class WordPage extends StatefulWidget {
  final FlipController controller = FlipController();

  WordPage({super.key});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  Word example = Word(
    word: 'example',
    pronunciation: 'ɪɡˈzæmpəl',
    definition: 'n. 例子；范例；模范',
    example: 'This is an example.',
  );

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
      body: Center(
        child: Flip(
          controller: widget.controller,
          firstChild: WordView(controller: widget.controller, word: example),
          secondChild: WordSpec(word: example),
        ),
      ),
    );
  }
}
