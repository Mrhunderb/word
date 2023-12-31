import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/collect/widget/collect_spec.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/utils/preference.dart';
import 'package:words/word/model/word.dart';

class CollectPage extends StatefulWidget {
  const CollectPage({super.key});

  @override
  State<CollectPage> createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  late List<Word> vocabulary;
  late Future<List<Word>> _wordFuture;
  final int userId = getInt(Preference.userId);

  @override
  void initState() {
    super.initState();
    _wordFuture = ApiService().getUserCollect(userId);
  }

  Future<void> _showDeleteConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('确认删除'),
          content: const Text('确认从生词本中删除'),
          actions: <Widget>[
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('删除'),
              onPressed: () {
                setState(() {
                  vocabulary.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
        title: const Text('生词本'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _wordFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            vocabulary = snapshot.data as List<Word>;
            return Center(
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
                      onLongPress: () {
                        _showDeleteConfirmationDialog(index);
                      },
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
