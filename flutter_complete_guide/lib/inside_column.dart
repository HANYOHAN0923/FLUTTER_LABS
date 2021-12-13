//망함
import 'package:flutter/material.dart';

class insideColumn extends StatelessWidget {
  final String? questionText;
  final VoidCallback? buttonSelected;
  final String? answerText;

  insideColumn({this.questionText, this.buttonSelected, this.answerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            questionText ?? "Null",
            style: TextStyle(
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(8.0)),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(answerText ?? "Null"),
            onPressed: buttonSelected,
          ),
        ],
      ),
    );
  }
}
