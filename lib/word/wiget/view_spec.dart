import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:words/word/model/word.dart';
import 'package:words/word/wiget/word_spec.dart';
import 'package:words/word/wiget/word_view.dart';

class ViewSpec extends StatelessWidget {
  final Word word;
  final Function next;
  final int index;
  final int total;
  // final FlipController _controller = FlipController(isFront: true);
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  ViewSpec({
    super.key,
    required this.word,
    required this.next,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: false,
      key: cardKey,
      front: WordView(cardKey: cardKey, word: word, index: index, total: total),
      back: WordSpec(next: next, word: word),
    );
  }
}
