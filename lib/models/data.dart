import 'package:flutter_control/core.dart';

class Data extends BaseControl with ActionComponent {
  String _item;
  bool _isfav = false;
  bool _isdone = false;
  final void Function(Data) markAsFavourite;
  final void Function(Data) inverseItem;

  bool get isfavourite => _isfav;
  set isfavourite(bool tmp) {
    _isfav = tmp;
  
    notify();
  }

  bool get isdone => _isdone;
  set isdone(bool tmp) {
    _isdone = tmp;

    notify();
  }

  String get title => _item;
  set title(String val) {
    _item = val;
    notify();
  }

  Data(this._item,
      {bool favo = false, required this.markAsFavourite,required this.inverseItem, isdone = false}) {
    this._isfav = favo;
    this._isdone = isdone;
  }
}
