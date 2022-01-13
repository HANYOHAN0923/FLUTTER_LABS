import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final useridController = TextEditingController();
  final userpwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: Card(
          child: Column(
        children: [
          Image.asset('assets/images/google.png'),
          Text('로그인'),
          Text('Google 계정 사용'),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            width: 235,
            height: 50,
            child: TextField(
              controller: useridController,
              decoration: InputDecoration(
                //icon: Icon(Icons.person_outline),
                labelText: '이메일 또는 휴대전화',
                hintText: '이메일 또는 휴대전화',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
