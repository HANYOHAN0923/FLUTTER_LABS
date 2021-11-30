Future networkRequest() async {
  print('network request starts');
  await Future.delayed(Duration(seconds: 1));
  print('1');
  await Future.delayed(Duration(seconds: 1));
  print('2');
  await Future.delayed(Duration(seconds: 1));
  print('3');
  await Future.delayed(Duration(seconds: 1));
  print('network request success');
}

void main() {
  print('start');

  networkRequest();

  print('end');
}