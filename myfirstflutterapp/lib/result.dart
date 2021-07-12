import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore <= 2) {
      resultText = "You are awesome and Innocent!";
    } else if (resultScore <= 8) {
      resultText = "just good!";
    } else if (resultScore <= 14) {
      resultText = "normal";
    } else {
      resultText = "oh my god!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
            child: Text('Restart Quiz!'),
            style : ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: resetHandler),
      ]),
    );
  }
}
