import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'ADIDAS Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'NIKE Shoes', amount: 99.99, date: DateTime.now())
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          //main은 자신을 기준으로 매인 방향: 칼럼은 위에서 아래, 로우는 왼에서 오
          //croess는 서브 방향 좌에서 우(칼럼), 위에서 아래(로우)
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Card의 크기는 child나 아래 부모 위젯에 따라 결정
            Card(
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Text('CHART!'),
              ),
              //그림자
              elevation: 5,
            ),
            Container(
              width: 100,
              child: Card(
                color: Colors.red,
                child: Text('Transaction'),
              ),
            ),
            //toList because map will always give u an iterable which u need to transform to a list
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          tx.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(tx.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(tx.date.toString(),
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
// Can absolutely have a Row in a Column, vide versa, also Row in Rows Columns in Columns
// Flutter Widgets Style: Via constructor arguments
