//함수명 f, 매개변수 int Type, 반환값 int Type
//f함수는 int 타입의 매개변수 x를 받고 x + 10을 int 타입으로 반환하는 함수
// 여기서 x는 매개변수, 함수를 콜할 때 실질적으로 입력할 값을 인수라고 한다
int f(int x) {
  return x + 10;
}

//f함수에 10이라는 인수를 전달하여 반환된 결과를 result변수에 대입함
void main() {
  var result = f(10);
}

//매개변수는 없을 수도, 여러개일 수도 있다
int func(int x, int y) {
  return x + y;
}

String greet() {
  return "Hello World";
}

//함수가 꼭 값을 반환할 필요는 없다. 함수명이 void인 경우 반환값이 없다는 키워드이다.
void func_print(int x) {
  print(x);
}

//반환 타입으로 모든 타입과 void를 지정할 수 있다
//반환 타입 역시 타입 추론에 의해 생략 가능하다
// 아래 2개의 함수는 동일한 함수이다.
//print함수가 반환값이 void인 대표적인 함수이다.
void greeting(String greet) {
  print("Hello World");
}

greeting_1(String greet) {
  print("Hello World");
}

// 클래스 밖에 작성하는 함수를 ㅚ상위 함수라고 한다.
// 클래스 내부에 작성하는 함수를 메서드라고 부른다.
// 클래스 내부에 선언된 메ㅓ드라도, static 키워드를 통해 정적 메서드가 되며 최상위 함수처럼 사용이 가능하다
// 최상위 함수는 어디서든 호출할 수 있는 함수이다.

bool isEven(int number) {
  return number % 2 == 0;
}

void main() {
  print(isEven(10));
}

//lambda 함수명(인수명)=>[동작 또는 반환값]
func_lambda(number) => number % 2 == 0;
