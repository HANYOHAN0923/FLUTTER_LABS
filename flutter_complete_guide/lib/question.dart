// the data from outside changed when the build method in main run again
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //가져올 수 있는 최대치
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
        ),
        //TextAlign.center => enum whici is a list of predefined values
        textAlign: TextAlign.center,
      ),
    );
  }
}
