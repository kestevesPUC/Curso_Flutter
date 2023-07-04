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
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransections.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        // color: Theme.of(context).colorScheme.secondary,
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransections.map((tr) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    tr['day'].toString(),
                    (tr['value'] as double),
                    _weekTotalValue == 0
                        ? 0
                        : (tr['value'] as double) / _weekTotalValue),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
