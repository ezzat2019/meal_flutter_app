import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meal_flutter_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PickerColorAccent extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    return InkWell(
      onTap: () {
// create some values

// raise the [showDialog] widget
        showDialog(
          context: context2,
          child: Builder(
            builder: (ctx) => AlertDialog(
              title: const Text('Pick a color!'),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor:
                      Provider.of<ThemeProvider>(ctx).currentColorAccent,
                  onColorChanged: (color) {
                    Provider.of<ThemeProvider>(ctx, listen: false)
                        .setcurrentColorAccent(color);
                  },
                  showLabel: true,
                  pickerAreaHeightPercent: 0.8,
                ),
                // Use Material color picker:
                //
                // child: MaterialPicker(
                //   pickerColor: pickerColor,
                //   onColorChanged: changeColor,
                //   showLabel: true, // only on portrait mode
                // ),
                //
                // Use Block color picker:
                //
                // child: BlockPicker(
                //   pickerColor: currentColor,
                //   onColorChanged: changeColor,
                // ),
                //
                // child: MultipleChoiceBlockPicker(
                //   pickerColors: currentColors,
                //   onColorsChanged: changeColors,
                // ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: const Text('Got it'),
                  onPressed: () {
                    Navigator.of(context2).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
      child: CircleAvatar(
        backgroundColor:
            Provider.of<ThemeProvider>(context2).currentColorAccent,
      ),
    );
  }
}
