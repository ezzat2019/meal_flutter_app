import 'package:flutter/material.dart';
import 'package:meal_flutter_app/modules/meal.dart';
import 'package:meal_flutter_app/screens/meal_details.dart';
import 'package:meal_flutter_app/widgets/meal_Item.dart';

class CategotyMeals extends StatefulWidget {
  String id, title;
  final List<Meal> meals;
  Function pp;
  List<Meal> favList;

  CategotyMeals(this.id, this.title, this.meals, this.pp, this.favList);

  @override
  CategotyMealsState createState() => CategotyMealsState(id, title);
}

class CategotyMealsState extends State<CategotyMeals> {

  String id, title;
  List<Meal> mealsOfOneCategoty;


  CategotyMealsState(this.id, this.title) {

  }

  @override
  void initState() {
    mealsOfOneCategoty = widget.meals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
  }


  Function removeItem(value) {
    setState(() {
      mealsOfOneCategoty.removeWhere((element) => element.id == value);
    });
  }

  Function gotoDetails(BuildContext c, Meal meal) {
    setState(() {
      Navigator.of(c).push(MaterialPageRoute(builder: (_) {
        return MealDetails(meal, widget.pp, widget.favList);
      })).then((value) {
        if (value != null) {
          removeItem(value);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, pos) {
            print("yes");
            return MealItem(mealsOfOneCategoty[pos], gotoDetails);
          },
          itemCount: mealsOfOneCategoty.length,
        ));
  }
}
