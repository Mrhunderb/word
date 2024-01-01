import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/home/home.dart';
import 'package:words/user/model/user.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/utils/preference.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/audio_button.dart';
import 'package:words/word/wiget/word_item.dart';
import 'package:words/word/wiget/word_card.dart';

class WordSpec extends StatelessWidget {
  final Word word;
  final int planID;
  final Function next;
  final int index;
  final int total;

  const WordSpec({
    super.key,
    required this.word,
    required this.planID,
    required this.next,
    required this.index,
    required this.total,
  });

  void _showSnackBar(BuildContext context) {
    int userID = getInt(Preference.userId);
    var plan = ApiService().addCollect(userID, word.id);
    plan.then((value) {
      Get.snackbar(
        "添加到生词本",
        value,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void _addHistory(int isKnow) {
    ApiService().addHistory(planID, word.id, isKnow);
  }

  List<Widget> _specContetn(BuildContext context) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                word.word,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              PlayAudioButton(word: word, type: 1),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  _showSnackBar(context);
                },
                icon: const Icon(Icons.bookmark_add_sharp),
              )
            ],
          )
        ],
      ),
      WordItem(
        header: "释义",
        content: word.definition
            .map(
              (e) => Text(
                e,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            )
            .toList(),
      ),
      WordItem(
        header: "例句",
        content: List.generate(
          word.enExample.length,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                word.enExample[index],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                word.chExample[index],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(5),
              minimumSize: MaterialStateProperty.all(
                const Size(125, 52),
              ),
            ),
            onPressed: () {
              _addHistory(0);
              if (index == total - 1) {
                int userId = getInt(Preference.userId);
                String userName = getString(Preference.userName);
                int planId = getInt(Preference.planId);
                User user = User(id: userId, name: userName, planID: planId);
                Get.off(() => HomePage(user: user));
              } else {
                next();
              }
            },
            child: const Text(
              '不认识',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 40),
          FilledButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                const Size(125, 52),
              ),
            ),
            onPressed: () {
              _addHistory(1);
              if (index == total - 1) {
                int userId = getInt(Preference.userId);
                String userName = getString(Preference.userName);
                int planId = getInt(Preference.planId);
                User user = User(id: userId, name: userName, planID: planId);
                Get.off(() => HomePage(user: user));
              } else {
                next();
              }
            },
            child: const Text(
              '认识',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FractionallySizedBox(
          widthFactor: 0.9,
          child: WordCard(contents: _specContetn(context)),
        ),
      ],
    );
  }
}
