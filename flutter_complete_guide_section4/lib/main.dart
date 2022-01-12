import 'package:flutter/material.dart';

import 'package:flutter_complete_guide_section4/widgets/new_transaction.dart';
import 'package:flutter_complete_guide_section4/widgets/transaction_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      // Provided by Flutter
      // theme: allows u to setup a global application-wide theme and theme basically means a combination of colors, of text style, of font sizes that your entire application uses, that many of Flutters' widgets then use a default
      theme: ThemeData(
        //primaryColor is one single color, like Colors.blue / red
        primarySwatch: Colors
            .purple, // is based on single color but it automatically generates different shades of that color
        accentColor: Colors
            .amber, // is laternative color, because often u want to mix colors
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _startAddNewTransaction(BuildContext ctx) {
    // function provided by flutter(available here)
    // context(arg)
    // builder(arg) : is the function that needs to return the widget that should be inside of that modalbottomsheet
    // builder function itself also gives us a context(in this code i name this bCtx(_) to really make this clear and this is not the same value as ctx)
    // ctx is the context we pass to this function to pass it the modalbottomsheet
    // the modalbottomsheet then starts building that sheet that slides in and to that builder
    // ig again gives us its own context(bCtx), so its own package of meta information about
    // that widget which it builds
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          //return the widget which u want to show inside of this modalsheet
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontFamily: 'Open Sans'),
        ),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions)
          ],
        ),
      ),
      // floatingActionButton 위치
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingactionButton 설정
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
/*
With the latest version of Flutter, some theme identifiers changed.
display4 => headline1;
display3 => headline2;
display2 => headline3;
display1 => headline4;
headline => headline5;
title    => headline6; // used in previous lecture
subhead  => subtitle1;
subtitle => subtitle2;
body2    => bodyText1; // will be used in future lectures
body     => bodyText2; // will be used in future lectures
*/