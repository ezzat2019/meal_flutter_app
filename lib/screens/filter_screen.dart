import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  _FilterScreenState(this.setFilter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                filterMap['isGlutenFree'] = isGlutenFree;
                filterMap['isVegan'] = isVegan;
                filterMap['isVegetarian'] = isVegetarian;
                filterMap['isLactoseFree'] = isLactoseFree;
                setState(() {
                  setFilter(filterMap);
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
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
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
                  title: Text("Gluten-free"),
                  subtitle: Text("Only include gluten free meals"),
                ),
                SwitchListTile(
                  value: isVegan,
                  onChanged: (is_checked) {
                    setState(() {
                      isVegan = is_checked;
                    });
                  },
                  title: Text("Vegan"),
                  subtitle: Text("Only include vegan meals."),
                ),
                SwitchListTile(
                  value: isVegetarian,
                  onChanged: (is_checked) {
                    setState(() {
                      isVegetarian = is_checked;
                    });
                  },
                  title: Text("Vegetarian"),
                  subtitle: Text("Only include vegetarian meals."),
                ),
                SwitchListTile(
                  value: isLactoseFree,
                  onChanged: (is_checked) {
                    setState(() {
                      isLactoseFree = is_checked;
                    });
                  },
                  title: Text("lactose-free"),
                  subtitle: Text("Only include lactose free meals."),
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
