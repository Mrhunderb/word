import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String unit;
  final String content;
  final int n;

  const HistoryCard({
    super.key,
    required this.unit,
    required this.content,
    required this.n,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: SizedBox(
        width: 110,
        height: 80,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$n $unit',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(content),
            ],
          ),
        ),
      ),
    );
  }
}
