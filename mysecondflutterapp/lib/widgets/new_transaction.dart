import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <=0) {
      return;
    }
    addTx(
        enteredTitle,
        enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // 1번 방법을 사용하면 아래 1줄처럼 코드를 작성
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                submitData;
              },
            ),
          ],
        ),
      ),
    );
  }
}
