import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "항목을 추가해주세요!",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ]);
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '${transactions[index].amount.toInt()}원',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deleteTx(transactions[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
