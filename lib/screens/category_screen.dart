import 'package:flutter/material.dart';
import 'package:meal_flutter_app/dummy_data.dart';
import 'package:meal_flutter_app/modules/meal.dart';
import 'package:meal_flutter_app/widgets/category_Item.dart';
import 'package:meal_flutter_app/widgets/main_drawer.dart';

class CategoryScreen extends StatefulWidget {
  Function pp;
  List<Meal> favList;

  CategoryScreen(this.pp, this.favList);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Map<String, bool> filterMap = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };
  List<Meal> meals = DUMMY_MEALS;

  void setFilter(Map<String, bool> filterMap) {
    setState(() {
      this.filterMap = filterMap;
      meals = DUMMY_MEALS.where((element) {
        if (filterMap["isVegetarian"] && !element.isVegetarian) {
          return false;
        } else if (filterMap["isLactoseFree"] && !element.isLactoseFree) {
          return false;
        } else if (filterMap["isVegan"] && !element.isVegan) {
          return false;
        } else if (filterMap["isGlutenFree"] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();

      print(filterMap["isVegetarian"].toString() +
          "  " +
          meals.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Meal Category"),
      ),
      body: GridView(
          padding: EdgeInsets.all(16),
          children: [
            ...DUMMY_CATEGORIES
                .map((e) =>
                CategoryItem(
                    e.id, e.title, e.color, meals, widget.pp, widget.favList))
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 200)),
      drawer: MainDrawer(setFilter, widget.pp, widget.favList),
    );
  }
}
