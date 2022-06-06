// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_kharcha/trans.dart';
import 'package:intl/intl.dart';

class transactionsList extends StatelessWidget {
  final List<trans> Transactions;
  final Function deleteTX;
  transactionsList(this.Transactions, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    return Transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transactions added yet!',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset('assets/images/waiting1.png'),
            ],
          )
        : ListView.builder(
            itemBuilder: (cnt, idx) {
              return Card(
                color: Color.fromARGB(118, 20, 3, 31),
                elevation: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 14, 22),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        Transactions[idx].price.toStringAsFixed(2),
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Transactions[idx].title,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          DateFormat().format(Transactions[idx].dt),
                          style: TextStyle(
                              color: Color.fromARGB(255, 215, 225, 69),
                              fontSize: 13),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => deleteTX(Transactions[idx].id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ],
                ),
              );
            },
            itemCount: Transactions.length,
          );
  }
}
