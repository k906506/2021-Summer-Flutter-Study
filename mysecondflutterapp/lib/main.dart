import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // 1번 방법을 사용하면 아래 2줄처럼 코드 작성
  // late String titleInput;
  // late String amountInput;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Chicken',
      amount: 4.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Nike Clothes',
      amount: 9.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Genesis',
      amount: 10.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'baker',
      amount: 2.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ),
          ],
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
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ),
      ),
    );
  }
}
