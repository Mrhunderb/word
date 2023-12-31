import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/widget/progress.dart';
import 'package:words/home/widget/learn_button.dart';
import 'package:words/plan/model/plan.dart';

class PlanPage extends StatefulWidget {
  final Dict dict;
  final Plan? plan;
  const PlanPage({
    super.key,
    required this.dict,
    this.plan,
  });

  @override
  State<PlanPage> createState() => _MyPageState();
}

class _MyPageState extends State<PlanPage> {
  List<String> mode = ['按字母表顺序', '按字母表倒序', '乱序'];
  String currentOrder = '按字母表顺序';
  late int _nLearn;
  late int _nReview;
  late int _progress;

  @override
  void initState() {
    super.initState();
    if (widget.plan == null) {
      _nLearn = 30;
      _nReview = 30;
      _progress = 0;
    } else {
      _nLearn = widget.plan!.nLearn;
      _nReview = widget.plan!.nReview;
      _progress = widget.plan!.progress;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的计划'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '所选词典',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
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
                    SizedBox(
                      height: 30,
                      width: 200,
                      child: GeneralProgress(
                        achive: _progress,
                        total: widget.dict.totalWords,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          '$_progress/${widget.dict.totalWords}词',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              '背词模式',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomDropdown<String>(
              hintText: "请选择学习顺序",
              items: mode,
              initialItem: widget.plan == null ? null : mode[widget.plan!.mode],
              onChanged: (String? newValue) {
                setState(() {
                  currentOrder = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      "每日学习",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    NumberPicker(
                      value: _nLearn,
                      minValue: 1,
                      maxValue: 100,
                      selectedTextStyle: TextStyle(
                        fontSize: 26,
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (value) => setState(() => _nLearn = value),
                    ),
                  ],
                ),
                const SizedBox(width: 70),
                Column(
                  children: [
                    const Text(
                      "每日复习",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    NumberPicker(
                      value: _nReview,
                      minValue: 1,
                      maxValue: 200,
                      selectedTextStyle: TextStyle(
                        fontSize: 26,
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (value) => setState(() => _nReview = value),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            LearnButton(
              buttonText: "保存修改",
              funcOnTap: () {
                //TODO: save the plan
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
