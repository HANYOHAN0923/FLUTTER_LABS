import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
    const questionList = [
      {
        'questionText': 'Choose an odd number',
        'answers': ['4', '100', '7', '36']
      },
      {
        'questionText': 'Choose an even number',
        'answers': ['99', '25', '1', '404']
      },
      {
        'questionText': 'Choose an Natural Number',
        'answers': ['3.14', '-24.2', '0', '-100']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questionList[_questionIndex]['questionText'] as String,
            ),
            // as List<String>을 붙인거는 다트에서 인식을 못해서 추가함
            ...(questionList[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_textChanger, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
