import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() clickAction;

  const Answer(this.text, this.clickAction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: clickAction,
        child: Text(text),
      ),
    );
  }
}
