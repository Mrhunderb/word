import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GeneralProgress extends StatelessWidget {
  final int total;
  final int achive;
  final double _progressHight = 12.0;
  final Radius _progressRadius = const Radius.circular(20.0);

  const GeneralProgress({
    super.key,
    required this.total,
    required this.achive,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      percent: achive / total,
      lineHeight: _progressHight,
      progressColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      barRadius: _progressRadius,
    );
  }
}
