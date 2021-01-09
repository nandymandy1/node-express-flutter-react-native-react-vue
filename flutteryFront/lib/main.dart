import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp((MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {'text': 'Lion', 'score': 10},
        {'text': 'Tiger', 'score': 6},
        {'text': 'Cheeta', 'score': 3}
      ]
    },
    {
      "questionText": "Which one is your favorite channel?",
      "answers": [
        {'text': 'Codebook Inc', 'score': 10},
        {'text': 'Traversy Media', 'score': 6},
        {'text': 'Achedemind', 'score': 3}
      ]
    },
    {
      "questionText": "Which is your favorite super hero?",
      "answers": [
        {'text': 'Batman', 'score': 10},
        {'text': 'Captian America', 'score': 6},
        {'text': 'Iron Man', 'score': 3}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() => _questionIndex = _questionIndex + 1);
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions.');
    } else {
      print('No more questions.');
    }
  }

  void _resetQuiz() => setState(() {
        _totalScore = 0;
        _questionIndex = 0;
      });

  @override
  Widget build(BuildContext ctx) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('My Fluttery App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                )
              : Result(
                  _totalScore,
                  _resetQuiz,
                ),
        ),
      );
}
