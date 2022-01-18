import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);
/*
More on "for" Loops
"for" Loops are an important language feature in many programming languages - the same is true for Dart.

You learned about this syntax:

for (var i = 0; i < recentTransactions.length; i++) {
    print(recentTransactions[i]); // access list items with [i] => i is dynamic!
}
Looping through a list (to then do something with each list item) is such a common case, that Dart actually has a different kind of "for" loop as well:

for (var tx in recentTransactions) {
    print(tx); // tx is the item already! Changes with every iteration of course
}
It's of course up to you which approach you use - you should definitely be aware of both approaches, also because some programming languages only offer approach #1 and not approach #2.
*/
  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'] as String,
                  data['amount'] as double,
                  // 삼항 연산자를 사용 안하면 devidedbyzero 발생 따라서 0일 경우 출력할 것을 정함
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
