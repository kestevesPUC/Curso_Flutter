import 'package:expenses/models/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransaction, {super.key});

  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransections {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMouth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMouth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransections;
    return SizedBox(
      width: double.infinity,
      child: Card(
        // color: Theme.of(context).colorScheme.secondary,
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Row(
          children: groupedTransections.map((tr) {
            return ChartBar(tr['day'].toString(),
                double.parse(tr['value'].toString()), 0.5);
          }).toList(),
        ),
      ),
    );
  }
}
