import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/widget/dict_spec.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/plan/plan_page.dart';

class DictItem extends StatelessWidget {
  final Dict dict;
  final Plan plan;
  const DictItem({
    super.key,
    required this.dict,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: InkWell(
        onTap: () {
          Get.to(() => DictSpecPage(dict: dict));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ClipRRect(
                  child: Image.network(
                    dict.coverUrl,
                    width: 85,
                    height: 140,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dict.dictName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("共 ${dict.totalWords} 词"),
                    const SizedBox(width: 25),
                    plan.dictID == dict.id
                        ? FilledButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey),
                            ),
                            child: const Text('在学'))
                        : FilledButton(
                            child: const Text('学习'),
                            onPressed: () {
                              Get.to(() => PlanPage(dict: dict));
                            },
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
