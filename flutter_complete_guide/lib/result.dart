import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback restartQuiz;

  Result(this.totalScore, this.restartQuiz);

  String get resultPhrase {
    var resultText;

    if (totalScore == 100) {
      resultText = "Score: 100\nPerfect!";
    } else if (totalScore == 75) {
      resultText = "Score: 75\nAwesome!";
    } else if (totalScore == 50) {
      resultText = 'Score: 50\nNot bad';
    } else if (totalScore == 25) {
      resultText = 'Score: 25\nBad';
    } else {
      resultText = 'Score: 0\nTerrible';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: restartQuiz,
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
