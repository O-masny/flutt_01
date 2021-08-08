import 'package:flutter/material.dart';
import 'package:flutter_application_4/control/my_home_control.dart';
import 'package:flutter_application_4/models/data.dart';
import 'package:flutter_application_4/theme.dart';
import 'package:flutter_application_4/widgets/buttons/add_button.dart';
import 'package:flutter_application_4/widgets/itemlist/item_column.dart';
import 'package:flutter_control/core.dart';

class MyHomePage extends SingleControlWidget<MyHomePageControl>
    with ThemeProvider<NazevMojehoTheme> {
  MyHomePage({Key? key}) : super(key: key);
  @override
  MyHomePageControl? initControl() {
    return MyHomePageControl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme!.backgroundColor,
      appBar: AppBar(
        bottomOpacity: 1,
        backgroundColor: theme!.backgroundColor,
        centerTitle: true,
        title: Text(localize("to_do_app")!,
            style: TextStyle(color: theme!.primaryColor)),
        leading: IconButton(
          onPressed: () {
            control!.tmp = !(control!.tmp);
          },
          icon: Icon(Icons.menu),
          color: theme!.primaryColor,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListBuilder<Data>(
                  control: control!.upcoming,
                  builder: (context, data) {
                    return ItemList(data, ListType.upcoming, isdone: false);
                  }),
              ListBuilder<Data>(
                  control: control!.finished,
                  builder: (context, data) {
                    return ItemList(data, ListType.finished, isdone: true);
                  }),
              ListBuilder<Data>(
                  control: control!.favorites,
                  builder: (context, data) {
                    return ItemList(data, ListType.favourite);
                  }),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 10 ),
            child: Positioned(
                bottom: 0,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AddButton(() => control!.additemtolist(context)))),
          ),
        ],
      ),
    );
  }
}
