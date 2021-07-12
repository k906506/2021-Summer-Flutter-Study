import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // _를 붙이면 private
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'Whats your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'Whats your favorite animal?',
      'answers': ['Dog', 'Cat', 'Lion', 'Tiger'],
    },
  ];

  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      print("We have more question!");
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    print('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestion : _answerQuestion, questionIndex : _questionIndex, questions : _questions)
            : Result()
      ),
    );
  }
}
