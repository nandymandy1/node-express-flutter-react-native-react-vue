import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        child: Text(
          questionText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28),
        ),
      );
}
