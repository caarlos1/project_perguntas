import 'package:flutter/material.dart';
import 'package:project_perguntas/quiz.dart';
import 'package:project_perguntas/result.dart';

main() => runApp(const QuestionApp());

// É criado tada a manipulação do compoente nessa classe de estado
class QuestionAppState extends State<QuestionApp> {
  final List<Map<String, Object>> _questionsList = [
    {
      'title': 'Qual é a minha cor preferida?',
      'answerList': [
        {'text': 'Azul', 'points': 4},
        {'text': 'Preto', 'points': 10},
        {'text': 'Roxo', 'points': 3},
        {'text': 'Amarelo', 'points': 1},
      ]
    },
    {
      'title': 'Qual é meu animal preferido?',
      'answerList': [
        {'text': 'Passarinho', 'points': 2},
        {'text': 'Rato', 'points': 1},
        {'text': 'Gato', 'points': 10},
        {'text': 'Baleia', 'points': 2},
      ]
    },
    {
      'title': 'Qual minha linguagem favorita?',
      'answerList': [
        {'text': 'Java', 'points': 2},
        {'text': 'JavaScript', 'points': 10},
        {'text': 'Python', 'points': 2},
        {'text': 'Outra', 'points': 1},
      ]
    },
  ];

  int _answerIndex = 0;
  int _userPoints = 0;

  bool get _hasSelectedQuestion {
    return _answerIndex < _questionsList.length;
  }

  void _answerAction(int points) {
    setState(() {
      _userPoints += points;
      if (_hasSelectedQuestion) _answerIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _userPoints = 0;
      _answerIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //...

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Perguntinhas')),
      body: _hasSelectedQuestion
          ? Quiz(
              answerIndex: _answerIndex,
              questionsList: _questionsList,
              answerAction: _answerAction,
              hasSelectedQuestion: _hasSelectedQuestion,
            )
          : Result(
              points: _userPoints,
              resetAction: _resetQuiz,
            ),
    ));
  }
}

// Esse componente é chamado
class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  // É necessário criar uma classe para utilizar estados
  @override
  QuestionAppState createState() => QuestionAppState();
}
