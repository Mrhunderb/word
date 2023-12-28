import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final double cardHeight;
  final Function funcOnTap;
  final List<Widget> content;

  final BorderRadius cardRadius = BorderRadius.circular(20.0);

  ItemCard({
    super.key,
    required this.title,
    required this.cardHeight,
    required this.funcOnTap,
    required this.content,
  });

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: TextButton(
            onPressed: () {
              funcOnTap();
            },
            child: const Text("查看详细"),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: cardRadius,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              header().paddingOnly(left: 20),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: content.toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
