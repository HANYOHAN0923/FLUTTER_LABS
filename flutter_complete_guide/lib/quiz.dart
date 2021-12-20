import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionList;
  final Function textChanger;
  final int questionIndex;

  Quiz(
      {required this.questionList,
      required this.textChanger,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionList[questionIndex]['questionText'] as String,
        ),
        ...(questionList[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => textChanger(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
