import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandler;

  Answer(
    this.answerText,
    this.selectHandler,
  );

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: RaisedButton(
          color: Colors.redAccent,
          textColor: Colors.white,
          child: Text(answerText),
          onPressed: selectHandler,
        ),
      );
}
