import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;

  Result(this.totalScore);
  // getter 쓰는 이유는 내부속성을 외부에서 알지 못하게 하고, 접근이 불가능하게 하여 객체지향의 목적인 '정보 은닉'과 '객체 무결성 보장'을 위함
  // 무결성: 데이터 베이스의 값이 정확하다는 것을 의미, 항상 정확한 데이터를 유지하고 있다는 것을 의미한다
  //getting: special type of property
  //a mixture of property and method
  //create a getter by first of all defining which type of value you want to get
  //then you add the get keyword and then anyname you want
  //unlike in a method, dont add parentheses because a getter is like a mthod that can never receive any arguments
  //note a function, but simply a dart feature(normal property)
  String get resultPhrase {
    var resultText;

    if (totalScore == 100) {
      resultText = "Perfect!";
    } else if (totalScore == 75) {
      resultText = "Awesome!";
    } else if (totalScore == 50) {
      resultText = 'Not bad';
    } else if (totalScore == 25) {
      resultText = 'Bad';
    } else {
      resultText = 'Terrible';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
