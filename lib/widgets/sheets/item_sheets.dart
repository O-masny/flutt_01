import 'package:flutter_application_4/control/item_sheet_control.dart';
import 'package:flutter_control/core.dart';

class ItemSheet extends SingleControlWidget<MyItemSheet> {
  ItemSheet({Key? key}) : super(key: key);

  MyItemSheet? initControl() {
    return MyItemSheet();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InputField(control: control!.inputcontrol),
      FieldBuilder<bool?>(
        control: control!.isFinished,
        builder: (context, value) {
          return  Switch(
            value: value!,
            onChanged: (newvalue) => control!.isFinished.setValue(newvalue));
        }),
      OutlinedButton(
          onPressed: () => control!.closeSheet(context), child: Icon(Icons.close))
    ]);
  }
}
// Switch  => ano/ne => ano/ne == isFinished
// Switch changed => onChanged
// onChanged returns (_naCoSeSwitchZmenil_) => _coSTimChciUdelat();
