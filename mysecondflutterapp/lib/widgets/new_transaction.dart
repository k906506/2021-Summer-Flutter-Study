import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicket() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(
          () {
            _selectedDate = pickedDate;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: '품목명'),
                  // 1번 방법을 사용하면 아래 1줄처럼 코드를 작성
                  // onChanged: (val) => titleInput = val,
                  controller: _titleController,
                  onSubmitted: (_) => _submitData,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '가격'),
                  // 1번 방법을 사용하면 아래 1줄처럼 코드를 작성
                  // onChanged: (val) => amountInput = val,
                  controller: _amountController,
                  onSubmitted: (_) => _submitData,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "Picked Date"
                            : '선택된 날짜 : ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text("날짜 선택"),
                      onPressed: _presentDatePicket,
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text("항목 추가"),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: _submitData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
