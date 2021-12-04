import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Text('Nice to meet you'),
            RaisedButton(
              child: Text('Nope'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Likewise'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Get away from me'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
