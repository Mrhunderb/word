import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final double cardHeight;
  final List<Widget> content;

  final BorderRadius cardRadius = BorderRadius.circular(20.0);

  ItemCard({
    super.key,
    required this.title,
    required this.cardHeight,
    required this.content,
  });

  Row header() {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: cardRadius,
        ),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                header().paddingOnly(top: 12, bottom: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: content.toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
