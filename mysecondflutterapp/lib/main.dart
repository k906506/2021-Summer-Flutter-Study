import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';

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
        body: Column(
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
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      // 1번 방법을 사용하면 아래 1줄처럼 코드를 작성
                      // onChanged: (val) => titleInput = val,
                      controller : titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      // 1번 방법을 사용하면 아래 1줄처럼 코드를 작성
                      // onChanged: (val) => amountInput = val,
                      controller : amountController,
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ),
            ),
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
