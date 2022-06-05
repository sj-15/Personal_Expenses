import 'package:flutter/material.dart';
import 'package:personal_kharcha/chart_bar.dart';
import 'package:personal_kharcha/trans.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<trans> recenttrans;
  Chart(this.recenttrans);

  List<Map<String, Object>> get groupedtransactionsvalues {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(
          Duration(days: index),
        );

        double totalsum = 0.0;
        for (int i = 0; i < recenttrans.length; i++) {
          if (recenttrans[i].dt.day == weekday.day &&
              recenttrans[i].dt.month == weekday.month &&
              recenttrans[i].dt.year == weekday.year) {
            totalsum += recenttrans[i].price;
          }
        }
        return {
          'day': DateFormat.E().format(weekday).substring(0, 1),
          'amount': totalsum
        };
      },
    );
  }

  double get maxspending {
    return groupedtransactionsvalues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        color: Color.fromARGB(255, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedtransactionsvalues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'].toString(),
                  data['amount'] as double,
                  maxspending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxspending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
