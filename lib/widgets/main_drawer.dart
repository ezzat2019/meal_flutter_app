import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/modules/meal.dart';
import 'package:meal_flutter_app/providers/theme_provider.dart';
import 'package:meal_flutter_app/screens/favourite_theme.dart';
import 'package:meal_flutter_app/screens/filter_screen.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  final Function setFilter;
  Function pp;
  List<Meal> favList;

  MainDrawer(this.setFilter, this.pp, this.favList);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Directionality(
        textDirection:
            myProvider.switch_lan ? TextDirection.rtl : TextDirection.ltr,
        child: Drawer(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                width: double.infinity,
                height: 120,
                alignment: Alignment.centerLeft,
                color: Theme.of(context).accentColor,
                child: Text(
                  !myProvider.switch_lan
                      ? myProvider.mapEn["d_title"]
                      : myProvider.mapAr["d_title"],
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: Icon(Icons.restaurant,
                    color: Theme.of(context).buttonColor),
                title: Text(
                  !myProvider.switch_lan
                      ? myProvider.mapEn["d_meal"]
                      : myProvider.mapAr["d_meal"],
                  style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'RobotoCondensed'),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return FilterScreen(setFilter);
                  }));
                },
                leading:
                    Icon(Icons.settings, color: Theme.of(context).buttonColor),
                title: Text(
                  !myProvider.switch_lan
                      ? myProvider.mapEn["d_filter"]
                      : myProvider.mapAr["d_filter"],
                  style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'RobotoCondensed'),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return FavouriteTheme();
                  }));
                },
                leading: Icon(Icons.twenty_three_mp,
                    color: Theme.of(context).buttonColor),
                title: Text(
                  !myProvider.switch_lan
                      ? myProvider.mapEn["d_theme"]
                      : myProvider.mapAr["d_theme"],
                  style: TextStyle(
                    color: Theme.of(context).buttonColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Theme.of(context).buttonColor,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            !myProvider.switch_lan
                                ? myProvider.mapEn["d_englis"]
                                : myProvider.mapAr["d_englis"],
                            style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context).buttonColor),
                          ))),
                  Expanded(
                    child: SwitchListTile(
                        value: Provider.of<ThemeProvider>(context).switch_lan,
                        onChanged: (val) {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .setSwitchLAn(val);
                        }),
                  ),
                  Expanded(
                      child: Container(
                          child: Text(
                    !myProvider.switch_lan
                        ? myProvider.mapEn["d_arabic"]
                        : myProvider.mapAr["d_arabic"],
                    style: TextStyle(
                        fontSize: 17, color: Theme.of(context).buttonColor),
                  ))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(color: Theme.of(context).buttonColor)
            ],
          ),
        ),
      ),
    );
  }
}
