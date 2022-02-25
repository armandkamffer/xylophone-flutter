import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneKey {
  Color color;
  int noteNumber;

  XylophoneKey(Color color, int noteNumber) {
    this.color = color;
    this.noteNumber = noteNumber;
  }
}

class XylophoneApp extends StatelessWidget {
  List<XylophoneKey> keys = [
    XylophoneKey(Colors.red.shade500, 1),
    XylophoneKey(Colors.orange.shade500, 2),
    XylophoneKey(Colors.yellow.shade500, 3),
    XylophoneKey(Colors.lightGreen.shade500, 4),
    XylophoneKey(Colors.green.shade500, 5),
    XylophoneKey(Colors.blue.shade500, 6),
    XylophoneKey(Colors.purple.shade500, 7),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: keys
                  .map((key) =>
                      KeyWidget(xylophoneKey: key))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class KeyWidget extends StatelessWidget {
  XylophoneKey xylophoneKey;

  KeyWidget({XylophoneKey xylophoneKey}) : super() {
    this.xylophoneKey = xylophoneKey;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(xylophoneKey.noteNumber);
        },
        style: TextButton.styleFrom(backgroundColor: xylophoneKey.color),
      ),
    );
  }

  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }
}
