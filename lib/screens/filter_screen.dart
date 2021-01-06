import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false,
      isVegan = false,
      isVegetarian = false,
      isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
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
      drawer: MainDrawer(),
    );
  }
}
