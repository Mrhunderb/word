import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:words/collect/widget/collect_spec.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/word/model/word.dart';

class WordList extends StatefulWidget {
  final Dict dict;
  const WordList({
    super.key,
    required this.dict,
  });

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  final PagingController<int, Word> _pageController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pageController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ApiService().getAllWord(widget.dict.id, pageKey);
      final isLastPage = newItems.length < 50;
      if (isLastPage) {
        _pageController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pageController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pageController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Word>(
      pagingController: _pageController,
      builderDelegate: PagedChildBuilderDelegate<Word>(
        itemBuilder: (context, item, index) {
          return ListTile(
            title: Text(item.word),
            subtitle: Text(item.definition[0]),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Get.to(() => CollectSpec(word: item));
              },
            ),
            onTap: () {
              Get.to(() => CollectSpec(word: item));
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
