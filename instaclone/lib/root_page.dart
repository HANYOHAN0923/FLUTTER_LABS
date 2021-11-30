import 'package:flutter/material.dart';
import 'tab_page.dart';
import 'login_page.dart';

/*
가장 기초되는 페이지
# 말만 페이지지 사실상 보이는 것은 없음
# 아무것도 보이는 UI 없이, 로그인 상태여부만 체크할 것임
# 체크 여부에 따라서 homepage나 login페이지로 보낼 것
 */
//한번 보여주면 또 보여줄 필요 없음 그래서 stful이 아닌 stless로 만듬
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
