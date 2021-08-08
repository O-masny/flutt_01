import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/theme.dart';
import 'package:flutter_control/core.dart';

class AddButton extends StatelessWidget with ThemeProvider<NazevMojehoTheme> {
  AddButton(this.ontap, {Key? key}) : super(key: key);

  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
          decoration: BoxDecoration(
            color: theme!.primaryColor,
            borderRadius: BorderRadius.circular(45),
          ),
          child: IconButton(
            onPressed: ontap,
            icon: Icon(Icons.add),
            color: theme!.primaryColorDark,
          )),
    );
  }
}
