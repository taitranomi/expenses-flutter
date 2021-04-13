import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() Transaction List');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('No transactions yet',
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 25,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            );
          })
        : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              //   return Card(
              //     child: Row(
              //       children: <Widget>[
              //         Container(
              //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //           decoration: BoxDecoration(
              //               border: Border.all(color: Theme.of(context).primaryColor, width: 1.5)
              //           ),
              //           padding: EdgeInsets.all(10),
              //           child: Text('\$${transactions[index].amount.toStringAsFixed(2)}',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20,
              //                   color: Theme.of(context).primaryColor)),
              //         ),
              //         Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: <Widget>[
              //               Text(transactions[index].title,
              //                   style: Theme.of(context).textTheme.title),
              //               Text(DateFormat('yyyy-MM-dd').format(transactions[index].date),
              //                   style: TextStyle(color: Theme.of(context).primaryColor)),
              //             ])
              //       ],
              //     ),
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460 
                  ? 
                  FlatButton.icon(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    label: Text('Delete'),
                    onPressed: () => deleteTx(transactions[index].id),
                  )
                  :
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(transactions[index].id),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
