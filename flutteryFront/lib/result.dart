import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(
    this.resultScore,
    this.resetHandler,
  );

  String get resultPhrase {
    var resultText;

    if (resultScore <= 12) {
      resultText = 'You are awesome and innocent.';
    } else if (resultScore <= 15) {
      resultText = 'You are pretty likeable.';
    } else if (resultScore <= 18) {
      resultText = 'You are ... strange?';
    } else {
      resultText = 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              onPressed: resetHandler,
              child: Text(
                'Restart Quiz!',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      );
}
