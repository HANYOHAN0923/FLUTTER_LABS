import 'package:flutter/material.dart';
import 'root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //이거 primarySwatch: Colors.white는 왜 안되고, blue만 되는지 오류 해결하기
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        accentColor: Colors.black
      ),
      home: RootPage(),
    );
  }
}