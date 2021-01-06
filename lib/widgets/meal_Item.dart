import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/modules/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  String complex, aff;
  final Function remove;

  MealItem(this.meal, this.remove) {
    if (meal.complexity == Complexity.Simple) {
      complex = "Simple";
    } else if (meal.complexity == Complexity.Hard) {
      complex = "Hard";
    } else if (meal.complexity == Complexity.Challenging) {
      complex = "Challenging";
    }

    if (meal.affordability == Affordability.Affordable) {
      aff = "Affordable";
    } else if (meal.affordability == Affordability.Luxurious) {
      aff = "Luxurious";
    } else if (meal.affordability == Affordability.Pricey) {
      aff = "Pricey";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => remove(context, meal),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 7,
        color: Colors.white,
        shadowColor: Colors.pink,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Image.network(
                      meal.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        color: Colors.black54,
                        width: 300,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          meal.title,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        Text(
                          " " + meal.duration.toString() + " min",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work_sharp),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          complex,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text(
                          aff,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


