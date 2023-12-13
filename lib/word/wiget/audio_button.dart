import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:words/word/model/word.dart';

class PlayAudioButton extends StatefulWidget {
  final Word word;
  final int type;

  const PlayAudioButton({
    super.key,
    required this.word,
    required this.type,
  });

  @override
  State<PlayAudioButton> createState() => _PlayAudioButtonState();
}

class _PlayAudioButtonState extends State<PlayAudioButton> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  Widget _pronContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "[${widget.word.word}]",
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 3),
        const Icon(
          Icons.volume_up,
          size: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: _pronContent(),
      onPressed: () async {
        String url =
            "https://dict.youdao.com/dictvoice?audio=${widget.word.word}&type=${widget.type}";
        await player.play(UrlSource(url));
      },
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
