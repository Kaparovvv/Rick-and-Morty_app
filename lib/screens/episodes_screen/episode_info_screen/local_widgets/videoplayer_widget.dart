import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Воспроизвести видео?',
        style: TextStyleHelper.textCharacter,
      ),
      actions: [
        TextButton(
          child: const Text('ОТМЕНА'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
