import 'package:flutter/material.dart';
import 'widgets/user_transactions.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 1번 방법을 사용하면 아래 2줄처럼 코드 작성
  // late String titleInput;
  // late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            // Column이므로 main은 y축 (위에서 아래)
            children: <Widget>[
              Container(
                width: double.infinity, // 기기의 최대 너비
                child: Card(
                  color: Colors.blue,
                  elevation: 50, // 그림자
                  child: Text(
                    'Chart',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
