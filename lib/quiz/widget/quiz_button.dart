import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/collect/widget/collect_spec.dart';
import 'package:words/word/model/word.dart';

class QuizButton extends StatefulWidget {
  final Word word;
  final int index;
  final int total;

  const QuizButton({
    super.key,
    required this.word,
    required this.index,
    required this.total,
  });

  @override
  State<QuizButton> createState() => _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {
  int selectedOption = 0;
  PageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(4, (index) => index + 1).map((option) {
          Color color;
          if (selectedOption == option) {
            color = option == widget.word.quiz.correctOption
                ? const Color.fromARGB(255, 76, 175, 132)
                : const Color.fromARGB(255, 252, 118, 111);
          } else if (option == widget.word.quiz.correctOption &&
              selectedOption != 0) {
            color = const Color.fromARGB(255, 76, 175, 132);
          } else {
            color = Theme.of(context).colorScheme.secondaryContainer;
          }

          return Column(
            children: [
              const SizedBox(height: 10),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 78),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (selectedOption == 0) {
                    setState(() {
                      selectedOption = option;
                    });
                  }
                },
                child: Text(
                  // widget.word.quiz.options[option - 1],
                  widget.word.quiz.options[option - 1],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          );
        }),
        const SizedBox(height: 20),
        Text(
          selectedOption == 0
              ? '请选择正确选项'
              : selectedOption == widget.word.quiz.correctOption
                  ? '恭喜你答对了!'
                  : '很遗憾答错了.',
        ),
        const SizedBox(height: 40),
        selectedOption == 0
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(3),
                      minimumSize: MaterialStateProperty.all(
                        const Size(125, 50),
                      ),
                    ),
                    onPressed: () {
                      Get.to(
                        () => CollectSpec(
                          word: widget.word,
                        ),
                      );
                    },
                    child: const Text("单词详细"),
                  ),
                  const SizedBox(width: 60),
                  FilledButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(120, 50),
                        ),
                      ),
                      onPressed: () {
                        if (widget.index == widget.total - 1) {
                          Get.back();
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: const Text("下一题")),
                ],
              ),
      ],
    );
  }
}
