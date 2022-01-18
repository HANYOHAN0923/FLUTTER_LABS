import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'pw_page.dart';

const String _url = 'https://flutter.dev';

class LoginCard extends StatefulWidget {
  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final idController = TextEditingController();

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 430,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 40)),
              SizedBox(
                  width: 70, child: Image.asset('assets/images/google.png')),
              const Padding(padding: EdgeInsets.all(5)),
              const Text('로그인',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const Padding(padding: EdgeInsets.all(5)),
              const Text('Google 계정 사용',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const Padding(padding: EdgeInsets.all(13)),
              Container(
                width: 235,
                height: 50,
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person_outline),
                    labelText: '이메일 또는 휴대전화',
                    hintText: '이메일 또는 휴대전화',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(1)),
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: TextButton(
                  onPressed: _launchURL,
                  child: const Text(
                    '이메일을 잊으셨나요?',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Container(
                  width: 235,
                  child: const Text(
                    '내 컴퓨터가 아닌가요? 게스트 모드를 사용하여 비공개로 로그',
                    style: TextStyle(fontSize: 9),
                  )),
              Container(
                width: 235,
                child: Row(
                  children: [
                    const Text(
                      '인하세요.',
                      style: TextStyle(fontSize: 9),
                    ),
                    TextButton(
                        onPressed: _launchURL,
                        child: const Text(
                          '자세히 알아보기',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                width: 235,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: _launchURL,
                        child: const Text(
                          '계정 만들기',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 9,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      width: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PwPage(email: idController.text)));
                        },
                        child: const Text(
                          '다 음',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
