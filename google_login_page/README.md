# google_login_page

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### 구상

삼항연산자부분은 enum써서 id, pwd, loggedin
렌더링할 화면들을 먼저 리스트로 메인다트 파일에 만든다
main.dart에서는 렌더링할 화면을 결정한다. 삼항연산자로 정함, 아이디 페이지에서 아이디가 넘어오면, 입력받은 아이디 값을 페스워드 페이지로 넘겨주면서, 화면또한 비밀번호 페이지로 넘어간다.
비밀번호가 입력되면 계정 추가하기랑 현재 계정 나와있는 페이지로 넘어가게끔
