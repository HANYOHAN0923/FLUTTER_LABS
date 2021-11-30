import 'package:flutter/cupertino.dart';

void main() {
  //ignore_for_file: avoid_print
  //https://stackoverflow.com/questions/69531248/avoid-print-calls-in-production-code-documentation
  var a = 10;
  var str = 'Hello';
  var b = 3.5;
  var isMarried = true;

  //type num은 int, double 다 보함하고 있음

  //final 상수: 런타임시 결정되는 값도 상수로 설정할 수 있음
  final e = 10;
  //const 상수: 컴파일 타임에 상수를 설정한다
  const f = 20;
  //https://skymin2.tistory.com/52 참고하기


  //타입변동
  dynamic c = 10; //하나의 변수가 여러타입으로 변경될 가능성이 있는 경우

  List<int> items = [1,2,3,4];

  var items2 = [...items, 4,5];

  List<String> strItems = ['a','b','c','d'];

  var itemSet = {1,2,3,4};

  var itemMap = {
    'key1': 1,
    'key2': 2
  };



  var varItems = [1,'2',3,'4'];
  varItems.add(5);

  print(items);
  print(items2);
  print(strItems);
  print(varItems[1]);
  print(varItems);

  //is 타입체크, is not도 있음
  if (a is int) {
    print('integer');
  } else {
    print('not integer');
  }


  //class 반복되는 작업 줄이기
  var kim = IZONE();
  kim.setName('김채원');
  kim.setAge(22);

  var jo = IZONE()
    ..setName("조유리")
    ..setAge(21);



  var name;
  print(name ?? 'NULL'); //result: null, ?? ' ' null일 때 기본값 부여
  print(name?.toLowerCase()); // ?를 통해 null이 아닐때만 실행되도록처리

  var person = Person("John Han", 10);
  print(person);

  //loop
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }

  //함수 타입에 대해서 설명잘해야함

  //선택 매개변수 #####################################
  something(name: 'John', age: 11);
}

  // 변수에 default 값 지정 가능
void some(String name, {int age = 10}) {

}
  //  @required something() 사용할 때 필요 조건으로
void something({String nationality = 'Korea', String name, @required int age}) {
  print(name);
}

//_variable_name => secret, variable_name => public
class Person {
  String _name;
  int _age;

  Person(this._name,this._age);

  //lambda
  String get name => 'my name is $_name';

  //원래 함수
  String get age {
    print('I am $_age years old');
  }

}

//class 반복되는 작업 줄이기
class IZONE {
  String name;
  int age;

  void setName(String name) {
    this.name = name;
  }

  void setAge(int age) {
    this.age = age;
  }
}

//class extends와 implements(메소드만 가져오기)
class Students extends Person{
  Students(String name, int age) : super(name, age);

}

// implements 대신 꼭 써야하는 메서드만 골라 쓰고 싶을 떄는 with 쓴다
class Teacher implements Person{
  @override
  int _age;

  @override
  String _name;

  @override
  // TODO: implement age
  String get age => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();


  //네트워크 요청 언제 시작하고 끝날지 모를때 쓰는 메소드는 Future
  Future networkRequest() {
    return Future.delayed(Duration(seconds: 3));
  }
}