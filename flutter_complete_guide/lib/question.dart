// 암묵적인 규칙: 파일 하나당 하나의 위젯
// small custom widget that can help with performance
// the data from outside changed when the build method in main run again
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    //container() a bunch of settings that allow you to space things and to align things
    //the core of the container always is the child
    //Padding : internal spacing inside of container
    //Border : can be drawn, give it a color, such like outline
    //margin: spacing around the container, between the container and neighboring elements
    return Container(
      width: double.infinity, //가져올 수 있는 최대치
      margin: EdgeInsets.all(10),
      //Text에는 style이라는 namedArgument가 있는데 이것은 TextStyle객체를 필요로 한다
      //이 객체는 위젯은 아니고, 그냥 평범한 TextStyle을 통한 객체이다. material.dart로부터 제공 받음
      //create a new instance by instantiating text style like instantiate classes
      //TextStyles는 configure the text style하기위해 많은 namedArgument를 갖고 있다
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
