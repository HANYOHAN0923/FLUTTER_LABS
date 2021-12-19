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
        // Map은 키와 value 구성인데 여기서 Map<key타입,value타입>설정을 해줘야하는데 Object는 모든 클래스의 상위 클래스로써 어떤 타입이든 받을 수 있다.
        ...(questionList[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => textChanger(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
