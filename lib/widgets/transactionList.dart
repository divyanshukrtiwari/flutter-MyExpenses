import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No Transactions Added Yet!',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 300,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                              child: Text(
                            '\u20B9${userTransactions[index].amount.toStringAsFixed(0)}',
                          )),
                        ),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        formatDate(userTransactions[index].date,
                            [d, '-', M, '-', yyyy]),
                        style: TextStyle(color: Colors.black54),
                      ),
                      trailing: null,
                    ),
                  );
                },
                itemCount: userTransactions.length,
              ));
  }
}
