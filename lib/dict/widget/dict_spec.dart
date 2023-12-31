import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/widget/word_list.dart';

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
            widthFactor: 0.9, child: WordList(dict: widget.dict)),
      ),
    );
  }
}
