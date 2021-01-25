import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' as shared_pref;
import 'package:toast/toast.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilter;

  FilterScreen(this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState(setFilter);
}

class _FilterScreenState extends State<FilterScreen> {
  final Function setFilter;
  bool isGlutenFree = false,
      isVegan = false,
      isVegetarian = false,
      isLactoseFree = false;
  Map<String, bool> filterMap = Map();

  @override
  void initState() {
    shared_pref.SharedPreferences.getInstance().then((value) {
      if (value.containsKey("isGlutenFree")) {
        isGlutenFree = value.getBool("isGlutenFree");
      }
      if (value.containsKey("isVegan")) {
        isVegan = value.getBool("isVegan");
      }
      if (value.containsKey("isVegetarian")) {
        isVegetarian = value.getBool("isVegetarian");
      }
      if (value.containsKey("isLactoseFree")) {
        isLactoseFree = value.getBool("isLactoseFree");
      }
      setState(() {});
      print("ddddddddddddddddddddddddddddddddddddddddd2 $isGlutenFree");
    });
  }

  _FilterScreenState(this.setFilter) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Filters",
          style: TextStyle(color: Theme.of(context).buttonColor),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save, color: Theme.of(context).buttonColor),
              onPressed: () {
                setState(() {
                  shared_pref.SharedPreferences.getInstance().then((value) {
                    value.setBool("isGlutenFree", isGlutenFree);
                    value.setBool("isVegan", isVegan);
                    value.setBool("isVegetarian", isVegetarian);
                    value.setBool("isLactoseFree", isLactoseFree);
                    Toast.show("Saved!", context, duration: Toast.LENGTH_LONG);
                    filterMap['isGlutenFree'] = isGlutenFree;
                    filterMap['isVegan'] = isVegan;
                    filterMap['isVegetarian'] = isVegetarian;
                    filterMap['isLactoseFree'] = isLactoseFree;
                    setFilter(filterMap);
                  });
                });
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 22),
            child: Text(
              "Adjust your meal selection.",
              style: TextStyle(
                color: Theme.of(context).buttonColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: isGlutenFree,
                  onChanged: (is_checked) {
                    setState(() {
                      isGlutenFree = is_checked;
                    });
                  },
                  title: Text(
                    "Gluten-free",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                  subtitle: Text(
                    "Only include gluten free meals",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                ),
                SwitchListTile(
                  value: isVegan,
                  onChanged: (is_checked) {
                    setState(() {
                      isVegan = is_checked;
                    });
                  },
                  title: Text(
                    "Vegan",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                  subtitle: Text(
                    "Only include vegan meals.",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                ),
                SwitchListTile(
                  value: isVegetarian,
                  onChanged: (is_checked) {
                    setState(() {
                      isVegetarian = is_checked;
                    });
                  },
                  title: Text(
                    "Vegetarian",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                  subtitle: Text(
                    "Only include vegetarian meals.",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                ),
                SwitchListTile(
                  value: isLactoseFree,
                  onChanged: (is_checked) {
                    setState(() {
                      isLactoseFree = is_checked;
                    });
                  },
                  title: Text(
                    "lactose-free",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                  subtitle: Text(
                    "Only include lactose free meals.",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // drawer: MainDrawer(setFilter),
    );
  }
}
