import 'package:flutter/material.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/widget/dict_item.dart';

class DictPage extends StatelessWidget {
  const DictPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('词典列表'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Column(children: dictItems),
        ],
      ),
    );
  }
}

List<Dict> dicts = [
  Dict(
    id: 1,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 1000,
  ),
  Dict(
    id: 2,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 2000,
  ),
  Dict(
    id: 3,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 3000,
  ),
  Dict(
    id: 4,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 4000,
  ),
  Dict(
    id: 5,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 5000,
  ),
  Dict(
    id: 6,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 6000,
  ),
  Dict(
    id: 6,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 7000,
  ),
  Dict(
    id: 6,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 8000,
  ),
  Dict(
    id: 6,
    dictName: '牛津高阶英汉双解词典',
    coverUrl:
        'https://nos.netease.com/ydschool-online/1496632727200CET4luan_1.jpg',
    totalWords: 9000,
  ),
];

List<DictItem> dictItems = dicts
    .map(
      (dict) => DictItem(dict: dict),
    )
    .toList();
