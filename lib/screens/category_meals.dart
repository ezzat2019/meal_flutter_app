import 'package:flutter/material.dart';
import 'package:meal_flutter_app/dummy_data.dart';
import 'package:meal_flutter_app/modules/meal.dart';
import 'package:meal_flutter_app/widgets/meal_Item.dart';

class CategotyMeals extends StatefulWidget {
  String id, title;

  CategotyMeals({this.id, this.title});

  @override
  _CategotyMealsState createState() => _CategotyMealsState(id, title);
}

class _CategotyMealsState extends State<CategotyMeals> {
  String id, title;
  List<Meal> mealsOfOneCategoty;

  _CategotyMealsState(this.id, this.title) {
    mealsOfOneCategoty = DUMMY_MEALS.where((meal) {
      print("yy");
      return meal.categories.contains(id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, pos) {
            return MealItem(mealsOfOneCategoty[pos]);

          },
          itemCount: mealsOfOneCategoty.length,
        ));
  }
}
