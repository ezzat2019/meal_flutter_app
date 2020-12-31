import 'package:flutter/material.dart';
import 'package:meal_flutter_app/screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_){
              return CategotyMeals(id: id,title: title,);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(.3), color]),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondensed'
            ),
          ),
        ),
      ),
    );
  }
}
