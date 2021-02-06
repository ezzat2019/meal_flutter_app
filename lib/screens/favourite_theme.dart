import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/providers/theme_provider.dart';
import 'package:meal_flutter_app/widgets/group_radio_button.dart';
import 'package:meal_flutter_app/widgets/picker_color.dart';
import 'package:meal_flutter_app/widgets/picker_color_accent.dart';
import 'package:provider/provider.dart';

class FavouriteTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: Directionality(
      textDirection:
          myProvider.switch_lan ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            !myProvider.switch_lan
                ? myProvider.mapEn["theme_title"]
                : myProvider.mapAr["theme_title"],
            style: TextStyle(color: Theme.of(context).buttonColor),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.navigate_before,
              color: Theme.of(context).buttonColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
            body: LayoutBuilder(
          builder: (ctx, constrain) {
            return Container(
              height: constrain.maxHeight,
              width: constrain.maxWidth,
              child: Column(
                children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 8),
                    child: Text(
                      !myProvider.switch_lan
                          ? myProvider.mapEn["theme_sub"]
                          : myProvider.mapAr["theme_sub"],
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).buttonColor),
                    ),
                  )),
                  Flexible(
                    child: ListView(
                      children: [
                        Container(
                          child: Text(
                            !myProvider.switch_lan
                                ? myProvider.mapEn["theme_mode"]
                                : myProvider.mapAr["theme_mode"],
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).buttonColor),
                          ),
                          margin: EdgeInsets.all(20),
                        ),
                        GroupRadioButton(),
                        Row(
                          children: [
                            Expanded(
                                flex: 80,
                                child: Container(
                                    margin: EdgeInsets.only(left: 20, top: 8),
                                    child: Text(
                                      !myProvider.switch_lan
                                          ? myProvider.mapEn["theme_p_c"]
                                          : myProvider.mapAr["theme_p_c"],
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).buttonColor),
                                    ))),
                            Expanded(flex: 20, child: PickerColor()),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 80,
                                child: Container(
                                    margin: EdgeInsets.only(left: 20, top: 20),
                                    child: Text(
                                      !myProvider.switch_lan
                                          ? myProvider.mapEn["theme_s_c"]
                                          : myProvider.mapAr["theme_s_c"],
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).buttonColor),
                                    ))),
                            Expanded(
                                flex: 20,
                                child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: PickerColorAccent())),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
