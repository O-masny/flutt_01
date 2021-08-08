import 'package:flutter/cupertino.dart';
import 'package:flutter_application_4/models/data.dart';
import 'package:flutter_application_4/theme.dart';
import 'package:flutter_application_4/widgets/itemlist/item_row.dart';
import 'package:flutter_control/core.dart';

enum ListType { finished, upcoming, favourite }

class ItemList extends StatelessWidget with LocalizationProvider, ThemeProvider<NazevMojehoTheme>{
   ItemList(this.items, this.listType, {Key? key, this.isdone = false})
      : super(key: key);
  final ListType listType;
  final bool isdone;
  final List<Data> items;

  String returnString() {
    switch (listType) {
      case ListType.finished:
        return localize('finished')!;
      case ListType.upcoming:
       return localize('upcoming')!;
      case ListType.favourite: 
        return localize('favourite')!;
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10),
          child: Text((returnString()),
          style: TextStyle(color: theme!.primaryColor,fontSize: 18),
          ),
        ),
        for (var i = 0; i < items.length; i++)
          Items(
            items[i],
            i,       
          ),
      ],
    );
  }
}
