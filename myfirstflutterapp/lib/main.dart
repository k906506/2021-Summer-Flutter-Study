import 'package:flutter/material.dart';
import './question.dart';

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

  void answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    print('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite food?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex],
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
              // 괄호를 붙이면 해당 버튼이 눌렸을 때 함수가 실행되므로 리턴 값이 없음. 따라서 오류가 발생. 이를 해결하기 위해 괄호를 제거하여 포인터 값으로 전달.
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: () => answerQuestion(),
              // 이런 방법으로도 가능
            ),
            RaisedButton(
                child: Text('Answer 1'),
                onPressed: () {
                  answerQuestion();
                }),
          ],
        ),
      ),
    );
  }
}
