import 'package:flutter/material.dart';

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
      'answers': [
        {'text': '7', 'score': 25},
        {'text': '4', 'score': 0},
        {'text': '100', 'score': 0},
        {'text': '36', 'score': 0}
      ]
    },
    {
      'questionText': 'Choose an even number',
      'answers': [
        {'text': '99', 'score': 0},
        {'text': '25', 'score': 0},
        {'text': '1', 'score': 0},
        {'text': '404', 'score': 25},
      ]
    },
    {
      'questionText': 'Choose an Natural Number',
      'answers': [
        {'text': '3.14', 'score': 0},
        {'text': '-24.2', 'score': 0},
        {'text': '0', 'score': 25},
        {'text': '-100', 'score': 0}
      ]
    },
    {
      'questionText': 'Choose a Prime Number',
      'answers': [
        {'text': '15', 'score': 0},
        {'text': '36', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '67', 'score': 25}
      ]
    }
  ];

  int _questionIndex = 0;
  var _totalScore = 0;

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _textChanger(int score) {
    print(_questionList.length);

    _totalScore += score;

    print(_totalScore);

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
            ? Quiz(
                textChanger: _textChanger,
                questionIndex: _questionIndex,
                questionList: _questionList,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
