import 'package:flutter/material.dart';
import 'home_page.dart';
import 'account_page.dart';
import 'search_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  int _selectedIndex = 0;

  //화면 리스트
  List _pages = [
    HomePage(),
    SearchPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar 클릭시 화면 이동
      body: Center(child: _pages[_selectedIndex]),
      //bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        //바텀네비게이션 아이콘 색
        fixedColor: Colors.black,
        onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Account')),
      ]),
    );
  }

  ///bottomnavigationbar 클릭시 인덱스 변경
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
