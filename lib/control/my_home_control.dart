import 'package:flutter_application_4/models/data.dart';
import 'package:flutter_application_4/widgets/sheets/item_sheets.dart';
import 'package:flutter_control/core.dart';

class MyHomePageControl extends BaseControl with LocalizationProvider{
  bool tmp = true;

  late final upcoming = ListControl([
    Data(("work"), markAsFavourite: markAsFavourite, inverseItem: inverseItem),
    Data(("cycling"), markAsFavourite: markAsFavourite, inverseItem: inverseItem)
  ]);

  late final finished = ListControl([
    Data(("riding"),
        markAsFavourite: markAsFavourite,
        isdone: true,
        inverseItem: inverseItem),
    Data(("sunbathing"),
        markAsFavourite: markAsFavourite,
        isdone: true,
        inverseItem: inverseItem)
  ]);

  late final favorites = ListControl([
    Data(("favourites"),
        favo: true, markAsFavourite: markAsFavourite, inverseItem: inverseItem)
  ]);

  Future<void> additemtolist(BuildContext context) async {
    final vystupZRouty = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return ItemSheet();
        });

    if (vystupZRouty == null) {
      return;
    }
  }

  void markAsFavourite(Data item) {
    if (upcoming.contains(item)) {
      favorites.add(item);
      item.isfavourite = true;
      upcoming.remove(item);
    } else if (finished.contains(item)) {
      favorites.add(item);
      item.isfavourite = true;
      finished.remove(item);
    } else {
      favorites.remove(item);
      item.isfavourite = false;
      if (item.isdone) {
        finished.add(item);
      } else {
        upcoming.add(item);
      }
    }
  }

  void changeName(Data item, String name) {
    item.title = name;
  }

  void inverseItem(Data item) {
    favorites.remove(item);
    if (item.isdone) {
      upcoming.add(item);
      item.isdone = false;
      finished.remove(item);
     
    } else {
      finished.add(item);
      item.isdone = true;
      upcoming.remove(item);
      
    }
  }
}
