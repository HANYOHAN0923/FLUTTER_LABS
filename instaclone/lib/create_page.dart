import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  PickedFile _image;

  //화면이 없어질 때 해제를 해줘야하는 객체 textEditingController (메모리 해제)
 @override
 void dispose() {
   textEditingController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image == null ?Text('No Image') : Image.file(File(_image.path)),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
            //텍스트 값을 가져오는 함수
            controller: textEditingController,
          ),
        ]
      ),
    );
  }


  // 비동기처리, 앱실행 후, image는 처음에는 null 상태고, 나중에 future로 File형태가 될 것임
  // 따라서 async await로 비동기 처리 진행
  Future _getImage() async {
   PickedFile image = await _picker.getImage(source: ImageSource.gallery);

   setState(() {
     _image = image;
   });
 }
}
