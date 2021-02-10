import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(this.userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: userTransactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No Transactions Added Yet!',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                );
              })
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      elevation: 4,
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
                        trailing: MediaQuery.of(context).size.width > 420
                            ? FlatButton.icon(
                                onPressed: () =>
                                    deleteTx(userTransactions[index].id),
                                icon: Icon(Icons.delete),
                                label: Text('Delete'),
                                textColor: Theme.of(context).primaryColorLight,
                              )
                            : IconButton(
                                icon: Icon(Icons.delete),
                                color: Theme.of(context).primaryColorLight,
                                onPressed: () =>
                                    deleteTx(userTransactions[index].id),
                              ),
                      ));
                },
                itemCount: userTransactions.length,
              ));
  }
}
