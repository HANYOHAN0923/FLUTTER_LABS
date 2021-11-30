import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Instagram',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(50.0),),
              SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    //비동기 처리
                    _handleSignIn().then((user){
                      print(user);
                    });
                  },
              )
            ],
          ),
        ),
    );
  }

  //로그인은 무조건 비동기로 이루어짐
  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken)
    );
    return user;
  }
}
