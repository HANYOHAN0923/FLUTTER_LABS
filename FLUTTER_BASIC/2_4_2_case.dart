//선택인수
/* 
var something({String name, int age}) {}

void main() {
  something(name: "John");
}
### 이렇게 {} 안에 있는 인수는 선택적 사용이 가능하다
*/

// 삼항연산
bool isRainy = true;
var todo = isRainy ? "Do" : "Not";

/*
void main() {
  print(todo);
}
*/

enum Status { Unintialized, Authenticated, Authenticating, Unauthenticated }

void main() {
  var status = Status.Authenticated;
  switch (status) {
    case Status.Authenticated:
      print('인증됨');
      break;
    case Status.Authenticating:
      print('인증 처리 중');
      break;
    case Status.Unauthenticated:
      print('미인증');
      break;
    case Status.Unintialized:
      print('초기화됨');
      break;
  }
}
