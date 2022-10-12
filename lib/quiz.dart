import 'package:flutter/material.dart';
import 'package:project_perguntas/answer.dart';
import 'package:project_perguntas/questions.dart';

class Quiz extends StatelessWidget {
  final int answerIndex;
  final List<Map<String, Object>> questionsList;
  final void Function(int points) answerAction;
  final bool hasSelectedQuestion;

  const Quiz({
    required this.answerIndex,
    required this.questionsList,
    required this.answerAction,
    required this.hasSelectedQuestion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answerList = hasSelectedQuestion
        ? questionsList[answerIndex].cast()['answerList']
        : [];

    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Question(questionsList[answerIndex]['title'].toString()),
          ...answerList
              .map((r) => Answer(
                    r['text'].toString(),
                    () => answerAction(int.parse(r['points'].toString())),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
