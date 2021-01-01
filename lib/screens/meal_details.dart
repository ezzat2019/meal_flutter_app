import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/modules/meal.dart';

class MealDetails extends StatelessWidget {
  final Meal meal;

  MealDetails(this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  Text(
                    "ingredients",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "RobotoCondensed",
                        fontSize: 20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                          ,borderRadius: BorderRadius.circular(10)
                        ,border: Border.all(color:Colors.grey,)
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),

                    width: 300,
                    height: 150,
                    child: ListView.builder(itemBuilder: (_,index){

                      return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                          child: Text(meal.ingredients[index]),
                        ),
                      );
                    },itemCount: meal.ingredients.length,),
                  )
                  ,Text(
                    "Steps",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "RobotoCondensed",
                        fontSize: 20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white
                        ,borderRadius: BorderRadius.circular(10)
                        ,border: Border.all(color:Colors.grey,)
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),

                    width: 300,
                    height: 150,
                    child: ListView.builder(itemBuilder: (_,index){

                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text("#${index+1}"),
                            ),
                            title:Text(meal.steps[index]),

                            ),
                          Divider()
                        ],
                      );

                    },itemCount: meal.steps.length,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
