import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  final void Function() resetAction;

  const Result({
    required this.points,
    required this.resetAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Parabéns!', style: TextStyle(fontSize: 25)),
          Text('Você obteve ${points.toString()} pontos.'),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: resetAction,
              child: const Text('Reiniciar'),
            ),
          )
        ],
      ),
    );
  }
}
