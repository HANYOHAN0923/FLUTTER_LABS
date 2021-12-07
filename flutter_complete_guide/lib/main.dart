import 'package:flutter/material.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//_privateClass can only be used inside the main.dart
class _MyAppState extends State<MyApp> {
  //private property of this class
  int _questionIndex = 0;

  void _textChanger() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<String> questionList = [
      'Choose an odd number',
      'Choose an even number'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questionList[_questionIndex],
            ),
            RaisedButton(
              child: Text('0'),
              onPressed: _textChanger,
            ),
            RaisedButton(
              child: Text('1'),
              onPressed: () => _questionIndex++,
            ),
            RaisedButton(
              child: Text('2'),
              onPressed: () {
                _questionIndex++;
                print(_questionIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}
