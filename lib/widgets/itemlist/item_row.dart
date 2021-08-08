import 'package:flutter_application_4/models/data.dart';
import 'package:flutter_application_4/theme.dart';
import 'package:flutter_control/core.dart';

class Items extends ControllableWidget<Data>
    with ThemeProvider<NazevMojehoTheme>, LocalizationProvider {
  Items(
    Data control,
    this.den, {
    Key? key,
  }) : super(control, key: key);
  final int den;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13, top: 8),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: theme!.backgroundColor),
          color: control.isdone ? Colors.deepOrange : Colors.blueAccent,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Row(
          children: [
            Text(
              '$den.  ${localize('${control.title}')!}',
              style: TextStyle(color: theme!.primaryColor, fontSize: 16),
            ),
            IconButton(
                padding: EdgeInsets.symmetric(horizontal: 7),
                icon: Icon(Icons.favorite),
                color:
                    (control.isfavourite) ? Colors.yellow : theme!.primaryColor,
                onPressed: () {
                  control.markAsFavourite(control);
                }),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 5),
              icon: control.isdone
                  ? Icon(Icons.close)
                  : Icon(Icons.add_task_sharp),
              color: theme!.primaryColor,
              onPressed: () {
                control.inverseItem(control);
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
