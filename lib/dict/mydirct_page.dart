import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/dict/dict_page.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/widget/progress.dart';
import 'package:words/home/widget/learn_button.dart';
import 'package:words/word/model/word.dart';

class MydictPage extends StatefulWidget {
  final Dict dict;
  const MydictPage({
    super.key,
    required this.dict,
  });

  @override
  State<MydictPage> createState() => _MydictPageState();
}

class _MydictPageState extends State<MydictPage> {
  List<Word> vocabulary = [
    for (int i = 0; i < 50; i++)
      Word(
        word: 'abandon',
        pronunciation: 'əˈbændən',
        definition: ['v. 放弃，抛弃'],
        enExample: ['He abandoned his family.', 'He abandoned his family.'],
        chExample: ['他抛弃了他的家人。', '他抛弃了他的家人。'],
      ),
    // Add more words here
  ];
  Row _dictContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          child: Image.network(
            widget.dict.coverUrl,
            width: 85,
            height: 140,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.dict.dictName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 30,
              width: 200,
              child: GeneralProgress(
                achive: 50,
                total: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  '50/100词',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的词典'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    "当前学习:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _dictContent(),
              Expanded(
                child: ListView.builder(
                  itemCount: vocabulary.length,
                  itemBuilder: (context, index) {
                    final word = vocabulary[index];
                    return ListTile(
                      title: Text(word.word),
                      subtitle: Text(word.definition.join(', ')),
                    );
                  },
                ),
              ),
              LearnButton(
                buttonText: "更换词书",
                funcOnTap: () {
                  Get.to(() => const DictPage());
                },
              ).paddingOnly(bottom: 30),
            ],
          ),
        ),
      ),
    );
  }
}