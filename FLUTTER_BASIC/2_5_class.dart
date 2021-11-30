// 변수명 앞에 _를 붙이면 외부에서 접근이 불가능해진다
class Person {
  String name;
  int _age;

  Person({this.name, this._age});
}
