import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/view_spec.dart';

class WordPage extends StatefulWidget {
  final int dictId;
  final int nLearn;
  final int nReview;
  final int type;
  const WordPage({
    super.key,
    required this.dictId,
    required this.nLearn,
    required this.nReview,
    required this.type,
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
    _wordFuture = ApiService().getWordTody(
      widget.nLearn,
      widget.nReview,
      widget.type,
      widget.dictId,
    );
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
            Get.back();
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
            List<Widget> words = [
              for (int i = 0; i < list.length; i++)
                ViewSpec(
                  word: list[i],
                  index: i,
                  total: list.length,
                  next: _next,
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
