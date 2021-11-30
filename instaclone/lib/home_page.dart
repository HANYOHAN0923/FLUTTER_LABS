import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Instagram Clone',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Instagram에 오신 것을 환영합니다',
                  style: TextStyle(fontSize: 24.0),),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text('사진과 동영상을 보려면 팔로우하세요.'),
                  Padding(padding: EdgeInsets.all(16.0)),
                  //감싸고 있는 자식의 크기 결정
                  SizedBox(
                    width: 260.0,
                    //Card는 Card 형태의 태두리만 지원함
                    child: Card(
                      //그림자
                      elevation: 4.0,
                      //card 안의 위젯 column으로 세로 정열
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                         children: <Widget>[
                           Padding(padding: EdgeInsets.all(2.0)),
                           SizedBox(
                             width: 80.0,
                             height: 80.0,
                             child: CircleAvatar(
                               //온라인으로 이미지 받아오기
                               backgroundImage: NetworkImage('https://miro.medium.com/max/1838/1*9QDncOsyMRkO3pBcBHe_dw.png'),
                             ),
                           ),
                           Padding(padding: EdgeInsets.all(8.0)),
                           Text('gksdygks2124@gmail.com', style: TextStyle(fontWeight: FontWeight.bold),),
                           Text('John Han'),
                           Padding(padding: EdgeInsets.all(8.0)),
                           //이미지 우로 정열
                           Row(
                             //Row 안의 assets 가운데 정렬
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               SizedBox(
                                 width: 70.0,
                                 height: 70.0,
                                 child: Image.network('https://miro.medium.com/max/1838/1*9QDncOsyMRkO3pBcBHe_dw.png', fit: BoxFit.cover),
                               ),
                               Padding(padding: EdgeInsets.all(2.0)),
                               SizedBox(
                                 width: 70.0,
                                 height: 70.0,
                                 child: Image.network('https://miro.medium.com/max/1838/1*9QDncOsyMRkO3pBcBHe_dw.png', fit: BoxFit.cover),
                               ),
                               Padding(padding: EdgeInsets.all(2.0)),
                               SizedBox(
                                 width: 70.0,
                                 height: 70.0,
                                 child: Image.network('https://miro.medium.com/max/1838/1*9QDncOsyMRkO3pBcBHe_dw.png', fit: BoxFit.cover),
                               ),
                             ],
                           ),
                           Padding(padding: EdgeInsets.all(4.0)),
                           Text('Facebook 친구'),
                           Padding(padding: EdgeInsets.all(4.0)),
                           RaisedButton(
                             child: Text('팔로우'),
                             color: Colors.blueAccent,
                             textColor: Colors.white,
                             onPressed: () {}
                           ),
                           Padding(padding: EdgeInsets.all(4.0))
                         ]
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
