import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //함수를 저장한다
  //VoidCallback function takes no parameters, arguments
  final VoidCallback buttonSelected;
  final String answerText;

  Answer(this.buttonSelected, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: buttonSelected,
      ),
    );
  }
}
