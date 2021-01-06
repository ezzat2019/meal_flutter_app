import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/screens/category_screen.dart';
import 'package:meal_flutter_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(40),
            width: double.infinity,
            height: 120,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
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
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return CategoryScreen();
              }));
            },
            leading: Icon(Icons.restaurant),
            title: Text(
              "Meal",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed'),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return FilterScreen();
              }));
            },
            leading: Icon(Icons.settings),
            title: Text(
              "Filters",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed'),
            ),
          )
        ],
      ),
    );
  }
}