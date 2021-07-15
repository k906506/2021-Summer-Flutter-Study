import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_list.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<UserTransaction> {
  // 앱 실행시에 존재하는 거래 내역들
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

  // 새롭개 거래내역을 추가
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

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions),
    ]);
  }
}
