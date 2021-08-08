

import 'package:flutter_control/core.dart';

class MyItemSheet extends BaseControl {
  final inputcontrol = InputControl();
  BoolControl isFinished = BoolControl(true);
  List pole = ['Ondra', true];

  void closeSheet(BuildContext context) {
    Navigator.pop(context,MyItemSheetResult(inputcontrol.text, isFinished.value!));
  }
}

class MyItemSheetResult {
  final String result;
  final bool boolresult;
  MyItemSheetResult(this.result, this.boolresult);
}
