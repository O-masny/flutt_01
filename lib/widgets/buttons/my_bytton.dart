import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(this.isCorrect, {Key? key}) : super(key: key);

  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isCorrect) ? Colors.red : Colors.green,
        borderRadius: BorderRadius.circular(45),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(isCorrect == true ? Icons.close : Icons.check),
      ),
    );
  }
}