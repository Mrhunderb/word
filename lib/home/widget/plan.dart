import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';

const TextStyle _planStyle = TextStyle(fontSize: 16);
const TextStyle _planStyleBold = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

class LearnInfo {
  final String title;
  final int todo;
  final IconData icon;

  LearnInfo({
    required this.title,
    required this.todo,
    required this.icon,
  });
}

List<Widget> planContent() {
  List<LearnInfo> list = [
    LearnInfo(title: "计划学习", todo: 40, icon: MingCuteIcons.mgc_calendar_2_fill),
    LearnInfo(title: "待新学", todo: 40, icon: MingCuteIcons.mgc_report_fill),
    LearnInfo(title: "待复习", todo: 200, icon: MingCuteIcons.mgc_repeat_fill),
  ];
  List<Row> content = list.map((e) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(e.icon, color: Colors.blueGrey)
                .paddingOnly(right: 35, left: 10, bottom: 15),
            Text(e.title, style: _planStyle).paddingOnly(bottom: 13),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${e.todo}", style: _planStyleBold)
                .paddingOnly(right: 10, bottom: 13),
            const Text("词", style: _planStyle)
                .paddingOnly(right: 10, bottom: 13),
          ],
        ),
      ],
    );
  }).toList();
  return content;
}
