import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // TextField https://dev-yakuza.posstree.com/ko/flutter/widget/textfield/
  // BottomModelSheet https://become-a-developer.tistory.com/entry/Modal-Bottom-Sheet-Widget-In-Flutter
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return; // 위의 조건문(텍스트 인풋 값이 옳지 않은 경우) 아래 addTx를 실행 안 함
    }

    // widget property: stful에서 state widget에서만 사용이 가능하며
    // 위의 stful에서 선언한, 인수로 받아오는 것을 위젯으로써 사용할 수 있게 연결해준다,
    widget.addTx(enteredTitle, enteredAmount);

    // 입력 후 자동으로 팝업 종료
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              // (_)는 받기는 하지만, 사용하지 않는 파라미터를 의미한다 하나의 암묵적 룰 convention이랄까
              // 그냥 의미있는 이름을 주기보다는 _로 사용하지 않는 파라미터라는 것을 의미하는 것이다
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
