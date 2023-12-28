import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/collect/widget/collect_spec.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/word/model/word.dart';

class DictSpecPage extends StatefulWidget {
  final Dict dict;
  const DictSpecPage({
    super.key,
    required this.dict,
  });

  @override
  State<DictSpecPage> createState() => _DictSpecPage();
}

class _DictSpecPage extends State<DictSpecPage> {
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
        title: Text(widget.dict.dictName),
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: ListView.builder(
            itemCount: vocabulary.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(vocabulary[index].word),
                subtitle: Text(vocabulary[index].definition[0]),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Get.to(() => CollectSpec(word: vocabulary[index]));
                  },
                ),
                onTap: () {
                  Get.to(() => CollectSpec(word: vocabulary[index]));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
