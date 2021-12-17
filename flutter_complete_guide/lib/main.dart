import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questionList = const [
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

  int _questionIndex = 0;

  void _textChanger() {
    if (_questionIndex < _questionList.length) {
      print('We have more questions!');
    } else {
      print('No More Questions!');
    }

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // if condotion ?
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questionList.length
            // 가독성을 위해서, 더 위젯은 더 적고, 디테일 할 수록 좋음
            ? Quiz(
                textChanger: _textChanger,
                questionIndex: _questionIndex,
                questionList: _questionList,
              )
            // else block : => include another Widgets
            // Center => has child
            : Result(),
      ),
    );
  }
}
