import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  ///AppBar에 들어갈 것이 많아서 코드가 더러워질까봐 따로 함수로 분리해서 작성
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.exit_to_app),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        //Row 안에서 위쪽 배치
        crossAxisAlignment: CrossAxisAlignment.start,
        //간격이 전체적으러 벌어짐
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget> [
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://pbs.twimg.com/media/E29C4joUcAMMqHx.jpg'),
                    ),
                  ),
                  // 프사 우측 하단 버튼
                  Container(
                    //컨테이너랑 프사 사진 SizedBox 동일한 사이즈로 설정해야 alignment 사용 가능
                    width: 80.0,
                    height: 80.0,
                    //프사 버튼 우측 하단 정렬
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      //alignment 안 해주면 2개 버튼 같이 좌측을 기준으로 생성됨. 우측만 흰색 태두리 보임
                      alignment: Alignment.center,
                      children: <Widget>[
                        //흰색 태두리 버튼
                        SizedBox(
                          width: 28.0,
                          height: 28.0,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        //+ 파랑색 버튼
                        SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Text('이름',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )
            ],
          ),

          // 이 Text들이 좀 더 아래로 위치하면 좋을 것 같은데

          Text('0\n게시물',
              textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text('0\n팔로워',
              textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text('0\n팔로잉',
              textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
